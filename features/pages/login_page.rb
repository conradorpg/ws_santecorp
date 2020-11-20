class LoginPage < SitePrism::Page
    set_url '/'

    element :campo_email, '#username'
    element :campo_senha, '#password'
    element :botao_entrar, '.login__SubmitButton-crmd3y-10'

    def realizar_login(email, senha)
        campo_email.set email
        campo_senha.set senha
        botao_entrar.click
    end
end
