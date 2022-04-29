** Settings ***
Documentation       Search Connections

Library             SeleniumLibrary
Resource            ..${/}resources${/}common.resource

Suite Setup        Open Linkedin Connections
Suite Teardown    Close Browser

*** Variables ***
${first_name}           Santosh
${last_name}            Bhinge
${full_name}            Santosh Bhinge
${special_chars}        haks@#1234
${numerical_chars}      2563546234
${hundred_chars}        madbhjukjabgcjunbGHHUHDFVBVBCYU12335@#$5gfe53y46madbhjukjabgcjunbGHHUHDFVBVBCYU12335@#$5gfe53y46abcd

#identifiers
${failedserchtextpara}    xpath://div[@class='mn-connections__empty-search']//following-sibling::p
${failedserchbox}    xpath://div[@class='mn-connections__empty-search']

*** Keywords ***
Enter Text In Search Field
    [Arguments]    ${text_to_enter}
    Wait Until Page Contains Element   xpath: //input[@id='mn-connections-search-input'] 
    Input Text    xpath: //input[@id='mn-connections-search-input']    ${text_to_enter}


Clear Text In Search Field
    Clear Element Text    xpath: //input[@id='mn-connections-search-input']


*** Test Cases ***
SearchByFirstName
    Sleep    2s
    Enter Text In Search Field    ${first_name}
    Sleep    2s
    SeleniumLibrary.Element Text Should Be    xpath: //span[@class="mn-connection-card__name t-16 t-black t-bold"]    ${full_name}
    Clear Text In Search Field

SearchByLastName
    Sleep    2s
    Enter Text In Search Field    ${last_name}
    Sleep    2s
    SeleniumLibrary.Element Text Should Be    xpath: //span[@class="mn-connection-card__name t-16 t-black t-bold"]    ${full_name}
    Clear Text In Search Field

SearchByFullName
    Enter Text In Search Field    ${full_name}
    SeleniumLibrary.Element Text Should Be    xpath: //span[@class="mn-connection-card__name t-16 t-black t-bold"]    ${full_name}
    Clear Text In Search Field


SearchBySpecialChars
    Enter Text In Search Field    ${special_chars}
    Sleep    3s
    Wait Until Element Is Visible    ${failedserchbox}
    Page Should Contain Element   ${failedserchbox}    Cound not find the failed search box
    Wait Until Element Is Visible    ${failedserchtextpara}
    Element Should Contain    ${failedserchtextpara}    We couldn’t find any connections with “${special_chars}”\nShow all connections
    Clear Text In Search Field

SearchByNumericalChars
    Enter Text In Search Field    ${numerical_chars}
    Sleep    3s
    Wait Until Element Is Visible    ${failedserchbox}
    Page Should Contain Element   ${failedserchbox}    Cound not find the failed search box
    Wait Until Element Is Visible    ${failedserchtextpara}
    Element Should Contain    ${failedserchtextpara}    We couldn’t find any connections with “${numerical_chars}”\nShow all connections

    Clear Text In Search Field

SearchByHundredChars
    Enter Text In Search Field    ${hundred_chars}
    Sleep    3s
    Wait Until Element Is Visible    ${failedserchbox}
    Page Should Contain Element   ${failedserchbox}    Cound not find the failed search box
    Wait Until Element Is Visible    ${failedserchtextpara}
    Element Should Contain    ${failedserchtextpara}    We couldn’t find any connections with “${hundred_chars}”\nShow all connections

    Clear Text In Search Field
