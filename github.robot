*** Settings ***
Library   SeleniumLibrary
Library   String
Library   OperatingSystem
Library   Process

*** Variables ***
${usr}=
${password}=

*** Test Cases ***
Commit Through Git
    ${str}=   Generate Random String    12    [LOWER]
    Append To File    fake_commit.txt   ${str}
    Run   git add .
    Run   git commit -m "Add fake commit ${str}"
    Run   git push

Commit Through Browser App
  ${str}=   Generate Random String    12    [LOWER]
  Open Browser    https://github.com/dkrpv/robot_demo   Chrome
  Sleep   2
  Click Element   xpath:/html/body/div[1]/header/div/div[2]/div/div/div[2]/a
  Sleep   2
  Input Text    xpath://*[@id="login_field"]  ${usr}
  Input Password    xpath://*[@id="password"]  ${password}
  Sleep   1
  Click Element   xpath://*[@id="login"]/div[4]/form/div/input[11]
  Sleep   2
  Click Element   xpath://*[@id="repo-content-pjax-container"]/div/div/div[3]/div[1]/div[2]/details/summary
  Click Element   xpath://*[@id="repo-content-pjax-container"]/div/div/div[3]/div[1]/div[2]/details/div/ul/li[3]/form/button
  Sleep   2
  Input Text    xpath://*[@id="repo-content-pjax-container"]/div/div/form[2]/div/div[1]/span/input   ${str}
  Click Element   xpath://*[@id="submit-file"]
  Sleep   2
  Close Browser
