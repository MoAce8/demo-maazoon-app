import 'package:flutter/material.dart';
import 'package:maazoon/screens/forget_password/new_password_screen.dart';
import 'package:maazoon/shared/components.dart';
import 'package:maazoon/shared/constants.dart';
import 'package:maazoon/shared/validators.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final otpController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      context: context,
      title: Text(widget.title),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              'لقد أرسلنا لك رسالة نصية قصيرة مكونة من 6 أرقام',
              style: TextStyle(
                fontSize: screenWidth(context) / 22, //16f
              ),
            ),
            SizedBox(
              height: screenHeight(context) / 31.2,
            ),
            PinCodeTextField(
              appContext: context,
              length: 6,
              controller: otpController,
              autovalidateMode: AutovalidateMode.disabled,
              validator: (value) => otpValidator(value ?? ''),
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                inactiveColor: AppColors.grey,
                selectedColor: AppColors.darkOlive,
                activeColor: AppColors.darkGrey,
              ),
            ),
            SizedBox(
              height: screenHeight(context) / 34,
            ),
            AppElevatedButton(
                context: context,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    widget.title == "نسيت كلمة المرور"
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const NewPasswordScreen(),
                            ),
                          )
                        : showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              backgroundColor: AppColors.white,
                              title: Text(
                                'تهانينا',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.darkGrey,
                                  fontSize: screenWidth(context) / 19, //19f,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              alignment: Alignment.center,
                              content: Text(
                                'تم انشاء حسابك بنجاح',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: screenWidth(context) / 22.5, //16f
                                ),
                              ),
                              actionsPadding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 40,
                              ),
                              titlePadding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              actions: [
                                AppElevatedButton(
                                  context: context,
                                  onPressed: () {
                                    Navigator.popUntil(
                                        context, (route) => route.isFirst);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('تم إنشاء حسابك بنجاح قم بتسجيل الدخول'),
                                        backgroundColor: AppColors.darkOlive,

                                      ),
                                    );
                                  },
                                  title: 'حسنا',
                                )
                              ],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          );
                  }
                },
                title: 'تحقق'),
            SizedBox(
              height: screenHeight(context) / 78,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('لم يتم الاستلام ؟'),
                TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'ارسل مرة اخرى',
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
