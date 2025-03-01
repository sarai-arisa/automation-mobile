*** Settings ***
Resource    ../keywords/todo.feature.robot


*** Test Cases ***
TC_01_Verify create the todo list without remainder successfully
    [Documentation]    To verify the application can create todo List succesfully
    [Tags]    sarai
    Open Test Application
    Verify List Page Before Add The Record
    Click Create Button
    Verify Add List Page
    Enter The Todo    Todo1
    Click The Next Button
    Verify List Page After Add The Todo List

TC_02_Verify create the todo list with remainder successfully
    # [Tags]    Test
    [Documentation]    To verify the application can create todo task succesfully
    Open Test Application
    Verify List Page Before Add The Record
    Click Create Button
    Verify Add List Page
    Enter The Todo    Todo2
    Click Remainder Toggle
    Verify After Adding Page After Toggle Is On
    Select The Next Day
    Click The Next Button
    Verify List Page After Add The Todo List

TC_03_Verify edit the todo list with remainder successfully
    # [Tags]    Test
    [Documentation]    To verify the application can edit todo task succesfully
    Open Test Application
    Verify List Page Before Add The Record
    Click Create Button
    Verify Add List Page
    Enter The Todo    Todo2
    Click Remainder Toggle
    Verify After Adding Page After Toggle Is On
    Select The Next Day
    Click The Next Button
    Verify List Page After Add The Todo List

TC_04_Verify the application will display default text as Today when selecting the day that is in the past
    # [Tags]    Test
    [Documentation]    To verify the application display default text as today when selecting the day that is in the past
    Open Test Application
    Verify List Page Before Add The Record
    Click Create Button
    Verify Add List Page
    Enter The Todo    Todo3
    Click Remainder Toggle
    Verify After Adding Page After Toggle Is On
    Select The Previous Day
    Verify Date Field After Selecting Previous Day
    Click The Next Button
    Verify List Page After Add The Todo List

TC_05_Verify can't create the record when not filled title but click the next button
    # [Tags]    Test
    [Documentation]    To verify the application will go back to the list page but not created any record when not filled the title
    Open Test Application
    Verify List Page Before Add The Record
    Click Create Button
    Verify Add List Page
    Click The Next Button
    Verify After Adding The Record Case But Not Filled The Title

TC_06_Verify Date And Time Picker
    # [Tags]    Test
    [Documentation]    To verify the application will close the date picker
    Open Test Application
    Verify List Page Before Add The Record
    Click Create Button
    Verify Add List Page
    Enter The Todo    Todo
    Click Remainder Toggle
    Cancel The Date Picker
    Cancel The Time Picker
    Verify The Adding Page After Closing The Date Time Picker
