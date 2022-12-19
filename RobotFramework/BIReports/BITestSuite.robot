*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username
    Input Password
    Submit Credentials
    Submit Security Answer Page Should Be Open
    Home Page Should Be Open
#    [Teardown]    Close Browser


#Valid Login
#    Open Browser To Login Page
#    Input Username
#    Input Password
#    Submit Credentials
#    Submit Security Answer Page Should Be Open
#    Home Page Should Be Open
#    [Teardown]    Close Browser

Verify Tiles Home Page
    Validate Tiles Home Page
    [Teardown]    Close Browser