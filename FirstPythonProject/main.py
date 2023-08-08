# Import the necessary libraries
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

# Create a new Chrome WebDriver instance
driver = webdriver.Chrome()

# Navigate to the login page
driver.get("https://practicetestautomation.com/practice-test-login/")

# Locate the username input field using its HTML attribute 'name'
username_input = driver.find_element(By.XPATH, "//input[@id='username']")

# Type the username into the input field
username_input.send_keys("student")

# Locate the password input field using its HTML attribute 'name'
password_input = driver.find_element(By.XPATH, "//input[@id='password']")

# Type the password into the input field
password_input.send_keys("Password123")

# Locate the login button using its HTML attribute 'type' (assuming it's a submit button)
login_button = driver.find_element(By.XPATH, "//button[@id='submit']")

# Click the login button
login_button.click()

# Wait for a few seconds to allow the page to load (you can use explicit waits here)
driver.implicitly_wait(15)  # Wait for 10 seconds

# After login, you can perform further actions on the logged-in page
# For example, you can navigate to a different page or verify elements on the page

title = driver.title
print(title)
assert title == "Logged In Successfully | Practice Test Automation"

driver.implicitly_wait(25)  # Wait for 10 seconds
driver.sleep(20)

# Close the WebDriver
driver.quit()





"""
Explanation of the code:

Import necessary libraries: Import the required classes from the selenium package.

Create a WebDriver instance: Initialize a new instance of the Chrome WebDriver.

Navigate to the login page: Use the WebDriver's get() method to navigate to the URL of the login page.

Locate and interact with elements:

Use the By.NAME locator strategy to find the username and password input fields on the login page.
Use the send_keys() method to type the username and password into their respective input fields.
Use the By.XPATH locator strategy to find the login button, assuming it's an input element with the attribute type='submit'.
Use the click() method to simulate clicking the login button.
Wait for page to load: Use implicitly_wait() to wait for a specific amount of time (10 seconds in this example) to allow the page to load after clicking the login button.

Perform further actions: After successfully logging in, you can perform additional actions on the logged-in page. This example doesn't include those actions, but you can add more code here based on your requirements.

Close the WebDriver: Use the quit() method to close the WebDriver instance and release the resources.

Remember to replace "your_username" and "your_password" with your actual login credentials, and adjust the element locators based on the structure of the login page you're automating. Additionally, you can enhance this code by using explicit waits and error handling for more robust automation.


"""