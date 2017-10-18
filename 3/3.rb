require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get "https://github.com/"

sign_in = driver.find_element :xpath =>"//a[text()='Sign in']"
sign_in.click

login = driver.find_element :name =>"login"
login.send_keys "testautomationuser"

password = driver.find_element :name =>"password"
password.send_keys "Time4Death!"
password.submit
sleep(5000)
