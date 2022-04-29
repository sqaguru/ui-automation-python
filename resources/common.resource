*** Settings ***
Documentation  This resource file contain all the necessary resources to run all the tests.
Library  SeleniumLibrary
Library    ../venv/lib/python3.9/site-packages/robot/libraries/OperatingSystem.py
Library    ../venv/lib/python3.9/site-packages/robot/libraries/Telnet.py


*** Variables ***
${url}  https://www.linkedin.com/
${browser}  chrome
${profilename}  Profilename
${username}  username
${password}  password


*** Keywords ***
Login Linkedin And Verify
    Open Browser  ${url}  ${browser}
    # Open Browser    https://www.linkedin.com/m/logout      ${browser}  options=add_argument("user-data-dir=./cache")
    # Delete All Cookies
    # Go To    ${url}
    Click Element  xpath: //a[@data-tracking-control-name='guest_homepage-basic_nav-header-signin']     # clicking  the signing button
    Input Text    xpath: //*[@id="username"]    ${username}
    Input Password    xpath: //*[@id="password"]    ${password}
    Click Button    xpath: //button[@data-litms-control-urn='login-submit']
    Element Text Should Be    xpath://div[contains(@class,'feed-identity-module__actor')]//a//div[2]    ${profilename}    # checking if profile name is visible

Go To Manage Network
    Click Link    xpath: //*[@data-link-to="mynetwork"]    
    Wait Until Element Is Visible    xpath: //h2[contains(text(),'Manage my network')]
    Element Text Should Be    xpath: //h2[contains(text(),'Manage my network')]   Manage my network
 
    
Go To Connections
    Wait Until Page Contains Element  xpath://a[contains(@href,'connections')] 
    Click Link    xpath://a[contains(@href,'connections')]


Open Linkedin Connections
    Login Linkedin And Verify
    Go To Manage Network
    Go To Connections




