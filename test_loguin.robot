*** Settings ***
Library    AppiumLibrary
Variables    config_variables.py
Resource     keywords.robot
Library    RequestsLibrary
Resource    otp_keywords.robot



*** Test Cases ***
Login successfully
    Open Frubana App
    Select City     sp
    Number phone loguin    ar    1128895950
    Close Application


