*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Validate UnSuccesful Login
    open the browser with the Mortgage payment url

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome  executable_path=/Users/surya/Documents/chromedriver
    Go To   https://rahulshettyacademy.com/loginpagePractise/
#
#Fill the login Form
#    Input Text          id:username     rahulshettyacademy
#    Input Password      id:password     12345678
#    Click Button        signInBtn
#
#wait until it checks and display error message
#    Wait Until Element Is Visible       ${Error_Message_Login}
#
#verify error message is correct
#   ${result}=   Get Text    ${Error_Message_Login}
#   Should Be Equal As Strings     ${result}     Incorrect username/password.
#   Element Text Should Be       ${Error_Message_Login}      Incorrect username/password.
