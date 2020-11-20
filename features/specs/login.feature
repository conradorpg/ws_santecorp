#language:pt

Funcionalidade: Login
    PARA que eu possa agendar e atender minhas consultas
    SENDO usuário do cadastrado
    PRECISO ter acesso ao sistema com meus dados

Contexto: Tela de Login
    Dado que eu acesso a página de login

Esquema do Cenário: Realizando login
    Quando faço login com "<email>" e "<senha>"
    Então devo receber a mensagem "<mensagem>"

Exemplos:
|email                          |senha     |mensagem                                                  |
|eu@mail.net                    |Mup01680  |Houve um problema com o login, verifique suas credenciais.|
|usuario.teste@santecorp.com.br |111222    |Houve um problema com o login, verifique suas credenciais.|
|eu@mail.net                    |111222    |Houve um problema com o login, verifique suas credenciais.|
|usuario.teste@santecorp.com.br |Mup01680  |Ativar notificação sonora                                 |