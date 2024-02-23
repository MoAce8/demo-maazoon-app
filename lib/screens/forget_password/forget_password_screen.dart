import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maazoon/screens/forget_password/new_password_screen.dart';
import 'package:maazoon/screens/registeration_screen/otp_screen.dart';
import 'package:maazoon/shared/components.dart';
import 'package:maazoon/shared/constants.dart';
import 'package:maazoon/shared/validators.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final phoneNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        context: context,
        title: const Text('نسيت كلمة المرور'),
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'من فضلك ادخل رقم الجوال لارسال الرمز',
                style: TextStyle(
                  fontSize: screenWidth(context) / 22, //16f
                ),
              ),
              SizedBox(
                height: screenHeight(context) / 31.2,
              ),
              CustomTextField(
                title: 'رقم الجوال',
                controller: phoneNumberController,
                icon: Image.asset('assets/images/ksa.png'),
                keyboard: TextInputType.number,
                preText: '966+  ',
                validator: (value) => mobileValidator(value ?? ''),
                format: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(9),
                ],
              ),
              SizedBox(
                height: screenHeight(context) / 31.2,
              ),
              AppElevatedButton(
                  context: context,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const OTPScreen(title: 'نسيت كلمة المرور')));
                    }
                  },
                  title: 'ارسل الرمز')
            ],
          ),
        ));
  }
}
