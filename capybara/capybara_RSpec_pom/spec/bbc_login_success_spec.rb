require 'spec_helper'

describe 'Correct user details produces no error' do

  context 'it should sign in when correct details are input' do
    after(:all)do
      Capybara.current_session.driver.quit 
    end

    it "should allow a successful login" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username('nroberts@spartaglobal.com')
      @bbc_site.bbc_sign_in_page.fill_in_password('Password4test')
      @bbc_site.bbc_sign_in_page.click_sign_in_button
    end
  end

end
