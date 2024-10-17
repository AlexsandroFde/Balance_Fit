# Balance Fit

Balance Fit é um aplicativo desenvolvido em Flutter que auxilia os usuários a calcular a ingestão diária recomendada de calorias com base no seu perfil físico e objetivos de saúde. O aplicativo é projetado com uma interface intuitiva e responsiva, proporcionando uma experiência de usuário agradável.

## Funcionalidades

- **Cálculo de Calorias:** O aplicativo calcula as calorias diárias recomendadas usando a Fórmula Revisada de Harris-Benedict, levando em conta peso, altura, idade, gênero, nível de atividade física e objetivo (perda ou ganho de peso).
- **Histórico de Cálculos:** Os usuários podem visualizar o último cálculo realizado e os detalhes associados.

## Tecnologias Utilizadas

- **Flutter:** Framework para desenvolvimento de aplicativos móveis.
- **Dart:** Linguagem de programação utilizada para construir o aplicativo.
- **Shared Preferences:** Armazenamento local para salvar o histórico de cálculos.

## Instalação

Para executar o projeto localmente, siga as instruções abaixo:

1. Clone o repositório:
   ```bash
   git clone https://github.com/AlexsandroFde/Balance_Fit
   cd Balance_Fit
   ```

2. Instale as dependências:
   ```bash
   flutter pub get
   ```

## Execute o aplicativo

### No Android Studio
- Abra o Android Studio e selecione **Open an existing project**.
- Navegue até a pasta do projeto (Balance_Fit) e clique em OK.
- No menu superior, clique em **Run** e selecione **Run 'main.dart'**.
- Certifique-se de que um emulador ou dispositivo físico esteja conectado e selecionado.

### No Visual Studio Code
- Abra o Visual Studio Code e selecione **File > Open Folder...**.
- Navegue até a pasta do projeto (Balance_Fit) e clique em Open.
- No terminal integrado, execute:
   ```bash
   flutter run
   ```
- Certifique-se de que um emulador ou dispositivo físico esteja conectado.