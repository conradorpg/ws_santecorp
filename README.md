# ws_santecorp
Automação do Workstation Santé Corp

1 - A estória do começo
Antes de iniciarmos com as funcionalidades, precisamos saber como iremos trabalhar, para isso devemos nós fazer as seguintes perguntas junto ao PO.

Qual é o Produto?
Ex: Gestão do Workstation

Quais as funcionalidades?
Ex: Login, Agendamento, Atendimento, Logoff

Qual é a Estória
Ex: Login do Usuário

O que entra no Sprint 1?
Aqui definimos os 3 passos para realizar nossa automação.

1º - Qual a motivação da funcionalidade?
PARA que eu possa agendar e atender minhas consultas

2º - Quem é o ator que fará uso da funcionalidade?
SENDO um usuário cadastrado

3º - Qual é a funcionalidade em si?
PRECISO ter acesso ao sistema com meu dados

Descrição dos Cenários
Agora vamos criar baseado na estória e nas funcionalidades definidas pelo PO os nossos cenários que atendam esses requisitos.

Cenário 1: Email e senha corretos
DADO que eu acesso a página de login
QUANDO faço login com ”usuario.teste@santecorp.com.br” e “Mup01680”
ENTÃO devo receber a mensagem “Bem Vindo(a),”

Cenário 2: Email errado
DADO que eu acesso a página de login
QUANDO faço login com “eu@mail.net” e “Mup01680”
ENTÃO devo receber a mensagem “Houve um problema com o login, verifique suas credenciais.”

Cenário 3: Senha errada
DADO que eu acesso a página de login
QUANDO faço login com “usuario.teste@santecorp.com.br” e “111222”
ENTÃO devo receber a mensagem “Houve um problema com o login, verifique suas credenciais.”


Cenário 4: Email e Senha errados
DADO que eu acesso a página de login
QUANDO faço login com “eu@mail.net” e “111222”
ENTÃO devo receber a mensagem “Houve um problema com o login, verifique suas credenciais.”

2 - Configurando o ambiente
A partir de agora começamos a preparar o ambiente para podermos então atuar na nossa automação. Abaixo vamos descrever como se dará às instalações de cada componente.

Instalando a linguagem “Ruby” no sistema
Install Ruby (inserir aqui a instalação do Ruby)

Instalando o gerenciador de gems, “Bundler” no sistema
$ Gem install bundler

Criando o arquivo 'Gemfile'
$ bundle init

Editando o arquivo Gemfile
# frozen_string_literal: true
 
source "https://rubygems.org"
 
gem 'cucumber', '3.1.2'


Instalando as Gems pelo aquivo Gemfile
$ bundler install

Verificando a versão do Cucumber
$ cucumber --version

Criando a estrutura de pastas e arquivos
$ cucumber --init

Será criado a estrutura abaixo
features
features/step_definitions
features/support
features/support/env.rb

Criando as features
Nesses arquivos estarão escritos as funcionalidades definidas na estória feita junto ao PO

Criando o arquivo “login.feature” em ‘features/support/”
#language:pt
 
Funcionalidade: Login
   PARA que eu possa agendar e atender minhas consultas
   SENDO um usuário
   CONSIGO acesso ao sistema com meu dados cadastrados
 
Cenário: Email e senha cadastrados
   Dado que eu acesso a página de login
   Quando faço login com "usuario.teste@santecorp.com.br" e "Mup01680"
   Então devo receber a mensagem "Bem Vindo(a),"
 
Cenário: Email não cadastrado
   Dado que eu acesso a página de login
   Quando faço login com "eu@mail.net" e "Mup01680"
   Então devo receber a mensagem "Email inválido"
 
Cenário: Senha não cadastrada
   Dado que eu acesso a página de login
   Quando faço login com "usuario.teste@santecorp.com.br" e "111222"
   Então devo receber a mensagem "Senha inválida"
 
 
Cenário: Email e Senha não cadastrados
   Dado que eu acesso a página de login
   Quando faço login com "eu@mail.net" e "111222"
   Então devo receber a mensagem "Houve um problema com o login, verifique suas credenciais."



3 - Steps Definitions
Criando os passos do projeto

Após criar as features, execute o comando “cucumber” para que sejam criados os steps.
$ cucumber

Teremos o resultado como o exibido a seguir

You can implement step definitions for undefined steps with these snippets:

Dado("que eu acesso a página de login") do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando("faço login com {string} e {string}") do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

Então("devo ser autenticado com sucesso") do
  pending # Write code here that turns the phrase above into concrete actions
end

Então("receber a mensagem {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Então("devo receber a mensagem {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end


Mostrando todos os passos criados no arquivo .feature para que possamos implementar.

Agora então vamos criar o arquivo “login_steps.rb” em “features/step_definitions/”
e implementar as variáveis com nomes mais apropriados

Dado("que eu acesso a página de login") do
   pending # Write code here that turns the phrase above into concrete actions
 end
  Quando("faço login com {string} e {string}") do |email, senha|
   pending # Write code here that turns the phrase above into concrete actions
 end
  Então("devo ser autenticado com sucesso") do
   pending # Write code here that turns the phrase above into concrete actions
 end
  Então("devo receber a mensagem {string}") do |mensagem|
   pending # Write code here that turns the phrase above into concrete actions
 end


E executando mais uma vez “cucumber” no terminal, é exibido as seguintes informações.

# language: pt
Funcionalidade: Login
    PARA que eu possa agendar e atender minhas consultas
    SENDO um usuário
    CONSIGO acesso ao sistema com meu dados cadastrados

  Cenário: Email e senha cadastrados                                    	# features/support/login.feature:8
    Dado que eu acesso a página de login                                	# features/step_definitions/login_steps.rb:1
      TODO (Cucumber::Pending)
      ./features/step_definitions/login_steps.rb:2:in `"que eu acesso a página de login"'
      features/support/login.feature:9:in `Dado que eu acesso a página de login'
    Quando faço login com "usuario.teste@santecorp.com.br" e "Mup01680" 
# features/step_definitions/login_steps.rb:5
    Então devo receber a mensagem "Bem Vindo(a),"                 # features/step_definitions/login_steps.rb:13

  Cenário: Email não cadastrado                      		# features/support/login.feature:13
    Dado que eu acesso a página de login             		# features/step_definitions/login_steps.rb:1
      TODO (Cucumber::Pending)
      ./features/step_definitions/login_steps.rb:2:in `"que eu acesso a página de login"'
      features/support/login.feature:14:in `Dado que eu acesso a página de login'
    Quando faço login com "eu@mail.net" e "Mup01680" 	# features/step_definitions/login_steps.rb:5
    Então devo receber a mensagem "Email inválido"   # features/step_definitions/login_steps.rb:13

  Cenário: Senha não cadastrada                                       	# features/support/login.feature:18
    Dado que eu acesso a página de login                              	# features/step_definitions/login_steps.rb:1
      TODO (Cucumber::Pending)
      ./features/step_definitions/login_steps.rb:2:in `"que eu acesso a página de login"'
      features/support/login.feature:19:in `Dado que eu acesso a página de login'
    Quando faço login com "usuario.teste@santecorp.com.br" e "111222" # features/step_definitions/login_steps.rb:5
    Então devo receber a mensagem "Senha inválida"                    # features/step_definitions/login_steps.rb:13

  Cenário: Email e Senha não cadastrados                                                       # features/support/login.feature:24
    Dado que eu acesso a página de login                                                       # features/step_definitions/login_steps.rb:1
      TODO (Cucumber::Pending)
      ./features/step_definitions/login_steps.rb:2:in `"que eu acesso a página de login"'
      features/support/login.feature:25:in `Dado que eu acesso a página de login'
    Quando faço login com "eu@mail.net" e "111222"                                             # features/step_definitions/login_steps.rb:5
    Então devo receber a mensagem "Houve um problema com o login, verifique suas credenciais." # features/step_definitions/login_steps.rb:13


4 - Adicionando novas gems ao arquivo Gemfile
Retornamos ao arquivo Gemfile e implementamos as seguintes gems nele.
Não esqueça de travar as versões das gems, assim você assegura que elas não sejam atualizadas por versões que ainda não estejam estáveis, isso pode quebrar seu projeto.

# frozen_string_literal: true
 
source "https://rubygems.org"
 
gem 'capybara', '3.32.2'
gem 'cucumber', '3.1.2'
gem 'selenium-webdriver', '3.141.0'

A seguir vamos executar novamente o comando “bundler install” e instalar as novas gems ao projeto.

$ bundler install
Fetching gem metadata from https://rubygems.org/........
Resolving dependencies...
Installing regexp_parser 1.8.2
Using xpath 3.2.0
Using capybara 3.32.2
Using ffi 1.13.1
Using childprocess 0.9.0
Using cucumber-tag_expressions 1.1.1
Using gherkin 5.1.0
Using cucumber-core 3.2.1
Using cucumber-expressions 6.0.1
Using cucumber-wire 0.0.1
Using diff-lcs 1.4.4
Using multi_json 1.15.0
Using multi_test 0.1.2
Using cucumber 3.1.2
Using rubyzip 1.3.0
Fetching selenium-webdriver 3.141.0
Installing selenium-webdriver 3.141.0
Bundle complete! 3 Gemfile dependencies, 26 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.


5 - Configurando o ambiente de execução do projeto
Agora vamos configurar o arquivo “env.rb” que é responsável pela configuração inicial do projeto.

Primeiro passo é importar para o “env.rb” o “Capybara” e o “Cucumber” conforme abaixo
require 'capybara'
require 'capybara/cucumber'
 
Em seguida iremos configurar o Capybara para abrir o browser Google Chrome. Nosso arquivo ficará assim

require 'capybara'
require 'capybara/cucumber'
 
Capybara.configure do |config|
   config.default_driver = :selenium_chrome
end


6 - Instalando o ChromeDriver
Nesse momento do nosso projeto necessitamos instalar no nosso sistema o driver do Chrome, o qual iremos utilizar para realizar nossos testes.

Segue endereço do site onde vamos baixar o driver
https://chromedriver.chromium.org/downloads

Escolha o driver de acordo com a versão do seu navegador



Em seguida faça o download para o seu sistema operacional


Uma vez feito o download você deve copiá-lo para o local indicado abaixo.
Windows: c:\windows
Linux: /usr/local/bin

7 - Iniciando a automação
A seguir vamos começar a mapear os elementos para realizar o login no site. Nesse primeiro cenário o login é realizado com sucesso, então devemos preencher com os dados corretos.
Segue o código
Dado("que eu acesso a página de login") do
   visit 'https://dev-workstation.santecorp.com.br'
   page.windows[0].maximize
 end
  Quando("faço login com {string} e {string}") do |email, senha|
   find('#username').set email
   find('#password').set senha
   click_button 'Entrar'
 end
  Então("devo ser autenticado com sucesso") do
   pending # Write code here that turns the phrase above into concrete actions
 end
  Então("devo receber a mensagem {string}") do |mensagem|
   pending # Write code here that turns the phrase above into concrete actions
 end

Explicando os comandos
visit: carrega o site a ser testado.
page: com a função maximize, faz com que maximize o browser, isso é importante por conta de elementos que possam não ser exibidos em tela reduzida e assim quebrar nosso teste.
find: busca um elemento na página.
set: preenche o elemento com um texto definido.
click_button: executa a ação no botão especificado.


Dessa maneira já estamos dentro da página que desejamos testar, contudo necessitamos ainda validar esse acesso. É o que faremos a seguir.

8 - Validando o login
Para validar o login nós vamos utilizar uma outra “Gem”, a “Rspec”, ela é guiada a comportamento e vai nos ajudar a certificar que os elementos mapeados estão de fato sendo exibidos na tela.

Vamos então adicionar essa nova Gem ao nosso projeto conforme abaixo.
# frozen_string_literal: true
 
source "https://rubygems.org"
 
gem 'capybara', '3.32.2'
gem 'cucumber', '3.1.2'
gem 'selenium-webdriver', '3.141.0'
gem 'rspec', '3.9.0'

Feito isso vamos executar novamente o comando “bundle install”
$ bundle install

Devemos receber a mensagem de sucesso com o nosso novo Gemfile e suas dependências instaladas.
Bundle complete! 4 Gemfile dependencies, 31 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.

O próximo passo agora é encontrar um elemento na página para que possamos confirmar se realmente estamos na página correta. No nosso caso, vamos buscar o nome do usuário que usamos para realizar o login. 

Segue o código com o comando que vai validar nosso cenário.
Dado("que eu acesso a página de login") do
   visit 'https://dev-workstation.santecorp.com.br'
 end
  Quando("faço login com {string} e {string}") do |email, senha| 
   find('#username').set email
   find('#password').set senha
   click_button 'Entrar'
 end
  Então("devo receber a mensagem {string}") do |mensagem|
   sleep 5
   expect(page).to have_content mensagem
 end

Explicando os comandos
sleep: pede para o Capybara aguardar um tempo definido. Serve para fazermos pausas em nosso teste, a fim de verificar se tudo está ok até aquele ponto. Contudo aqui estamos utilizando o mesmo de forma não indicada, pois existem outras formas de pedir ao Capybara aguardar para que o elemento se torne visível na tela, mas por agora faremos desse jeito até que tenhamos instalado a Gem “Site Prism”.
expect: Comando do Rspec para validar um elemento da página


Para confirmar executamos o comando “cucumber” e verificamos o resultado do nosso teste.
$ cucumber

Cenário: Email e senha cadastrados                                   
   Dado que eu acesso a página de login                            
   Quando faço login com "usuario.teste@santecorp.com.br" e "Mup01680"
   Então devo receber a mensagem "Bem-vindo(a),"                      
 
1 scenario (1 passed)
3 steps (3 passed)
0m10.628s


Segue link da documentação com os comandos do Rspec utilizados para validar elementos.
https://rubydoc.info/github/teamcapybara/capybara/master/Capybara/RSpecMatchers

9 - Hooks
Implementando ações antes e depois dos cenários
Como nosso teste possui vários cenários e o Capybara testa toda a feature em uma mesma seção, em alguns momentos será necessário realizar tarefas após cada um dos cenários para que o cenário seguinte seja executado do zero, como é o nosso caso agora.

Uma vez que fizemos o login e testamos o primeiro cenário, para o cenário seguinte, vamos precisar voltar à tela de login. E para nós ajudar nessa tarefa criaremos o arquivo “hooks.rb”.

Para isso basta criar um arquivo em “features/support”



Neste arquivo vamos editar o nosso hook “After”, onde o que estiver ali descrito será executado após o cenário.

Segue o código utilizado para efetuar o logout após cenário.
After('@logout') do
   find('.Header__LinkLogout-ng42dh-14').click
end
Explicando o comando
@logout: nomenclatura da tag, dessa forma podemos utilizá-la em cenários definidos

Em seguida vamos inserir a tag “@logout” dentro da nossa feature.

@logout
Cenário: Email e senha cadastrados
   Dado que eu acesso a página de login
   Quando faço login com "usuario.teste@santecorp.com.br" e "Mup01680"
   Então devo receber a mensagem "Bem-vindo(a),"

Tendo feito isso já é possível executarmos todos os nossos cenários. E validá-los
@logout
@login_sucesso
Cenário: Email e senha cadastrados
   Dado que eu acesso a página de login
   Quando faço login com "usuario.teste@santecorp.com.br" e "Mup01680"
   Então devo receber a mensagem "Bem-vindo(a),"
 
@email_errado
Cenário: Email não cadastrado
   Dado que eu acesso a página de login
   Quando faço login com "eu@mail.net" e "Mup01680"
   Então devo receber a mensagem "Houve um problema com o login, verifique suas credenciais."
 
@senha_errada
Cenário: Senha não cadastrada
   Dado que eu acesso a página de login
   Quando faço login com "usuario.teste@santecorp.com.br" e "111222"
   Então devo receber a mensagem "Houve um problema com o login, verifique suas credenciais."
 
@email_senha_errados
Cenário: Email e Senha não cadastrados
   Dado que eu acesso a página de login
   Quando faço login com "eu@mail.net" e "111222"
   Então devo receber a mensagem "Houve um problema com o login, verifique suas credenciais."

Executando “cucumber”
$ cucumber

...recebemos os resultados
# language: pt
Funcionalidade: Login
   PARA que eu possa agendar e atender minhas consultas
   SENDO um usuário
   CONSIGO acesso ao sistema com meu dados cadastrados
 
 @logout 
 @login_sucesso
 Cenário: Email e senha cadastrados
   Dado que eu acesso a página de login     
   Quando faço login com "usuario.teste@santecorp.com.br" e "Mup01680" 
   Então devo receber a mensagem "Bem-vindo(a),"                      
 
 @email_errado
 Cenário: Email não cadastrado                                                                
   Dado que eu acesso a página de login                                                       
   Quando faço login com "eu@mail.net" e "Mup01680"                                           
   Então devo receber a mensagem "Houve um problema com o login, verifique suas credenciais."
 
 @senha_errada
 Cenário: Senha não cadastrada
   Dado que eu acesso a página de login     
   Quando faço login com "usuario.teste@santecorp.com.br" e "111222"                          
   Então devo receber a mensagem "Houve um problema com o login, verifique suas credenciais."
 
 @email_senha_errados
 Cenário: Email e Senha não cadastrados                                                      
   Dado que eu acesso a página de login                                                       
   Quando faço login com "eu@mail.net" e "111222"                                             
   Então devo receber a mensagem "Houve um problema com o login,     verifique suas credenciais."
 
4 scenarios (4 passed)
12 steps (12 passed)
0m33.166s

10 - Contexto
Implementando para passos que se repetem
O Contexto no Cucumber ou Background se nosso Gherkin estiver em inglês é utilizado quando temos um passo que é comum a todos os cenários, então para tornar o código mais enxuto e organizado implementamos essa funcionalidade que será executado para todos estes. 

Percebemos abaixo que o passo Dado que eu acesso a página de login foi removido de cada cenário e transportado para o Contexto.
#language:pt
 
Funcionalidade: Login
   PARA que eu possa agendar e atender minhas consultas
   SENDO um usuário
   CONSIGO acesso ao sistema com meu dados cadastrados
 
Contexto: Tela de Login
   Dado que eu acesso a página de login
 
@logout
@login_sucesso
Cenário: Email e senha cadastrados
   Quando faço login com "usuario.teste@santecorp.com.br" e "Mup01680"
   Então devo receber a mensagem "Bem-vindo(a),"
 
@email_errado
Cenário: Email não cadastrado
   Quando faço login com "eu@mail.net" e "Mup01680"
   Então devo receber a mensagem "Houve um problema com o login, verifique suas credenciais."
 
@senha_errada
Cenário: Senha não cadastrada
   Quando faço login com "usuario.teste@santecorp.com.br" e "111222"
   Então devo receber a mensagem "Houve um problema com o login, verifique suas credenciais."
 
@email_senha_errados
Cenário: Email e Senha não cadastrados   
   Quando faço login com "eu@mail.net" e "111222"
   Então devo receber a mensagem "Houve um problema com o login, verifique suas credenciais."
 
 
 
11 - Esquema do Cenário
Implementando a matriz de dados
Também conhecido como “Scenario Outline” no Gherkin em inglês, é uma matriz onde inserimos os dados que os passos irão utilizar. No nosso caso como os testes possuem um corpo semelhante, irá reduzir bem o nosso código.

Vejamos como ficou
Perceba que modificamos a posição dos cenários, ficando por último o cenário de login com sucesso, assim nossa automação fica mais próximo do comportamento do usuário nas tentativas de acesso, o que acabou tornando nosso código um pouco mais simples, uma vez que não foi necessário fazer uso do nosso hooks After, sendo então retirado a tag “@logout” da feature.

E aqui temos o resultado dos testes.


12 - Page Objects
Implementando o encapsulamento
Agora chegou o momento de organizarmos os elementos do nosso projeto, a fim de mantermos as coisas de forma mais simples. E para isso faremos uso do Page Objects, encapsulando os elementos e fazendo a chamada deles pelo Step Definitions, tornando mais simples refatorar o código, contemplando inclusive a reutilização dos mesmos. Mãos a obra!

Vamos criar o arquivo em “features/support”


Nesse arquivo vamos definir uma classe que se chamará “LoginPage” e dentro dessa classe vamos inserir um módulo chamado “realizar_login”, onde a partir de agora os mapeamentos dos elementos ficará. 

pages.rb
Nossa classe que inclui um módulo e com o mapeamento dos elementos incluso.
class LoginPage
   include Capybara::DSL
 
   def realizar_login(email, senha)
       find('#username').set email
       find('#password').set senha
       click_button 'Entrar'
   end
end

login_steps.rb
Nosso login_steps como está agora. Podemos ver a classe instanciada na primeira linha e dentro do passo “Quando”, a chamada do módulo.
login = LoginPage.new
 
Dado("que eu acesso a página de login") do
   visit 'https://dev-workstation.santecorp.com.br'
   page.windows[0].maximize
 end
  Quando("faço login com {string} e {string}") do |email, senha| 
   login.realizar_login(email, senha)
 end
  Então("devo receber a mensagem {string}") do |mensagem|
   sleep 5
   expect(page).to have_content mensagem
 end


13 - Reports
Implementando relatórios
Até agora nossos testes geraram resultados locais, mas o intuito deles é validar estórias para que se possa subir o software para produção. E para realizar essa ação, vamos aprender a criar os relatórios ou como também é conhecido os reports.

Vamos criar um novo arquivo na raiz do projeto, chamado “cucumber.yaml”. Neste arquivo vamos definir o comportamento padrão do comando “cucumber” no terminal 
---
default: --format html --out=report/features.html

Dessa maneira ao executarmos o comando será gerado um relatório no formato “html” na pasta “report” nomeado como “features.html”


14 - Screenshots
Anexando prints aos relatórios
Para tornar útil nossos relatórios vamos agora configurar os prints que iremos anexar no relatório, iremos também programar para que os nomes dos prints esteja dentro das boas práticas

Para isso devemos abrir o nosso arquivo, “hooks.rb” e inserir o código abaixo
After do |scenario|
   nome_cenario = scenario.name.gsub(/[^0-9A-Za-z ]/,'')
   nome_cenario = nome_cenario.gsub(' ', '_').downcase!
   screenshot = "report/screenshots/#{nome_cenario}.png"
   page.save_screenshot(screenshot)
   embed(screenshot, 'image/png', 'screenshot')
end

resultado dos nomes dos screenshots

E aqui o resultado do report gerado com todas as informações

Já com os screenshots de cada passo do teste
15 - Implementando o “cucumber.yaml”
Vamos agora implementar o nosso arquivo “cucumber.yaml”, inserindo algumas novas opções ao código.

Veja com ele deve ficar
---
default: -p html -p pretty
html: --format html --out=report/features.html
progress: --format progress
pretty: --format pretty

Explicando o código
default: aqui ficam os parâmetros a serem executados pelo comando “cucumber”
html: com esse parâmetro acionado, o cucumber gera um relatório em formato html e o está salvando na pasta “report” com o nome features.html
progress: essa opção oculta os passos e os substitui por um marcador para cada passo executado
pretty: essa opção é a padrão, onde são exibidos os cenários e os passos.

Agora nós podemos definir como desejamos que o nosso teste seja executado, existem outras opções que aos poucos iremos adicionar ao nosso projeto.


16 - Organizando nossa estrutura de pastas
Para tornar nosso projeto mais organizado iremos fazer algumas mudanças na estrutura de pastas, isso não altera em nada o funcionamento do que já foi feito bem como poderia ter sido feito logo no início, mas por questões de simplificar o aprendizado deixamos pra fazer agora. Então vamos ver o que mudou.

Abaixo como deve ficar a nossa estrutura.



O que foi modificado?
Criação da pasta “features/pages“
Nesta pasta ficarão as nossas pages, os arquivos responsáveis pelo mapeamento dos elementos, onde estão nossas classes e métodos. Percebam que o seu nome foi alterado, de pages.rb para login_page.rb seguindo o padrão do Capybara, é essencial manter os arquivos com os nomes desta forma.
Ex: login_page.rb

Criação da pasta “features/specs”
Nesta pasta ficam as nossas features, nosso BDD, reparem novamente na nomenclatura dos arquivos.
Ex: login.feature -> login_page.rb

17 - Site Prism, melhorando o Page Objects
Para estruturarmos ainda mais o nosso Page Objects, vamos implementar em nosso projeto mais uma DSL (Domain Specifc language), conhecida como Site Prism

Vamos adicioná-la em nosso arquivo Gemfile


E executar o comando $ bundle install e adicionar a funcionalidade ao nosso projeto.

Precisamos também inclui-lo em nosso arquivo env.rb assim com já fizemos anteriormente


Precisamos ainda refatorar o nosso código, uma vez que deixaremos de usar os comandos do Capybara para usar os do Site Prism,  segue o arquivo já modificado.

Explicando o código
método element: definimos um elemento e em seguida os parâmetros com seu nome “:campo_email” e o seletor “#username” correspondente.

E dentro do método “realizar_login” nós alteramos o código para, nome do elemento “botão_entrar” e a ação “.click” a ser executada. Em campos do tipo texto utilizamos a ação “.set” e o texto a ser preenchido.

Fizemos ainda uma outra mudança em nosso código, como podem perceber no método “set_url” definido com ‘/’. Essa barra é o caminho do path para acessar a página inicial, uma vez que já havíamos configurado a nossa url no arquivo env.rb em config.app_host, não precisamos repetir todo o endereço, como podemos ver abaixo.

E para finalizar fazemos a chamada dentro do nosso login_steps.rb, como na imagem a seguir.



