*** Settings ***
Documentation     A test suite with a single test for Log In - U.S. Bank Freight Payment
...               Created by Surya Attili
Library           SeleniumLibrary    #timeout=30
Resource          resource.robot
#Test Teardown    Close Browser
Test Setup      Log In To The Freight Payment Portal    regb21  freight123   1
#Test Setup    Set Selenium Implicit Wait      30 seconds
Library     Collections



*** Variables ***
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link

*** Test Cases ***
#Validate Tiles Home Page
#    Navigate To Tiles Page
#    Wait Until Element Is Located In The Page       ${Total_Spend_Shipments_Xpath}
#    Validate Tiles Home Page
#    [Teardown]  Close Browser


#Navigate To Total Spend And Shipments Report
#    Navigate To Tiles Page
#    Wait Until Element Is Located In The Page       ${Total_Spend_Shipments_Xpath}
#    Navigate To Total Spend And Shipments Report
#    [Teardown]  Close Browser

Total Spend And Shipments Report Smoke Test
    Navigate To Tiles Page
    Wait Until Element Is Located In The Page       ${Total_Spend_Shipments_Xpath}
    Navigate To Total Spend And Shipments Report
    Total Spend And Shipments Report Smoke Test
    [Teardown]  Close Browser