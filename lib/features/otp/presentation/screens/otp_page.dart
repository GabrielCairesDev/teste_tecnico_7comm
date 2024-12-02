import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/constants/text_colors.dart';
import 'package:flutter_dev_test/core/network/dio_client.dart';
import 'package:flutter_dev_test/core/utils/snack_bar_utils.dart';
import 'package:flutter_dev_test/core/widgets/app_bar_widget.dart';
import 'package:flutter_dev_test/core/widgets/button_widget.dart';
import 'package:flutter_dev_test/core/widgets/circular_progress_widget.dart';
import 'package:flutter_dev_test/core/widgets/text_field_otp_widget.dart';
import 'package:flutter_dev_test/features/otp/domain/repositories/otp_repository.dart';
import 'package:flutter_dev_test/features/otp/domain/usecases/otp_usecase.dart';
import 'package:flutter_dev_test/features/otp/presentation/bloc/otp_bloc.dart';
import 'package:flutter_dev_test/features/otp/presentation/bloc/otp_event.dart';
import 'package:flutter_dev_test/features/otp/presentation/bloc/otp_state.dart';
import 'package:flutter_dev_test/features/otp/presentation/widgets/help_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String username = args['username'];
    final String password = args['password'];

    return Scaffold(
      appBar: const AppBarWidget(),
      body: BlocProvider(
        create: (context) => OtpBloc(OtpUsecase(OtpRepositoryImpl(DioClient()))),
        child: Builder(
          builder: (context) => _body(context, username, password),
        ),
      ),
    );
  }

  BlocConsumer<OtpBloc, OtpState> _body(BuildContext context, String username, String password) {
    final List<TextEditingController> controllers = List.generate(6, (_) => TextEditingController());
    final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
    String otp = '';

    return BlocConsumer<OtpBloc, OtpState>(
      listener: (context, state) {
        if (state is OtpFailure) SnackBarUtils.show(context, message: state.error);
        if (state is OtpSuccess) Navigator.of(context).pop();
        if (state is OtpValue) otp = state.otp;
      },
      builder: (context, state) {
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.sp),
                    _title(context),
                    _subTitle(context),
                    SizedBox(height: 73.sp),
                    TextFieldOtpWidget(
                      controllers: controllers,
                      focusNodes: focusNodes,
                      onChanged: (String p0) {
                        context.read<OtpBloc>().add(OtpChanged(p0));
                      },
                    ),
                    SizedBox(height: 32.sp),
                    _button(context, username, password, otp),
                    SizedBox(height: 40.sp),
                    const HelpWidget(),
                  ],
                ),
              ),
            ),
            if (state is OtpLoading) const CircularProgressWidget(),
          ],
        );
      },
    );
  }

  ButtonWidget _button(BuildContext context, String username, String password, String otp) {
    return ButtonWidget(
      enabled: (otp.length == 6),
      text: 'Confirmar',
      onTap: () => context.read<OtpBloc>().add(OtpSubmitted(username, password, otp)),
    );
  }

  Text _title(BuildContext context) {
    return Text('Verificação', style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 20)); // fonte w500 não funciona
  }

  Text _subTitle(BuildContext context) {
    return Text(
      'Insira o código que foi enviado:',
      style: Theme.of(context).textTheme.labelLarge!.copyWith(color: TextColors.secondary),
    );
  }
}
