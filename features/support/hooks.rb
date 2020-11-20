After('@logout') do
    find('.Header__LinkLogout-ng42dh-14').click
end

After do |scenario|
    nome_cenario = scenario.name.gsub(/[^0-9A-Za-z ]/,'')
    nome_cenario = nome_cenario.gsub(' ', '_').downcase!
    screenshot = "report/screenshots/#{nome_cenario}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'screenshot')
end 