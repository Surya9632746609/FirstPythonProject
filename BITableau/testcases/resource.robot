*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary



*** Variables ***
${BROWSER}        Chrome
${DELAY}          10s
${DELAY1}          50s
#${USERNAME}    regb21
#${PASSWORD}    tester123
${TilesPageTitle}   Data Analytics
#${SECURITY ANSWER}  1
#${LOGIN URL}      https://portal.syncada.com/USBank/Login.aspx
${HOME PAGE URL}    https://portal.syncada.com/USBank/Home.aspx
${OUTPUT_DIR}   C:\Users\surya\AppData\Local\Programs\Python\Python310\Scripts\Screen Shots\


#Dictionary Variables - Key and Value pair - Syntax - &{dictionary}=    key=value    key=value
${env}=    prod
#${browser}=     chrome
&{URL}=    prod=https://portal.syncada.com/USBank/Login.aspx    uat=http://google.com
&{BROWSER}=     chrome=Chrome   firefox=Firefox edge=Edge








###### X-Paths ######


${Total_Spend_Shipments_Xpath}      xpath://span[contains(text(),'Total Spend & Shipments')]
${Trend_Summary_Xpath}              xpath: //span[contains(text(),'Trend Summary')]
${Cost_Summary_Xpath}               xpath: //span[contains(text(),'Cost Summary')]
${Mode_Type_Summary_Xpath}          xpath: //span[contains(text(),'Mode Type Summary')]
${Service_Charge_Summary_Xpath}     xpath: //span[contains(text(),'Service Charge Summary')]
${Lane_Summary_Xpath}               xpath: //span[contains(text(),'Lane Summary')]
${Carrier Summary_Xpath}            xpath: //span[contains(text(),'Carrier Summary')]
${Carrier_Payment_Performance_Xpath}        xpath: //span[contains(text(),'Carrier Payment Performance')]
${Processing_Performance_Xpath}     xpath: //span[contains(text(),'Processing Performance')]
${Exception_Summary_Xpath}          xpath: //span[contains(text(),'Exception Summary')]

${Total_Spend_Shipments_Value}     Total Spend & Shipments
${Trend_Summary_Value}             Trend Summary
${Cost_Summary_Value}              Cost Summary
${Mode_Type_Summary_Value}         Mode Type Summary
${Service_Charge_Summary_Value}    Service Charge Summary
${Lane_Summary_Value}              Lane Summary
${Carrier_Summary_Value}           Carrier Summary
${Carrier_Payment_Performance_Value}    Carrier Payment Performance
${Processing_Performance_Value}     Processing Performance
${Exception_Summary_Value}          Exception Summary

###### Total_Spend_Shipments X-Paths ######
${Total_Spend_And_Shipments_HeaderText_Xpath}   xpath: //h1[normalize-space()='Total Spend & Shipments']
${Total_Spend_And_Shipments_HeaderText_Value}   Total Spend & Shipments
${Total_Spend_And_Shipments_Heading_Xpath}   xpath: //*[@id="tabZoneId7"]/div/div/div/div[1]/div/span/div/span
${Total_Spend_And_Shipments_Heading_Value}  Total Spend & Shipments

#${Start_Date_Xpath}     xpath: //input[@aria-label="Start Date"]
#${Start_Date_Xpath}     xpath: //*[@id="tableau_base_widget_ParameterControl_1"]/div/div[1]/h3/span/div/span
${Start_Date_Xpath}     xpath: /html/body/div[2]/div[2]/div[1]/div[1]/div/div[2]/div[14]/div/div/div/div/div/div[2]/div/span[1]/input
#${Start_Date_Xpath}     xpath: //input[@value='1/1/2022']
${Start_Date_Value}     1/1/2000
#${End_Date_Xpath}   xpath: /input[@aria-label="End Date"]
#${End_Date_Value}      8/25/2022






*** Keywords ***
Log In To The Freight Payment Portal
    [arguments]     ${USERNAME}     ${PASSWORD}     ${SECURITY ANSWER}
    Open Browser    ${URL.${env}}  ${BROWSER}
#    Set Selenium Implicit Wait      20 seconds
    Set Browser Implicit Wait      30 seconds
    Maximize Browser Window
#    Sleep   ${DELAY}
    Title Should Be    Log In - U.S. Bank Freight Payment
    Wait Until Page Contains Element    id:txtUserID
    Input Text    id:txtUserID    ${USERNAME}
    Wait Until Page Contains Element    id:txtPassword
    Input Text    id:txtPassword    ${PASSWORD}
    Wait Until Page Contains Element    id:Main_btnContinue
    Click Button        id:Main_btnContinue
#    Sleep   ${DELAY}
#Submit Security Answer Page Should Be Open
    Wait Until Page Contains Element    id:txtSecurityQuestionAnswer
    Input Text    id:txtSecurityQuestionAnswer    ${SECURITY ANSWER}
    Wait Until Page Contains Element    id:Main_btnLogIn
    Click Button        id:Main_btnLogIn
#    Sleep   ${DELAY}
#Home Page Should Be Open
    Location Should Be    ${HOME PAGE URL}
    Title Should Be    Home - U.S. Bank Freight Payment
#    Set Selenium Speed    ${DELAY}



Navigate To Tiles Page
    Wait Until Page Contains Element    xpath: //a[text()="Tableau Data Analytics (new)"]
    Click Element	  xpath: //a[text()="Tableau Data Analytics (new)"]
    Switch Window    new
#    Sleep   ${DELAY}
    Title Should Be    Data Analytics


Wait Until Element Is Located In The Page
    [arguments]     ${element}
    Wait Until Element Is Visible       ${element}

Validate Tiles Home Page
#    Sleep   ${DELAY1}
    Wait Until Element Is Located In The Page       ${Total_Spend_Shipments_Xpath}
    Element Text Should Be      ${Total_Spend_Shipments_Xpath}          ${Total_Spend_Shipments_Value}      #${TotalSpend_Shipment}
    Capture Page Screenshot         ${OUTPUTDIR}/Tiles.png
    Click Element   ${Total_Spend_Shipments_Xpath}
    Switch Window    new
#    Sleep   ${DELAY}
    Title Should Be    Total Spend & Shipments
    Capture Page Screenshot         ${OUTPUTDIR}/Total Spend & Shipments.png
#    Sleep   ${DELAY}

Navigate To Total Spend And Shipments Report
    Wait Until Element Is Located In The Page       ${Total_Spend_Shipments_Xpath}
    Element Text Should Be      ${Total_Spend_Shipments_Xpath}          ${Total_Spend_Shipments_Value}      #${TotalSpend_Shipment}
    Sleep   ${DELAY1}
    Capture Page Screenshot         ${OUTPUTDIR}/TotalSpendAndShipments_Tile.png
    Click Element   ${Total_Spend_Shipments_Xpath}
    Switch Window    new
    Sleep   ${DELAY1}
    Title Should Be    Total Spend & Shipments
    Capture Page Screenshot         ${OUTPUTDIR}/Total Spend & Shipments.png
#    Sleep   ${DELAY1}

Total Spend And Shipments Report Smoke Test
    Element Text Should Be  ${Total_Spend_And_Shipments_HeaderText_Xpath}   ${Total_Spend_And_Shipments_HeaderText_Value}
#    Element Text Should Be  ${Total_Spend_And_Shipments_Heading_Xpath}  ${Total_Spend_And_Shipments_Heading_Value}
    Clear Element Text  ${Start_Date_Xpath}
    Input Text  1/1/2000
#    Clear Element Text  ${End_Date_Xpath}
#    Input Text  8/25/2022