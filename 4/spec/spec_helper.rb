require 'selenium-webdriver'

DEPART_DATE = (Time.now + 4*24*60*60).strftime('%d/%m/%Y')
RETURN_DATE = (Time.now + 14*24*60*60).strftime('%d/%m/%Y')
CLASSES = {:economy => 'Economy', :premium_economy => 'Premium Economy', :business => 'Business', :first => 'First / Suites'}
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end


  config.shared_context_metadata_behavior = :apply_to_host_groups

  def init
    @driver = Selenium::WebDriver.for :chrome
    @base_url = 'http://www.singaporeair.com/'
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 60
    @driver.get(@base_url)
  end

  def direction(from, to)
    @driver.find_element(:id, 'city-1').clear
    @driver.find_element(:id, 'city-1').send_keys from
    @driver.find_element(:id, 'city-1').click
    @driver.find_element(:id, 'city-2').clear
    @driver.find_element(:id, 'city-2').send_keys to
    @driver.find_element(:id, 'city-2').click
  end

  def set_type(type)
    if type == 'one-way'
      # @driver.find_element(:id, 'city-radio-5').click
      one_way = @driver.find_element :xpath, "//*[@id='city-radio-5']"
      @driver.execute_script("arguments[0].scrollIntoView(true)", one_way)
      one_way.click
    end
  end


  def set_dates(depart_date, return_date)
    @driver.find_element(:id, 'city-travel-start-day').clear
    @driver.find_element(:id, 'city-travel-start-day').send_keys depart_date
    @driver.find_element(:id, 'city-travel-start-day').click
    @driver.find_element(:id, 'city-travel-return-day').clear
    @driver.find_element(:id, 'city-travel-return-day').send_keys return_date
    @driver.find_element(:id, 'city-travel-return-day').click
  end

  def set_class(comfort_class)
    @driver.find_element(:id, "customSelect-0-combobox").click
    @select = @driver.find_element :xpath, "//*[@id='customSelect-0-listbox']"
    @classes = @select.find_elements(:tag_name, "li")
    @classes.each do |option|
      if option.attribute("data-value") == comfort_class
        option.click
        break
      end
    end
  end

  def passangers_count

  end

  def search
    @driver.find_element(:id, 'city-travel-input-2').click
  end

  def clear_popouts
    @driver.find_element(:id, 'header').click
  end
end
