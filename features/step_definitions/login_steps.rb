login = LoginPage.new

Dado("que eu acesso a página de login") do
    login.load
    page.windows[0].maximize
  end
  
  Quando("faço login com {string} e {string}") do |email, senha|  
    login.realizar_login(email, senha)
  end
  
  Então("devo receber a mensagem {string}") do |mensagem|
    sleep 5
    expect(page).to have_content mensagem
  end
