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
${DELAY1}          60s
#${USERNAME}    regb21
#${PASSWORD}    tester123
${TilesPageTitle}   Data Analytics
#${SECURITY ANSWER}  1
#${LOGIN URL}      https://portal.syncada.com/USBank/Login.aspx
${HOME PAGE URL}    https://portal.syncada.com/USBank/Home.aspx
${OUTPUT_DIR}   C:\Users\surya\AppData\Local\Programs\Python\Python310\Scripts\Screen Shots\


#Dictionary Variables - Key and Value pair - Syntax - &{dictionary}=    key=value    key=value
${env}=    prod
#${browser}=     edge
&{URL}=    prod=https://portal.syncada.com/USBank/Login.aspx    uat=https://portal.uat.syncada.com/USBank/Login.aspx
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








*** Keywords ***
Log In To The Freight Payment Portal
    [arguments]     ${USERNAME}     ${PASSWORD}     ${SECURITY ANSWER}
    Open Browser    ${URL.${env}}  ${BROWSER}
    Set Selenium Implicit Wait      20 seconds
    Maximize Browser Window
    Sleep   ${DELAY}
    Title Should Be    Log In - U.S. Bank Freight Payment
    Wait Until Page Contains Element    id:txtUserID
    Input Text    id:txtUserID    ${USERNAME}
    Wait Until Page Contains Element    id:txtPassword
    Input Text    id:txtPassword    ${PASSWORD}
    Wait Until Page Contains Element    id:Main_btnContinue
    Click Button        id:Main_btnContinue
    Sleep   ${DELAY}
#Submit Security Answer Page Should Be Open
    Wait Until Page Contains Element    id:txtSecurityQuestionAnswer
    Input Text    id:txtSecurityQuestionAnswer    ${SECURITY ANSWER}
    Wait Until Page Contains Element    id:Main_btnLogIn
    Click Button        id:Main_btnLogIn
    Sleep   ${DELAY}
#Home Page Should Be Open
    Location Should Be    ${HOME PAGE URL}
    Title Should Be    Home - U.S. Bank Freight Payment
    Set Selenium Speed    ${DELAY}



Navigate To Tiles Page
    Wait Until Page Contains Element    xpath: //a[text()="Tableau Data Analytics (new)"]
    Click Element	  xpath: //a[text()="Tableau Data Analytics (new)"]
    Switch Window    new
    Sleep   ${DELAY}
    Title Should Be    Data Analytics


Wait Until Element Is Located In The Page
    [arguments]     ${element}
    Wait Until Element Is Visible       ${element}

Validate Tiles Home Page
    Sleep   ${DELAY1}
    Wait Until Element Is Located In The Page       ${Total_Spend_Shipments_Xpath}
    Element Text Should Be      ${Total_Spend_Shipments_Xpath}          ${Total_Spend_Shipments_Value}      #${TotalSpend_Shipment}
    Capture Page Screenshot         ${OUTPUTDIR}/Tiles.png
    Click Element   ${Total_Spend_Shipments_Xpath}
    Switch Window    new
    Sleep   ${DELAY}
    Title Should Be    Total Spend & Shipments
    Capture Page Screenshot         ${OUTPUTDIR}/Total Spend & Shipments.png


