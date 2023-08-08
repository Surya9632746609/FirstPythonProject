# Import the necessary libraries
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

# Create a new Chrome WebDriver instance
driver = webdriver.Chrome()

# Navigate to the login page
driver.get("https://practicetestautomation.com/practice-test-login/")

title = driver.title
print(title)
assert title == "Test Login | Practice Test Automation"



# Locate the username input field using its HTML attribute 'name'
# username_input = driver.find_element(By.XPATH, "//input[@id='username']")
# username_input = driver.find_element(By.NAME, value="username")
username_input = driver.find_element(By.ID, value="username")



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

actual_url = driver.current_url
print(actual_url)
assert actual_url == "https://practicetestautomation.com/logged-in-successfully/"

# message = driver.find_element(By.XPATH, "//h1[@class='post-title']")
message = driver.find_element(By.TAG_NAME, "h1")
message_title = message.text
print(message_title)
assert message_title == "Logged In Successfully"

# Locate the element by its class name
# element = driver.find_element(By.CLASS_NAME, "post-title")

# Get the inner text of the element
# inner_text = element.text
# print(inner_text)

# Locate the element by its class name
logout_button = driver.find_element(By.LINK_TEXT, "Log out")
# Get the inner text of the element
logout_button_name = logout_button.text
print(logout_button_name)
assert logout_button_name == "Log out"


# Verify the inner text
# expected_text = "Log out"
# if logout_button_name == expected_text:
#     print("Inner text verification successful!")
# else:
#     print("Inner text verification failed.")





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



driver.findElement(By.className("className"));
driver.findElement(By.cssSelector(".className"));
driver.findElement(By.id("elementId"));
driver.findElement(By.linkText("linkText"));
driver.findElement(By.name("elementName"));
driver.findElement(By.partialLinkText("partialText"));
driver.findElement(By.tagName("elementTagName"));
driver.findElement(By.xpath("xPath"));

"""