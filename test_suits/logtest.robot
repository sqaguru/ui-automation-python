*** Settings ***
Documentation  Automatically login at linkedin
Library  SeleniumLibrary
Resource    ..${/}resources${/}common.resource
Suite Teardown    Close Browser

*** Test Cases ***
SigninTest
    Login Linkedin And Verify
