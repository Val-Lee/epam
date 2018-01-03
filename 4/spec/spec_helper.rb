require 'selenium-webdriver'

DEPART_DATE = (Time.now + 4*24*60*60).strftime('%d/%m/%Y')
RETURN_DATE = (Time.now + 14*24*60*60).strftime('%d/%m/%Y')
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
    @driver.manage.timeouts.implicit_wait = 60
    @driver.get(@base_url)
    @depart_date = @driver.find_element(:xpath, '//*[@id="city-travel-start-day-2"]')

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

  def passangers_count(adult, child, infant)
    @driver.find_element(:id, "customSelect-1-combobox").click
    sleep(1)
    @adult = @driver.find_element :xpath, "//*[@id='customSelect-1-listbox']"
    @adult_list = @adult.find_elements(:tag_name, "li")
    @adult_list.each do |option1|
      if option1.attribute("data-value") == adult.to_s
        option1.click
        break
      end
    end
    sleep(1)
    @driver.find_element(:id, "customSelect-2-combobox").click
    @child = @driver.find_element :xpath, "//*[@id='customSelect-2-listbox']"
    @child_list = @child.find_elements(:tag_name, "li")

    @child_list.each do |option2|
      if option2.attribute("data-value") == child.to_s
        option2.click
        break
      end
    end
    sleep(1)

    @driver.find_element(:id, "customSelect-3-combobox").click
    @infant = @driver.find_element :xpath, "//*[@id='customSelect-3-listbox']"
    @infant_list = @infant.find_elements(:tag_name, "li")
    @infant_list.each do |option3|
      if option3.attribute("data-value") == infant.to_s
        option3.click
        break
      end
    end
  end

  def search
    sleep(2)
    @driver.find_element(:id, 'city-travel-input-2').click
  end

  def clear_popouts
    element = @driver.find_element(:xpath, '//*[@id="container"]/header')
    @driver.action.move_to(element).perform
    @driver.action.move_by(1, 1).click.perform
  end

  def flexible_dates
    checkbox = @driver.find_element(:xpath, "city-travel-checkbox-6")
    @driver.execute_script("arguments[0].scrollIntoView(true)", checkbox)
    checkbox.click
  end
end
