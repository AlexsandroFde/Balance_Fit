# Balance Fit

Balance Fit é um aplicativo desenvolvido em Flutter que auxilia os usuários a calcular a ingestão diária recomendada de calorias com base no seu perfil físico e objetivos de saúde. O aplicativo é projetado com uma interface intuitiva e responsiva, proporcionando uma experiência de usuário agradável.

## Funcionalidades

- **Cálculo de Calorias:** O aplicativo calcula as calorias diárias recomendadas usando a Fórmula Revisada de Harris-Benedict, levando em conta peso, altura, idade, gênero, nível de atividade física e objetivo (perda ou ganho de peso).
- **Histórico de Cálculos:** Os usuários podem visualizar o último cálculo realizado e os detalhes associados.

## Tecnologias Utilizadas

- **Flutter:** Framework para desenvolvimento de aplicativos móveis.
- **Dart:** Linguagem de programação utilizada para construir o aplicativo.
- **Provider:** Gerenciamento de estado para facilitar a troca de informações entre diferentes partes do aplicativo.
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

3. Execute o aplicativo:
   ```bash
   flutter run
   ```