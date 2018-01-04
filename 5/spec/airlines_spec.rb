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
    clear_popouts
    search
    list_of_fligths = @driver.find_element(:xpath, "//*[@id='main-inner']/div[3]/h2").text
    expect(list_of_fligths).to eq('Select flights')
  end

  it 'case 2' do
    direction('Singapore - SIN', 'Milan - MXP')
    set_dates(DEPART_DATE, DEPART_DATE)
    clear_popouts
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
    clear_popouts
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
    passangers_count(2, 0, 0)
    search
    list_of_fligths = @driver.find_element(:xpath, "//*[@id='main-inner']/div[1]/h2").text
    expect(list_of_fligths).to eq('Select alternative date(s)')
  end

  it 'case 6' do
    @driver.find_element(:id, 'multiCitySearchHome').click
    from = @driver.find_element(:id, 'aflight-1')
    from.clear
    from.send_keys 'Moscow - DME'
    to = @driver.find_element(:id, 'aflight-3')
    to.clear
    to.send_keys 'Riga - RIX'
    date = @driver.find_element(:id, 'aflight-start-day')
    date.clear
    date.send_keys DEPART_DATE
    @driver.find_element(:id, 'flight-retrieve-1').click
    to_clone = @driver.find_element(:name, 'clone-to-flight-0-1')
    to_clone.clear
    to_clone.send_keys 'Venice - VCE'
    date_clone = @driver.find_element(:id, 'clone-date-flight-0-1')
    date_clone.clear
    date_clone.send_keys RETURN_DATE
    @driver.find_element(:id, 'flight-retrieve-4').click
    sleep(2)
    error_msg = @driver.find_element(:xpath, "//*[@id='main-inner']/div[3]/div/div/div[2]/p").text
    expect(error_msg).to include('There are no flights')
  end

  it 'case 7' do
    @driver.find_element(:id, 'travel-radio-2').click
    # sleep(2)
    @driver.find_element(:xpath, '//*[@id="city1-radio-5"]').click
    depart_date = @driver.find_element(:xpath, '//*[@id="city1-travel-start-day-2"]')
    depart_date.clear
    depart_date.send_keys DEPART_DATE
    clear_popouts
    from = @driver.find_element(:id, 'city1-1')
    from.clear
    from.send_keys 'Singapore - SIN'
    from.click
    to = @driver.find_element(:id, 'city1-2')
    to.clear
    to.send_keys 'Adelaide, Australia (Adelaide Intl - ADL)'
    to.click
    clear_popouts
    sleep(2)
    @driver.find_element(:name, '_eventId_loginForORB').click
    sleep(5)
    popout_window = @driver.find_element(:xpath, "//*[@id='kfLoginPopupHeader']/h2").text
    expect(popout_window).to include('Log in')
  end

  it 'case 8' do
    @driver.find_element(:xpath, '//*[@id="travel-widget"]/div/div/div[1]/ul/li[2]/a/span[2]').click
    destination = @driver.find_element(:id, 'hotel-1')
    destination.clear
    destination.send_keys 'Abu Dhabi, United Arab Emirates'
    check_in = @driver.find_element(:id, 'hotel-travel-start-day')
    check_in.clear
    check_in.send_keys DEPART_DATE
    check_out = @driver.find_element(:id, 'hotel-travel-return-day')
    check_out.clear
    check_out.send_keys RETURN_DATE
    @driver.find_element(:id, 'hotel-search').click
    sleep(5)
    @driver.switch_to.window( @driver.window_handles.last )
    url = @driver.current_url
    expect(url).to include('www.agoda.com')
  end

    it 'case 9' do
    @driver.find_element(:xpath, '//*[@id="travel-widget"]/div/div/div[1]/ul/li[3]/a/span[2]').click
    city = @driver.find_element(:id, 'car-1')
    city.clear
    city.send_keys 'Singapore Changi International Airport(SIN), Singapore'
    car_pickup = @driver.find_element(:id, 'car-pickup')
    car_pickup.clear
    car_pickup.send_keys DEPART_DATE
    clear_popouts
    car_dropoff = @driver.find_element(:id, 'car-dropoff')
    car_dropoff.clear
    car_dropoff.send_keys RETURN_DATE
    clear_popouts
    @driver.find_element(:id, 'car-search').click
    @driver.switch_to.window( @driver.window_handles.last )
    url = @driver.current_url
    search_car = @driver.find_element(:xpath, "//*[@id='searchAgainTop']/div/h2").text
    expect(search_car).to include('Search for Car Hire')
  end

end
