import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/config/routes/routes_app.dart';
import 'package:flutter_dev_test/constants/system_colors.dart';
import 'package:flutter_dev_test/core/network/dio_client.dart';
import 'package:flutter_dev_test/core/utils/snack_bar_utils.dart';
import 'package:flutter_dev_test/core/widgets/button_widget.dart';
import 'package:flutter_dev_test/core/widgets/circular_progress_widget.dart';
import 'package:flutter_dev_test/core/widgets/text_field_widget.dart';
import 'package:flutter_dev_test/features/login/domain/repositories/login_repository.dart';
import 'package:flutter_dev_test/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter_dev_test/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_dev_test/features/login/presentation/bloc/login_event.dart';
import 'package:flutter_dev_test/features/login/presentation/bloc/login_state.dart';
import 'package:flutter_dev_test/features/login/presentation/widgets/body_top_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(LoginUseCase(AuthRepositoryImpl(DioClient()))),
        child: _body(context),
      ),
    );
  }

  BlocConsumer<LoginBloc, LoginState> _body(BuildContext context) {
    final username = TextEditingController(text: '');
    final password = TextEditingController(text: '');

    String usernameValue = '';
    String passwordValue = '';

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) SnackBarUtils.show(context, message: state.error);
        if (state is LoginSuccess) _loginSuccess(context);
        if (state is LoginNoOTPSecret) _loginNoOTPSecret(context, username.text, password.text);
        if (state is LoginPasswordValue) passwordValue = state.password;
        if (state is LoginUserNameValue) usernameValue = state.usermame;
      },
      builder: (context, state) {
        return Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const BodyTopWidget(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Column(
                          children: [
                            SizedBox(height: 37.sp),
                            _inputEmail(context, username),
                            SizedBox(height: 10.sp),
                            _inputPw(context, password),
                            SizedBox(height: 20.sp),
                            _button(context, usernameValue, passwordValue),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: _pwLost(context),
                  ),
                ),
              ],
            ),
            if (state is LoginLoading) const CircularProgressWidget(),
          ],
        );
      },
    );
  }

  TextFildWidget _inputEmail(BuildContext context, TextEditingController username) {
    return TextFildWidget(
      labelText: 'E-mail',
      controller: username,
      onChanged: (value) => context.read<LoginBloc>().add(LoginUsernameChanged(value)),
    );
  }

  TextFildWidget _inputPw(BuildContext context, TextEditingController password) {
    return TextFildWidget(
      labelText: 'Senha',
      controller: password,
      onChanged: (value) => context.read<LoginBloc>().add(LoginPasswordChanged(value)),
    );
  }

  ButtonWidget _button(BuildContext context, String username, String password) {
    return ButtonWidget(
      text: 'Entrar',
      onTap: () {
        if (username.isEmpty || password.isEmpty) return;
        FocusManager.instance.primaryFocus?.unfocus();
        context.read<LoginBloc>().add(LoginSubmitted(username, password));
      },
    );
  }

  Padding _pwLost(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 38.sp),
      child: Text(
        'Esqueci a senha',
        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: SystemColors.primaryColor),
      ),
    );
  }

  void _loginSuccess(BuildContext context) {
    Navigator.pushNamed(context, RoutesApp.homePage);
  }

  void _loginNoOTPSecret(BuildContext context, String username, String password) {
    Navigator.pushNamed(context, RoutesApp.otpPage, arguments: {'username': username, 'password': password});
  }
}
