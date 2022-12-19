*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot
#Documentation     A resource file with reusable keywords and variables.
#...
#...               The system specific keywords created here form our own
#...               domain specific language. They utilize keywords provided
#...               by the imported SeleniumLibrary.

Library     SeleniumLibrary
Test Teardown    Close Browser
Test Setup    Log On To Syncada Potal and Navigate To Tiles Page      regb21	tester123	1
#Test Setup    Set Selenium Implicit Wait      10 seconds
Library     Collections


*** Variables ***
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link

*** Test Cases ***
#Log On To Syncada Potal and Navigate To Tiles Page
#    Open Browser To Login Page
#    Input Username
#    Input Password
#    Submit Credentials
#    Submit Security Answer Page Should Be Opened
#    Home Page Should Be Opened
#    Navigate To Tiles Page
##   [Teardown]    Close Browser


Validate Tiles Home Page
    Wait Until Element Is Located In The Page       ${Total_Spend_Shipments_Xpath}
    Validate Tiles Home Page
    [Teardown]  Close Browser

