*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Library   String
Library   Collections

*** Variables ***
${dest1}=   Boston
${dest2}=   Cairo
${month}=   10
${year}=    2019

*** Test Cases ***
Search Flights
    Open Browser    http://blazedemo.com   Chrome
    Page Should Contain   Welcome to the Simple Travel Agency!
    Select From List By Value   xpath://select[@name='fromPort']    ${dest1}
    Select From List By Value   xpath://select[@name='toPort']    ${dest2}
    Click Button    css:input[type='submit']
Get Flights Info
    Page Should Contain   Flights from ${dest1} to ${dest2}
    #Time of departure does not show if there are no Flights
    Page Should Contain   AM
    ${choice}=   Get Webelements   xpath=//div/table/tbody/tr[1]
    ${text}=    Get Text    ${choice}
    ${words}=   Split String    ${text}
    Set Global Variable    @{price}    Get From List   ${words}    7
    ${number}=   Get From List   ${words}    0
    ${airline}=   Get From List   ${words}    1
    Click Button    css:input[type='submit']
Fill Form
    Input Text    xpath://input[@name='inputName']    Danila
    Input Text    xpath://input[@name='address']    My address
    Input Text    xpath://input[@name='city']    My city
    Input Text    xpath://input[@name='state']    My state
    Input Text    xpath://input[@name='zipCode']    1213
    Select From List By Index   xpath://select[@id='cardType']    2
    Input Text    xpath://input[@name='creditCardNumber']    2727825872
    Input Text    xpath://input[@name='creditCardMonth']    ${month}
    Input Text    xpath://input[@name='creditCardYear']    ${year}
    Input Text    xpath://input[@name='nameOnCard']    Danila Danila
    Select Checkbox   xpath://input[@name='rememberMe']
    Click Button    css:input[type='submit']
Confirm Final Page
    Page Should Contain   Thank you for your purchase today!
    ${choice2}=   Get Webelements   xpath=//div/table/tbody/tr[3]
    ${newtext}=    Get Text    ${choice2}
    ${wordlist}=    Split String    ${newtext}
    ${newprice}    Get From List   ${wordlist}    2
    Should Be Equal As Strings    ${newprice}   @{price}
    Close Browser
