require 'spec_helper'

describe 'testing the demoqa registration page' do

  before(:all) do
    @driver = SeleniumDemoReg.new
    @driver.access_registration_form
  end

  context 'positive paths for the registration form and register' do

    it 'should land on the registration for page' do
      expect(@driver.current_url).to eq('http://demoqa.com/registration/')
    end

    it 'should accept a first name' do
      @driver.set_first_name_field('Richard')

      expect(@driver.first_name_field_displayed).to eq(true)
      expect(@driver.get_first_name_field_value).to eq('Richard')
    end

    it 'should accept a last name' do
      @driver.set_last_name_field('Gurney')

      expect(@driver.last_name_field_displayed).to eq(true)
      expect(@driver.get_last_name_field_value).to eq('Gurney')

    end

    it 'should accept a marital status selection of Single, Married, or Divorced' do
      @driver.select_marital_option
    end

    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
      @driver.select_hobby_option
    end

    it 'should have a country default of Afghanistan' do
      expect(@driver.get_selected_country[0]['value']).to eq('Afghanistan'), "expected: #{@driver.get_selected_country[0]['value']}, to eq Afghanistan"
    end

    it 'accept a new DOB' do
      @driver.dob_month_list_select
      @driver.dob_day_list_select
      @driver.dob_year_list_select
    end

    it 'should accept a new country value' do
      @driver.country_dropdown_list_select('Slovenia')
    end

    it 'should accept a valid phone number' do
      @driver.set_phone_number_field('07463284528')
      # expect(@driver.valid_phone_number_checker).to eq(''), "expected -#{@driver.valid_phone_number_checker} - to be empty"
      expect(@driver.get_phone_number_field_value.length).to be > 10, "expect #{@driver.get_phone_number_field_value.length} to be >10"

    end

    it 'should accept a username' do
      @driver.set_user_name_field("username_#{rand(99999999)}")
    end

    it 'should accept an email' do
      @driver.set_email_field("test_email#{rand(999999999)}@website.com")
    end

    it 'should accept a about yourself text' do
      @driver.set_about_yourself_field('This is a description used to test the form')
    end

    it 'should accept a password' do
      @driver.set_password_field('T4stInp3t43')
    end

    it 'should accept a password confirmation' do
      @driver.set_confirmation_password_field('T4stInp3t43')
    end

    it 'should accept submit button' do
      @driver.click_submit
    end

    # it 'should successfully register' do
    #   expect(@driver.check_registration_successful).to be true
    # end

  end

end
