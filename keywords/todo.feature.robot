*** Settings ***
Library    AppiumLibrary
Library    String
Library    DateTime

Resource    ../resources/locators.robot

*** Keywords ***
Open Test Application
    Open Application    ${URL}   platformName=${PLATFORM}    platformVersion=${ANDROID_PLATFORM_VERSION}
    ...     deviceName=${DEVICE_NAME}    app=${APP_LOCATION}    automationName=appium

Click Create Button
    Click Element       ${btn_add}

Enter The Todo
    [Arguments]    ${text_input}
    Input Text    ${txt_box_title}    ${text_input}

Click The Next Button
    Click Element       ${btn_next}

Click Remainder Toggle
    Click Element       ${tgg_remind}

Select The Next Day
    ${date_time}        Get Current Date    result_format=datetime
    ${datetime}=    Convert Date    ${date_time}    result_format=%d/%m/%Y
    ${date}  DateTime.Add Time To Date  ${date_time}  1 days    date_format=%d/%m/%Y    result_format=%d %B %Y
    log     ${date}
    ${locator_selected_date} = 	Replace String      ${selected_date}       {date_and}     ${date}
    Click Element       ${txt_box_date}
    Wait Until Element Is Visible       ${btn_submit_date}     15
    Click Element       ${locator_selected_date}
    Click Element          ${btn_submit_date}

Select The Previous Day
    ${date_time}        Get Current Date    result_format=datetime
    ${datetime}=    Convert Date    ${date_time}    result_format=%Y-%m-%d %H:%M:%S
    ${date}    Subtract Time From Date    ${datetime}    2 days     result_format=%d %B %Y
    log     ${date}
    ${locator_selected_date} = 	Replace String      ${selected_date}       {date_and}     ${date}
    Click Element       ${txt_box_date}
    Wait Until Element Is Visible       ${btn_submit_date}     15
    Click Element       ${locator_selected_date}
    Click Element          ${btn_submit_date}
    Should Not Be Empty     ${txt_box_date}



Select ${button_name} Menu
    Wait Until Element Is Visible       ${list_about}        15
     IF  "${button_name}" == "Settings"
        ${btn_setting} = 	Replace String      ${btn_setting_selection}       {index_and}     1
        Click Element    ${btn_setting}
    ELSE
        ${btn_about} = 	Replace String      ${btn_setting_selection}       {index_and}     2
        Click Element    ${btn_about}
    END



Cancel The Date Picker
    Click Element       ${txt_box_date}
    Wait Until Element Is Visible       ${btn_cancel_datetime_picker}     15
    Click Element       ${btn_cancel_datetime_picker}

Cancel The Time Picker
    Click Element       ${txt_box_time}
    Wait Until Element Is Visible       ${btn_cancel_datetime_picker}     15
    Click Element       ${btn_cancel_datetime_picker}

Verify Add List Page
    Wait Until Element Is Visible       ${txt_title_add_todo}       15

Verify List Page After Add The Todo List
    Wait Until Element Is Visible       ${txt_title}        15
    ${actual_txt_value_to_do}        Get Text          ${txt_box_title} 
    Should Be Equal      ${actual_txt_value_to_do}      TestCreate


Verify List Page Before Add The Record
    Wait Until Element Is Visible       ${txt_title}        15
    ${actual_txt_detail}        Get Text          ${txt_desc}
    Should Be Equal     ${actual_txt_detail}        ${expected_txt_detail_list_page}
    Element Should Be Visible       ${btn_add}
    Element Should Be Visible       ${img_image1}
    Element Should Be Visible       ${btn_moreoption}


Verify After Adding Page After Toggle Is On
    Wait Until Element Is Visible       ${txt_reminder}     15
    ${actual_txt_reminder}        Get Text          ${txt_reminder}
    Should Contain      ${actual_txt_reminder}      Reminder${SPACE}set${SPACE}for

Verify The Adding Page After Closing The Date Time Picker
    Wait Until Element Is Visible       ${txt_reminder}     15
    ${actual_txt_reminder}        Get Text          ${txt_reminder}
    Should Contain      ${actual_txt_reminder}      Reminder${SPACE}set${SPACE}for

Verify Date Field After Selecting Previous Day
    Wait Until Element Is Visible       ${txt_reminder}     15
    ${actual_txt}        Get Text          ${txt_box_date}
    Should Be Equal     ${actual_txt}       Today

Verify After Adding The Record Case But Not Filled The Title
    Wait Until Element Is Visible       ${txt_title}        15
    ${actual_txt_detail}        Get Text          ${txt_desc}
    Should Be Equal     ${actual_txt_detail}        ${expected_txt_detail_list_page}
 



