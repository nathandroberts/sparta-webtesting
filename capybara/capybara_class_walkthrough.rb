require 'capybara/dsl'

class BbcHomepage

  HOMEPAGE_URL = 'https://www.bbc.co.uk/'
  SIGN_IN_LINK_ID = '#idcta-link'
  USERNAME_FIELD_ID = 'user-identifier-input'
  PASSWORD_FIELD_ID = 'password-input'
  SUBMIT_BUTTON = '#submit-button'

  def initialize
    Capybara.register_driver :chrome do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end
    @driver = Capybara::Session.new(:chrome)
  end

  def visit_home_page
    @driver.visit(HOMEPAGE_URL)
  end

  def click_sign_in
    @driver.find(SIGN_IN_LINK_ID).click
  end

  def enter_username(username)
    @driver.fill_in(USERNAME_FIELD_ID, with: username)
  end

  def enter_password(password)
    @driver.fill_in(PASSWORD_FIELD_ID, with: password)
  end

  def click_submit
    @driver.find(SUBMIT_BUTTON).click
  end

end

x = BbcHomepage.new
x.visit_home_page
x.click_sign_in
x.enter_username('nroberts@spartaglobal.com')
x.enter_password('Password4test')
x.click_submit
