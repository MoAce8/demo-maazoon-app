import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maazoon/screens/forget_password/forget_password_screen.dart';
import 'package:maazoon/screens/home_page/home_page.dart';
import 'package:maazoon/screens/registeration_screen/registeration_screen.dart';
import 'package:maazoon/shared/components.dart';
import 'package:maazoon/shared/constants.dart';
import 'package:maazoon/shared/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      context: context,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight(context) * 0.4,
              width: screenWidth(context),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/debla.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: screenWidth(context) * 0.25,
                  height: screenHeight(context) * 0.08,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight(context) / 31.2, //25s
            ),
            Container(
              width: screenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'مرحبا بك في تطبيق مأذون',
                      style: TextStyle(
                        fontSize: screenWidth(context) / 19, //19f
                        fontWeight: FontWeight.bold,
                        color: AppColors.oliveAccent,
                      ),
                    ),
                    Text(
                      'الشريك الموثوق لعقد قرانك',
                      style: TextStyle(
                        fontSize: screenWidth(context) / 22, //16f
                        color: AppColors.primaryGreen,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) / 97.5, //8s
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
                      height: screenHeight(context) / 48.75, //16,
                    ),
                    CustomTextField(
                      title: 'كلمة المرور',
                      keyboard: TextInputType.visiblePassword,
                      controller: passwordController,
                      obscure: _passwordVisible,
                      suffix: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
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
                      height: screenHeight(context) / 78,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => ForgetPasswordScreen()));
                          },
                          child: Text(
                            'نسيت كلمة المرور؟',
                            style: TextStyle(
                              color: AppColors.blue,
                              fontSize: screenWidth(context) / 25.7, //14f
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight(context) / 78,
                    ),
                    AppElevatedButton(
                      context: context,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const HomePage()));
                        }
                      },
                      title: 'تسجيل الدخول',
                    ),
                    SizedBox(
                      height: screenHeight(context) / 78,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('ليس لديك حساب؟'),
                        TextButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          const RegisterScreen()));
                            },
                            child: const Text(
                              'انشاء حساب جديد',
                              style: TextStyle(color: AppColors.blue),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*suffix: DropdownButton(
                        items: flags
                            .map(
                              (e) => DropdownMenuItem(
                                child: Image.asset(e),
                                value: e,
                              ),
                            )
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            print(val);
                          });
                        },
                        value: Image.asset(pickedFlag),

 */
