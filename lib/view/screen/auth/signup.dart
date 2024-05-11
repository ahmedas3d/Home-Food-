import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertextiapp.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "signup".tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<SignUpControllerImp>(
                builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextTitleAuth(title: "welcome".tr),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextBodyAuth(
                                textBody: "par".tr,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              CustomFormAuth(
                                isNamber: false,

                                valid: (val) {
                                  return validInput(val!, 3, 100, "username");
                                },
                                mycontroller: controller.username,
                                label: "username".tr,
                                hinttext: "hintusername".tr,
                                iconData: Icons.person_outline,
                                // mycontroller: ,
                              ),
                              CustomFormAuth(
                                isNamber: false,

                                valid: (val) {
                                  return validInput(val!, 5, 100, "email");
                                },
                                mycontroller: controller.email,
                                label: "email".tr,
                                hinttext: "hintemail".tr,
                                iconData: Icons.email_outlined,
                                // mycontroller: ,
                              ),
                              CustomFormAuth(
                                isNamber: true,

                                valid: (val) {
                                  return validInput(val!, 5, 100, "phone");
                                },
                                mycontroller: controller.phone,
                                label: "phone".tr,
                                hinttext: "hintphone".tr,
                                iconData: Icons.phone,
                                // mycontroller: ,
                              ),
                              GetBuilder<SignUpControllerImp>(
                                builder: (controller) => CustomFormAuth(
                                  isNamber: false,

                                  valid: (val) {
                                    return validInput(val!, 5, 100, "password");
                                  },
                                  onTap: () {
                                    controller.showPassword();
                                  },
                                  obscureText: controller.isShowPassword,
                                  mycontroller: controller.password,
                                  label: "password".tr,
                                  hinttext: "hintpass".tr,
                                  iconData: Icons.lock_outline,
                                  // mycontroller: ,
                                ),
                              ),
                              GetBuilder<SignUpControllerImp>(
                                  init: SignUpControllerImp(),
                                  builder: (controllerImp) =>
                                      DropdownButton<String>(
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                        isExpanded: true,
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                        hint: Text(
                                          "${translateDataBase("اختار صلاحيتك", "Choose your validity")}",
                                          style: TextStyle(
                                            color: AppColor.primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        items: controller.permissions.map((e) {
                                          String value = e.keys.first;
                                          String text = e.values.first;
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(text.tr),
                                          );
                                        }).toList(),
                                        onChanged: (String? val) {
                                          controller.userApprove = val ?? "";
                                          controller.update();
                                          controllerImp.update();
                                        },
                                        value: controller.userApprove,
                                      )),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButtonAuth(
                                  text: "signup".tr,
                                  onPressed: () {
                                    controller.signUp();
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextSignUpOrIn(
                                text1: "youhave".tr,
                                text2: "signin".tr,
                                onTap: () {
                                  controller.goToSignIn();
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
