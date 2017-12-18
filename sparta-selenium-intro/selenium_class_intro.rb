require 'selenium-webdriver'

class SeleniumQatoolsForm
  PRACTICE_FORM_URL = 'http://toolsqa.com/automation-practice-form/'
  FIRST_NAME_FIELD_NAME = 'firstname'
  LAST_NAME_FIELD_NAME = 'lastname'
  MALE_SEX_FIELD_ID = 'sex-0'
  EXPERIENCE_FIELD_ID = 'exp-0'
  DATE_FIELD_ID = 'datepicker'
  PROFESSION_FIELD_ID = 'profession-1'
  TOOL_FIELD_ID = 'tool-2'
  CONTINENTS_FIELD_ID = 'continents'
  COMMANDS_FIELD_ID = 'selenium_commands'


  def initialize
    @chrome_driver = Selenium::WebDriver.for :chrome
  end
  def visit_practice_form
    @chrome_driver.get(PRACTICE_FORM_URL)
  end

  def input_firstname_field(text)
    @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME).send_keys(text)
  end

  def input_lastname_field(text)
    @chrome_driver.find_element(:name, LAST_NAME_FIELD_NAME).send_keys(text)
  end

  def input_sex_radio
    @chrome_driver.find_element(:id, MALE_SEX_FIELD_ID).click
  end

  def input_experience_radio
    @chrome_driver.find_element(:id, EXPERIENCE_FIELD_ID).click
  end

  def input_date_id(text)
    @chrome_driver.find_element(:id, DATE_FIELD_ID).send_keys(text)
  end

  def input_profession_radio
    @chrome_driver.find_element(:id, PROFESSION_FIELD_ID).click
  end

  def input_tool_radio
    @chrome_driver.find_element(:id, TOOL_FIELD_ID).click
  end

  def input_continents_select
    select_ = @chrome_driver.find_element(:id, CONTINENTS_FIELD_ID)
    all_options = select_.find_elements(:tag_name, "option")
    all_options.each {|option| if option.text == 'North America'; option.click end}

  end

  def input_commands_select
    all = @chrome_driver.find_element(:id, COMMANDS_FIELD_ID)
    all_options = all.find_elements(:tag_name, "option")
    all_options[1].click
    sleep 2
  end
  def what_name
    p @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME)['value']
  end

end
practice_form_page = SeleniumQatoolsForm.new
practice_form_page.visit_practice_form
practice_form_page.input_firstname_field('Richard')
practice_form_page.input_lastname_field('Gurney')
practice_form_page.input_sex_radio
practice_form_page.input_experience_radio
practice_form_page.input_date_id('18/12/2017')
practice_form_page.input_tool_radio
practice_form_page.input_continents_select
practice_form_page.input_commands_select
practice_form_page.what_name
