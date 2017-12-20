require 'spec_helper'

describe 'Correct sign up details creates account and signs in user' do

  context 'it should sign up when correct details are input' do

    after(:all)do
      Capybara.current_session.driver.quit
    end

    it 'should sign up successfully' do

      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link
      @bbc_site.bbc_signup_page.fill_in_day('1')
      @bbc_site.bbc_signup_page.fill_in_month('1')
      @bbc_site.bbc_signup_page.fill_in_year('1896')
      @bbc_site.bbc_signup_page.click_continue_button
      @bbc_site.bbc_signup_page.fill_in_email('testemail@gmail.com')
      @bbc_site.bbc_signup_page.fill_in_password('Password4test')
      @bbc_site.bbc_signup_page.fill_in_postcode('TW8 9LB')
      @bbc_site.bbc_signup_page.select_gender
      @bbc_site.bbc_signup_page.click_no_thanks_button
      @bbc_site.bbc_signup_page.click_register_button
    end

  end

end
