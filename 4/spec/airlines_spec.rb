require 'spec_helper'
require 'selenium-webdriver'

describe 'singaporeair' do

  before(:each) do
    init
  end

  after(:each) do
    sleep 5
    @driver.quit
  end

  it 'case 1' do
    direction('Singapore - SIN', 'Lisbon - LIS')
    set_dates(DEPART_DATE, RETURN_DATE)
    search
    list_of_fligths = @driver.find_element(:xpath, "//*[@id='main-inner']/div[2]/h2").text
    expect(list_of_fligths).to eq('Select flights')
  end

  it 'case 2' do
    direction('Singapore - SIN', 'Milan - MXP')
    set_dates(DEPART_DATE, DEPART_DATE)
    search
    list_of_fligths = @driver.find_element(:xpath, "//*[@id='main-inner']/div[1]/h2").text
    expect(list_of_fligths).to eq('Select alternative date(s)')
  end

  it 'case 3' do
    set_class('business')
    set_type('one-way')
    direction('Singapore - SIN', 'Moscow - DME')
    @driver.find_element(:id, 'city-travel-start-day-2').clear
    @driver.find_element(:id, 'city-travel-start-day-2').send_keys DEPART_DATE
    # clear_popouts
    search
    list_of_fligths = @driver.find_element(:xpath, "//*[@id='main-inner']/div[1]/h2").text
    expect(list_of_fligths).to eq('Select alternative date(s)')
  end

  it 'case 4' do
    direction('Singapore - SIN', 'Lisbon - LIS')
    set_dates
    search
    list_of_fligths = @driver.find_element(:xpath, "//*[@id='main-inner']/div[2]/h2").text
    expect(list_of_fligths).to eq('Select flights')
  end

  it 'case 5' do
    direction('Singapore - SIN', 'Lisbon - LIS')
    set_dates
    search
    list_of_fligths = @driver.find_element(:xpath, "//*[@id='main-inner']/div[2]/h2").text
    expect(list_of_fligths).to eq('Select flights')
  end

  it 'case 6' do
    direction('Singapore - SIN', 'Lisbon - LIS')
    set_dates
    search
    list_of_fligths = @driver.find_element(:xpath, "//*[@id='main-inner']/div[2]/h2").text
    expect(list_of_fligths).to eq('Select flights')
  end

  it 'case 7' do
    direction('Singapore - SIN', 'Lisbon - LIS')
    set_dates
    search
    list_of_fligths = @driver.find_element(:xpath, "//*[@id='main-inner']/div[2]/h2").text
    expect(list_of_fligths).to eq('Select flights')
  end

  it 'case 7' do
    direction('Singapore - SIN', 'Lisbon - LIS')
    set_dates
    search
    list_of_fligths = @driver.find_element(:xpath, "//*[@id='main-inner']/div[2]/h2").text
    expect(list_of_fligths).to eq('Select flights')
  end
end
