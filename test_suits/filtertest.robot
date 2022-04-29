*** Settings ***
Documentation       Filter Connections

Library             SeleniumLibrary
Resource            ..${/}resources${/}common.resource

Suite Setup    Open Linkedin Connections
Suite Teardown     Close Browser

*** Variables ***
${country}  canada
${city}    montreal
${nearme}   NEAR ME 
${alnumdata}    Montrea12232
${speialchars}   India@##%#@#%12232 
${exceedingchars}   India@##%#@#%12232India@##%#@#%12232

#identifiers
${priorityfilterbutton}    xpath://button[contains(@aria-label,'Connections filter.')]
${priorityshowresultbutton}    xpath:(//button[@data-control-name='filter_show_results'])[1]

${locationfilterbutton}    xpath://button[@aria-label='Locations filter. Clicking this button displays all Locations filter options.']
${locationfiltertextbox}   xpath://input[@aria-label='Add a location']


*** Keywords ***
Go To Filters
    [Documentation]    clicking on the filter connections link 
    Wait Until Page Contains Element    xpath: //a[contains(@class,'search-with-filters')]    15
    Click Link    xpath: //a[contains(@class,'search-with-filters')]

Open Priority Filter
    Wait Until Element Is Visible    ${priorityfilterbutton}
    Click Button    ${priorityfilterbutton}




Filter Connections By Location
    [Documentation]    This keyword fills the searchbox for filter connections and searched the connections
    [Arguments]    ${location_string}
    Wait Until Element Is Visible    ${locationfilterbutton}    10
    Click Button    ${locationfilterbutton} 
    Sleep   5s
    Wait Until Page Contains Element    ${locationfiltertextbox}    10
    Clear Element Text    ${locationfiltertextbox}
    Sleep    5s
    Wait Until Element Is Enabled  ${locationfiltertextbox}    15
    Input Text    ${locationfiltertextbox}    ${location_string}
    Press Keys    ${locationfiltertextbox}    ESC
    Wait Until Page Contains Element    xpath:(//button[@data-control-name='filter_show_results'])[2]    10
    Click Button    xpath:(//button[@data-control-name='filter_show_results'])[2]
    Sleep    3s


click second and third priority checkbox
    Sleep    2s
    Open Priority Filter
    Wait Until Page Contains Element   id:network-S  5s    Priority filter second checkbox is not visible after 2 seconds
    Execute Javascript   document.getElementById('network-S').click()     #clicking on the checkbox of 2nd 
    Wait Until Page Contains Element   id:network-O   5s        
    Execute Javascript   document.getElementById('network-O').click()    #clicking on the checkbox of 3rd
    Search By Priority

click all priority checkboxex
    Sleep    2s
    Open Priority Filter
    Wait Until Page Contains Element   id:network-F  5s    Priority filter first checkbox is not visible after 2 seconds
    Execute Javascript   document.getElementById('network-F').click()     #clicking on the checkbox of 1sr
    Wait Until Page Contains Element   id:network-S  5s    Priority filter second checkbox is not visible after 2 seconds
    Execute Javascript   document.getElementById('network-S').click()     #clicking on the checkbox of 2nd 
    Wait Until Page Contains Element   id:network-O   5s        
    Execute Javascript   document.getElementById('network-O').click()    #clicking on the checkbox of 3rd
    Search By Priority



Check First Priority
    [Documentation]    This keyword select sirt by First 
    Sleep    2s
    Open Priority Filter
    Wait Until Page Contains Element   id:network-F  5s    Priority filter first checkbox is not visible after 2 seconds
    Execute Javascript   document.getElementById('network-F').click()     #clicking on the checkbox of 1sr
    Search By Priority

Check Second Priority
    [Documentation]    This keyword select filter by second and third
    Sleep    2s
    Open Priority Filter
    Wait Until Page Contains Element   id:network-S  5s    Priority filter second checkbox is not visible after 2 seconds
    Execute Javascript   document.getElementById('network-S').click()     #clicking on the checkbox of 2nd 
    Sleep    2s
    Search By Priority
    
Check Third Priority
    Sleep    2s
    Open Priority Filter
    Wait Until Page Contains Element   id:network-O   5s
    Execute Javascript   document.getElementById('network-O').click()    #clicking on the checkbox of 3rd
    Sleep    2s
    Search By Priority


Search By Priority
    Sleep    2s
    Wait Until Element Is Visible      ${priorityshowresultbutton}
    Click Button      ${priorityshowresultbutton}


*** Test Cases ***
FilterByFirst
    Go To Filters

FilterByAll
    click second and third priority checkbox
    Sleep    3s
    
     

FilterByNone
    # uncehcking them all by clicking them again
    Sleep    2s
    click all priority checkboxex    #unchecking them all


FilterByCountry
    Sleep    5s
    # again selecting the first
    Check First Priority    # checking the first box by clicking it again
    # Going to filter by location
    Filter Connections By Location    ${country}
    

FilterByCity
    Filter Connections By Location    ${city}

FliterByNearme
    Filter Connections By Location    ${nearme}

FilterByAlnum
    Filter Connections By Location    ${alnumdata}

FilterBySpecialchars
    Filter Connections By Location    ${speialchars}

FilterByExeedingChar
    Filter Connections By Location    ${exceedingchars}









