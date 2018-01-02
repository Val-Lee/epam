require "spec_helper"
require 'selenium-webdriver'

describe 'singaporeair' do

  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @base_url = 'http://www.singaporeair.com/'
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @driver.get(@base_url)
  end

  after(:each) do
    @driver.quit
  end

  it 'case 1' do
    @driver.find_element(:id, 'city-1').clear
    @driver.find_element(:id, 'city-1').send_keys 'Singapore - SIN'
    @driver.find_element(:id, 'city-1').click
    @driver.find_element(:id, 'city-travel-input-2').click
  end

end
