*** Settings ***
Documentation    TestCase RPA Challenge
Library     SeleniumLibrary     
Library     ExcelRobot
Library     String
Library     Collections
Library     OperatingSystem

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
${PATH_DOWNLOAD}        C:\\Users\\AGT116\\Downloads
${FILNAME_RPA}          challenge.xlsx   


*** Keywords ***
Open RPA Challenge
     Open Browser    ${BASE_URL}    browser=${BROWSER}

Download Excel File RPA Challenge
    Click Element  ${LOCATOR_BTN_DOWNLOAD_EXCEL}
    File Should Exist    ${PATH_DOWNLOAD}\\${FILNAME_RPA}

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

Start RPA Challenge
    Click Element   ${LOCATOR_BTN_START}

Submit Form RPA Challenge
    Click Element   ${LOCATOR_BTN_SUBMIT}

Open File Excel in Path
    File Should Exist    ${PATH_DOWNLOAD}\\${FILNAME_RPA}
    Open Excel      ${PATH_DOWNLOAD}\\${FILNAME_RPA} 
        
Read Data From File Excel and Input Data on Page
    ${get_sheet_name}   Get Sheet Names	    
    ${sheet_name}=    Get From List   ${get_sheet_name}    0
    ${count_column}     Get Column Count    ${sheet_name}
    ${count_row}        Get Row Count       ${sheet_name}
    FOR     ${row_num}   IN RANGE  1  ${count_row}
            ${data_firstname}    Read Cell Data    ${sheet_name}            0      ${row_num}
            ${data_lastname}    Read Cell Data    ${sheet_name}             1      ${row_num}
            ${data_company_name}    Read Cell Data    ${sheet_name}         2      ${row_num}
            ${data_role_in_company}     Read Cell Data    ${sheet_name}     3      ${row_num}
            ${data_address}   Read Cell Data    ${sheet_name}               4      ${row_num}
            ${data_email}   Read Cell Data    ${sheet_name}                 5      ${row_num}
            ${data_phone}   Read Cell Data    ${sheet_name}                 6      ${row_num}           NUMBER      false
            #${type_cell_phone}      Check Cell Type      ${sheet_name}                 6      ${row_num}    NUMBER      
            ${data_phone_number}=    Convert Data Cell Number to String    ${data_phone}
            Fill out Data From Excel    ${data_firstname}   ${data_lastname}    ${data_company_name}    ${data_role_in_company}    ${data_address}   ${data_email}   ${data_phone_number} 
            Submit Form RPA Challenge
    END


Fill out Data From Excel
    [Arguments]      ${data_firstname}   ${data_lastname}    ${data_company_name}    ${data_role_in_company}    ${data_address}   ${data_email}   ${data_phone}
    Input FirstName=${data_firstname}
    Input LastName=${data_lastname}
    Input Address=${data_address}
    Input Email=${data_email}
    Input Phone=${data_phone}
    Input CompanyName=${data_company_name}
    Input Role In Company=${data_role_in_company}

Verify Page Input Data Success
    Wait Until Page Contains   Congratulations!
    Wait Until Page Contains    Your success rate is 100% ( 70 out of 70 fields)

Convert Data Cell Number to String
    [Arguments]     ${data_type_number}    
    ${data_phone_number}=  Convert To Integer    ${data_type_number} 
    #Other solutions
    #${data_phone_num}=      Remove String    ${data_phone}      ,   #If use Read Cell Data not set Use Format (boolean) false -> result data #,###.#0
    #${data_phone_number}=    Evaluate    "{0:.0f}".format(${data_type_number})
    [Return]    ${data_phone_number}
    

 
*** Test Cases ***
Test RPA Challenge
    Open RPA Challenge
    Download Excel File RPA Challenge
    Open File Excel in Path
    Start RPA Challenge
    Read Data From File Excel and Input Data on Page
    Verify Page Input Data Success
    [Teardown]

