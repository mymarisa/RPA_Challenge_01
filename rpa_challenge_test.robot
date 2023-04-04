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
#${LOCATOR_INPUT_FIRSTNAME}  xpath=//div[label[text() = 'First Name']]/input
${LOCATOR_INPUT_FIRSTNAME}  xpath=//*[@ng-reflect-name="labelFirstName"]
${LOCATOR_INPUT_LASTNAME}   xpath=//*[@ng-reflect-name="labelLastName"]
${LOCATOR_INPUT_ADDRESS}    xpath=//*[@ng-reflect-name="labelAddress"]
${LOCATOR_INPUT_EMAIL}      xpath=//*[@ng-reflect-name="labelEmail"]
${LOCATOR_INPUT_PHONE}      xpath=//*[@ng-reflect-name="labelPhone"]
${LOCATOR_INPUT_COMPANY_NAME}      xpath=//*[@ng-reflect-name="labelCompanyName"]
${LOCATOR_INPUT_ROLE_IN_COMPANY}      xpath=//*[@ng-reflect-name="labelRole"]
${LOCATOR_BTN_SUBMIT}       xpath=//input[@value='Submit']
${PATH_DOWNLOAD}        C:/Users/AGT116/Downloads
${FILNAME_RPA}          challenge.xlsx   


*** Keywords ***
Open RPA Challenge
     Open Browser    ${BASE_URL}    browser=${BROWSER}

Input FirstName=${param_firstname}
    Input Text  ${LOCATOR_INPUT_FIRSTNAME}  ${param_firstname}

Input LastName=${param_lastname}
    Input Text  ${LOCATOR_INPUT_LASTNAME}   ${param_lastname}

Input Address=${param_addess}
    Input Text  ${LOCATOR_INPUT_ADDRESS}    ${param_addess}

Input Email=${param_email}
    Input Text  ${LOCATOR_INPUT_EMAIL}      ${param_email}

Input Phone=${param_phone}
    Input Text  ${LOCATOR_INPUT_PHONE}      ${param_phone}

Input CompanyName=${param_company_name}
    Input Text  ${LOCATOR_INPUT_COMPANY_NAME}   ${param_company_name}

Input Role In Company=${param_role_in_company}
    Input Text  ${LOCATOR_INPUT_ROLE_IN_COMPANY}    ${param_role_in_company} 

# Read Data From File Excel in Path
#     #Open Excel Document    filename=challenge.xlsx     doc_id=doc1
#     Open Excel     ${PATH_DOWNLOAD}/${FILNAME_RPA}

Open File Excel in Path
    Open Excel     ${PATH_DOWNLOAD}/${FILNAME_RPA}

Read Data From File Excel 
    



Fill out Data From Excel



*** Test Cases ***
Test RPA Challenge
    Open RPA Challenge
    [Teardown]

