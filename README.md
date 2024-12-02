# Teste Técnico 7Com

Este repositório contém a implementação do teste técnico solicitado pela 7Com. O projeto foi desenvolvido utilizando **Flutter**, com foco em **responsividade** e seguindo os padrões de design fornecidos no **Figma**.

## Link para as Instruções do Teste

As instruções completas podem ser encontradas no repositório oficial: [Instruções do teste](https://github.com/lucasakio/flutter_dev_test?tab=readme-ov-file)

## Pacotes Utilizados

Abaixo estão os principais pacotes utilizados no desenvolvimento deste projeto:

- **[flutter_screenutil](https://pub.dev/packages/flutter_screenutil)**: Utilizado para garantir a responsividade da interface, adaptando o tamanho dos elementos da UI com base nas dimensões de diferentes dispositivos.
- **[flutter_svg](https://pub.dev/packages/flutter_svg)**: Pacote utilizado para renderizar arquivos SVG, garantindo melhor performance e flexibilidade.
- **[flutter_bloc](https://pub.dev/packages/flutter_bloc)**: Utilizado para gerenciar o estado da aplicação de forma eficiente utilizando o padrão BLoC.
- **[dartz](https://pub.dev/packages/dartz)**: Pacote que implementa tipos funcionais, como `Option` e `Either`, para melhorar a segurança e legibilidade do código.
- **[dio](https://pub.dev/packages/dio)**: Biblioteca de requisições HTTP, utilizada para facilitar a comunicação com APIs externas.

## Instruções para Execução

1. Inicie a API:
   - Acesse o diretório da API e execute o script:  
     `cd \api\`  
     `python app.py`

2. Inicie o app Flutter:
   - Caso precise mudar a URL base para a comunicação com a API, edite o arquivo localizado em:  
     `\lib\constants\endpoint.dart`
   - Altere a linha correspondente à `baseUrl`:  
     `baseUrl = 'http://10.0.2.2:5000'`
