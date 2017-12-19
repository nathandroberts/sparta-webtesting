require 'capybara'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

session = Capybara::Session.new(:chrome)

session.visit('http://toolsqa.com/automation-practice-form/')

session.fill_in('firstname', with: 'John')
session.fill_in('lastname', with: 'Doe')

session.choose('sex-0')
session.choose('exp-6')

session.fill_in('datepicker', with: '01/01/1970')

session.find(:css, '#profession-0').click

session.select('Europe', from: 'continents')
seassion.click_button('submit')

sleep 4
