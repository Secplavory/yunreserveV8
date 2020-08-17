#include "controller.h"

controller::controller()
{
}

void controller::welcome_clicked(){
    setPageSource("ChooseFunction");
}
void controller::chooseFunction_perchase(){
    functionHandler = "1";
    setPageSource("ChooseChannel");
}
void controller::chooseFunction_upload(){
    functionHandler = "2";
    setPageSource("Login");
}
void controller::chooseFunction_recall(){
    functionHandler = "3";
    setPageSource("Login");
}
void controller::chooseFunction_signup(){
    setPageSource("Signup");
}
void controller::chooseFunction_changeInfo(){
    setPageSource("ChangeInfo");
}
void controller::chooseFunction_forgetPassword(){
    setPageSource("ForgetPassword");
}
