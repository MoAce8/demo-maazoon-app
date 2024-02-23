import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maazoon/screens/registeration_screen/otp_screen.dart';
import 'package:maazoon/shared/components.dart';
import 'package:maazoon/shared/constants.dart';
import 'package:maazoon/shared/validators.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final userController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfController = TextEditingController();
  final emailController = TextEditingController();
  final idController = TextEditingController();

  bool _passwordVisible = true;
  bool _passwordConfVisible = true;

  bool checked = false;
  bool boxError = false;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      context: context,
      title: const Text('إنشاء حساب جديد'),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مرحبا بك في تطبيق مأذون',
              style: TextStyle(
                color: AppColors.oliveAccent,
                fontSize: screenWidth(context) / 19, //19f,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'من فضلك ادخل البيانات التالية لانشاء حسابك',
              style: TextStyle(
                color: AppColors.primaryGreen,
                fontSize: screenWidth(context) / 22, //16f
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: screenHeight(context) / 35.5, //22
            ),
            CustomTextField(
              controller: userController,
              title: 'اسم المستخدم',
              validator: (value) => userValidator(value ?? ''),
            ),
            SizedBox(
              height: screenHeight(context) / 48.75, //16s
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
              height: screenHeight(context) / 48.75, //16s
            ),
            CustomTextField(
              controller: emailController,
              title: 'البريد الالكتروني',
              validator: (value) => emailValidator(value ?? ''),
              keyboard: TextInputType.emailAddress,
            ),
            SizedBox(
              height: screenHeight(context) / 48.75, //16s
            ),
            CustomTextField(
              controller: idController,
              title: 'رقم الهوية',
              validator: (value) => idValidator(value ?? ''),
            ),
            SizedBox(
              height: screenHeight(context) / 48.75, //16s
            ),
            CustomTextField(
              title: 'كلمة المرور',
              keyboard: TextInputType.visiblePassword,
              controller: passwordController,
              obscure: _passwordVisible,
              suffix: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              validator: (value) => passwordValidator(value ?? ''),
            ),
            SizedBox(
              height: screenHeight(context) / 48.75, //16s
            ),
            CustomTextField(
              title: 'تأكيد كلمة المرور',
              keyboard: TextInputType.visiblePassword,
              controller: passwordConfController,
              validator: (value) {
                value ?? '';
                if (value!.trim().isEmpty) {
                  return 'تأكيد كلمة المرور مطلوب';
                }
                if (passwordController.text != passwordConfController.text) {
                  return 'كلمة المرور غير متطابقة';
                }
                return null;
              },
              obscure: _passwordConfVisible,
              suffix: IconButton(
                icon: Icon(
                  _passwordConfVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _passwordConfVisible = !_passwordConfVisible;
                  });
                },
              ),
            ),
            SizedBox(
              height: screenHeight(context) / 48.75, //16s
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: checked,
                  isError: boxError,
                  activeColor: AppColors.primaryGreen,
                  onChanged: (val) {
                    setState(() {
                    checked = val!;
                    if (checked){
                      boxError=false;
                    }
                    });
                  },
                ),
                Text(
                  'بتسجيلك للدخول فأنت توافق على ',
                  style: TextStyle(fontSize: screenWidth(context) / 26), //15
                ),
                Text(
                  'الشروط والأحكام',
                  style: TextStyle(
                      color: AppColors.primaryGreen,
                      decoration: TextDecoration.underline,
                      fontSize: screenWidth(context) / 26, //15
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight(context) / 48.75, //16s
            ),
            AppElevatedButton(
              context: context,
              onPressed: () {
                if(!checked){
                  setState(() {
                    boxError=true;
                  });
                }
                if (formKey.currentState!.validate()&&checked) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const OTPScreen(
                                title: 'رمز otp',
                              )));
                }
              },
              title: 'إنشاء حساب جديد',
            ),
            SizedBox(
              height: screenHeight(context) / 78,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('لديك حساب؟'),
                TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'سجل الدخول الان',
                      style: TextStyle(color: AppColors.blue),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
