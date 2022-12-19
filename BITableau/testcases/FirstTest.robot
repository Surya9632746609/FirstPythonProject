*** Settings ***
Documentation     A test suite with a single test for Log In - U.S. Bank Freight Payment
...               Created by hats' Robotcorder
#Library           Selenium2Library    timeout=30
Library           SeleniumLibrary    timeout=30

*** Variables ***
${BROWSER}    chrome
${SLEEP}    3

*** Test Cases ***
Log In To The US Freight Payment Portal
    Open Browser    https://portal.syncada.com/USBank/Login.aspx    ${BROWSER}
    Wait Until Page Contains Element    //input[@id="txtUserID"]
    Input Text    //input[@id="txtUserID"]    regb21
    Wait Until Page Contains Element    //input[@id="Main_btnContinue"]
    Click Element    //input[@id="Main_btnContinue"]
    Wait Until Page Contains Element    //input[@id="Main_btnLogIn"]
    Click Element    //input[@id="Main_btnLogIn"]
    Wait Until Page Contains Element    xpath=(//a[@class="basic "])[5]
    Click Link    xpath=(//a[@class="basic "])[5]
    Wait Until Page Contains Element    xpath=(//span)[5]
    Click Element    xpath=(//span)[5]
    Wait Until Page Contains Element    //button[@class="f1odzkbq fyvorft fdxv97z low-density"]
    Click Element    //button[@class="f1odzkbq fyvorft fdxv97z low-density"]
    Wait Until Page Contains Element    //div[@id="loadingGlassPane"]
    Click Element    //div[@id="loadingGlassPane"]
    Wait Until Page Contains Element    //input[@class="QueryBox"]
    Input Text    //input[@class="QueryBox"]    1/1/2000
    Wait Until Page Contains Element    xpath=(//div[@class="tabComboBoxNameContainer tab-ctrl-formatted-fixedsize"])[5]
    Click Element    xpath=(//div[@class="tabComboBoxNameContainer tab-ctrl-formatted-fixedsize"])[5]
    Wait Until Page Contains Element    //span[@class="tabMenuItemName"]
    Click Element    //span[@class="tabMenuItemName"]
    Wait Until Page Contains Element    xpath=(//div[@class="tabComboBoxNameContainer tab-ctrl-formatted-fixedsize"])[3]
    Click Element    xpath=(//div[@class="tabComboBoxNameContainer tab-ctrl-formatted-fixedsize"])[3]
    Wait Until Page Contains Element    xpath=(//div[@class="tabComboBoxNameContainer tab-ctrl-formatted-fixedsize"])[4]
    Click Element    xpath=(//div[@class="tabComboBoxNameContainer tab-ctrl-formatted-fixedsize"])[4]
    Wait Until Page Contains Element    //input[@name="FI_BIDB2DW_generic,none:Document Type:nk8914948048550210999_8636291727871388583_0"]
    Click Element    //input[@name="FI_BIDB2DW_generic,none:Document Type:nk8914948048550210999_8636291727871388583_0"]
    Wait Until Page Contains Element    //div[@class="da-ev-reportcontent"]
    Click Element    //div[@class="da-ev-reportcontent"]
    Wait Until Page Contains Element    xpath=(//div[@class="tabComboBoxNameContainer tab-ctrl-formatted-fixedsize"])[4]
    Click Element    xpath=(//div[@class="tabComboBoxNameContainer tab-ctrl-formatted-fixedsize"])[4]
    Wait Until Page Contains Element    //h1[@class="headerText"]
    Click Element    //h1[@class="headerText"]
    Wait Until Page Contains Element    xpath=(//span)[2]
    Click Element    xpath=(//span)[2]
    Wait Until Page Contains Element    xpath=(//span)[4]
    Click Element    xpath=(//span)[4]

    Close Browser