require 'spec_helper'

describe 'Incorrect sign up details produces a valid error' do

  context 'it should respond with the correct error when incorrect details are input' do

    it 'should produce an error when inputting an incorrect dob' do

      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link
      @bbc_site.bbc_signup_page.fill_in_day('32')
      @bbc_site.bbc_signup_page.fill_in_month('13')
      @bbc_site.bbc_signup_page.fill_in_year('1')
      @bbc_site.bbc_signup_page.click_continue_button

      expect(@bbc_site.bbc_signup_page.date_error_text).to eq("Oops, that date doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009.")
    end

    it 'should produce an error when inputting an incorrect email' do

      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link
      @bbc_site.bbc_signup_page.fill_in_day('1')
      @bbc_site.bbc_signup_page.fill_in_month('1')
      @bbc_site.bbc_signup_page.fill_in_year('1896')
      @bbc_site.bbc_signup_page.click_continue_button
      @bbc_site.bbc_signup_page.fill_in_email('testemail@@gmail.com')
      @bbc_site.bbc_signup_page.fill_in_password('Password4test')
      @bbc_site.bbc_signup_page.fill_in_postcode('TW8 9LB')
      @bbc_site.bbc_signup_page.select_gender
      @bbc_site.bbc_signup_page.click_no_thanks_button
      @bbc_site.bbc_signup_page.click_register_button

      expect(@bbc_site.bbc_signup_page.incorrect_email_text).to eq("Sorry, that doesn't look right. Please check it's a proper email.")

    end

  end

end
