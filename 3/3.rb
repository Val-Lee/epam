require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get "https://github.com/"

# driver.find_element(:name, "sign-in").click
# cheese = driver.find_element(:link, "Sign in").click
sign_in = driver.find_element :xpath =>"//a[text()='Sign in']"
sign_in.click
# sleep(3)
login = driver.find_element :name =>"login"
login.send_keys "testautomationuser"
# sleep(3)
password = driver.find_element :name =>"password"
password.send_keys "Time4Death!"
# sleep(3)
password.submit
sleep(5000)

# driver = Selenium::WebDriver.for :chrome
# driver.navigate.to 'https://github.com/'

# sign_in_element = driver.find_element :xpath, "//a[text()='Sign in']"
# sign_in_element.click

# login_field = driver.find_element :xpath, "//input[@id='login_field']"
# login_field.send_keys 'foo'

# pssw_field = driver.find_element :xpath, "//input[@id='password']"
# pssw_field.send_keys 'bar'
# sleep(5000)