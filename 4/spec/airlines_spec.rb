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
    @depart_date.clear
    @depart_date.send_keys DEPART_DATE
    clear_popouts
    search
    list_of_fligths = @driver.find_element(:xpath, "//*[@id='main-inner']/div[1]/h2").text
    expect(list_of_fligths).to eq('Select alternative date(s)')
  end

  it 'case 4' do
  set_class('firstSuite')
   direction('Singapore - SIN', 'Riga - RIX')
   set_dates(DEPART_DATE, RETURN_DATE)
  passangers_count(3, 1, 0)
   search
   error_msg = @driver.find_element(:xpath, "//*[@id='travel-widget']/div/div/div[1]/div/div[1]/div[2]/div/div[2]/p").text
   expect(error_msg).to include('you may only be able to book a maximum of 2 tickets in First Class')
  end

  it 'case 5' do
  	set_type('one-way')
    flexible_dates
    direction('Singapore - SIN', 'Beijing - PEK')
    @depart_date.clear
    @depart_date.send_keys DEPART_DATE
    clear_popouts
    # @driver.find_element(:id, 'city-travel-checkbox-6').click
    passangers_count(2, 0, 0)
    search
    list_of_fligths = @driver.find_element(:xpath, "//*[@id='main-inner']/div[3]/h2").text
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
