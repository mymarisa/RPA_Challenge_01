*** Settings ***
Documentation    TestCase RPA Challenge
Library     SeleniumLibrary     
Library     ExcelLibrary
Library     String

*** Variables ***
${BASE_URL}      https://rpachallenge.com
${BROWSER}       chrome
${LOCATOR_BTN_DOWNLOAD_EXCEL}   xpath=//a[@class=' col s12 m12 l12 btn waves-effect waves-light uiColorPrimary center']
${LOCATOR_BTN_START}    xpath=//button[normalize-space()='Start']
${LOCATOR_INPUT_FIRSTNAME}  xpath=//div[label[text() = 'First Name']]/input
${LOCATOR_INPUT_FIRSTNAME2}  xpath=//*[@ng-reflect-name="labelFirstName"]


*** Keywords ***
Open RPA Challenge
     Open Browser    ${BASE_URL}    browser=${BROWSER}

Input FirstName
    Input Text  ${LOCATOR_INPUT_FIRSTNAME2}     Test

*** Test Cases ***
Test RPA Challenge
    Open RPA Challenge
    Input FirstName
    [Teardown]

