*** Settings ***
Library   SeleniumLibrary
Library   String
Library   OperatingSystem
Library   Process

*** Test Cases ***
Commit through Git
    ${str}=   Generate Random String    12    [LOWER]
    Append To File    fake_commit.txt   ${str}
    Run   git add .
    Run   git commit -m "Add fake commit ${str}"
