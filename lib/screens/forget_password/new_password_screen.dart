import 'package:flutter/material.dart';
import 'package:maazoon/shared/components.dart';
import 'package:maazoon/shared/constants.dart';
import 'package:maazoon/shared/validators.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final passwordController = TextEditingController();

  final passwordConfController = TextEditingController();

  bool _passwordVisible = true;

  bool _passwordConfVisible = true;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      context: context,
      title: const Text('ادخل كلمة المرور الجديدة'),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'قم بادخال كلمة المرور الجديدة',
              style: TextStyle(
                fontSize: screenWidth(context) / 22, //16f
              ),
            ),
            SizedBox(
              height: screenHeight(context) / 31.2,
            ),
            CustomTextField(
              title: 'كلمة المرور',
              keyboard: TextInputType.visiblePassword,
              hint: 'ادخل كلمة المرور الجديدة',
              floatLabel: true,
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
              title: 'كلمة المرور',
              keyboard: TextInputType.visiblePassword,
              hint: 'اعد ادخال كلمة المرور الجديدة',
              floatLabel: true,
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
              height: screenHeight(context) / 48.75,
            ),
            AppElevatedButton(
              context: context,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  showDialog(
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
                        'تم تعديل كلمة المرور بنجاح',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth(context) / 22.5, //16f
                        ),
                      ),
                      actionsPadding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 40,),
                      titlePadding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                      actions: [
                        AppElevatedButton(
                          context: context,
                          onPressed: () {
                            Navigator.popUntil(context, (route) => route.isFirst);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('تم تغيير كلمة السر بنجاح قم بتسجيل الدخول'),
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
              title: 'حفظ',
            )
          ],
        ),
      ),
    );
  }
}
