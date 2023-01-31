Ws Work

# Arquitetura:
Foi utilizado [Clean-Architecture] para desenvolver da melhor maneira, de maneira limpa e organizada, utilizando o conceito do [SOLID]. Utilizando TDD para quase toda a funcionalidade do sistema.

# Injeção de dependências
Escolhido foi [Provider] pela sua simplicidade, performance e alto reconhecimento na comunidade. Com [Provider] fica
mais simples e claro na hora de chamar as rotas e chamar as dependências necessárias para cada rota lembrando bem o [Modular].

# Rotas
Para ajudar nas rotas nomeadas e que trabalha bem com o [Provider] foi utilizado o [GoRouter] para fazer o gerenciamento das rotas do sistema.

# Gerenciamento de Estado
Para monitorar nosso estado atual do sistema foi utilizado o [Bloc] juntamente com o [Cubit] para deixa menos verboso e sem a utilização de classes para representar nosso [Estado] atual, que por sua vez é utilizado uma variável um [Enum] para facilitar tanto o entendimento quanto a quantidade de código.

# API
Para fazer requisições e recuperar os dados em [Json] foi utilizado o [Dio].

# OBS
Para ilustrar a figura dos carros na lista foi utilizado uma imagem única para representação, pois no [Json] recebido não trouxe essa informação. Criando um simples Ícone no [Figma] para Icon Launcher da aplicação e para um breve rascunho da aparência do [Aplicativo]