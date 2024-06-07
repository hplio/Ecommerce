import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/data/repositories.authentication/authentication/repositoeies_authentication.dart';
import 'package:to_do/features/authentication/controllers/signup/email_verification.dart';
import 'package:to_do/utils/constants/size.dart';
import 'package:to_do/utils/constants/text.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmailVerification());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepo.instance.logOut(),
            icon: const Icon(
              Icons.clear,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                width: KSizeScreen.getScreenWidth(context) * .6,
                image: const AssetImage(
                    'assets/images/verification_img/verification gif.gif'),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                KtextString.emailV,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                email??'',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                KtextString.emailVerifyDis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>controller.checkEmailVerificationStatus(),
                  child: const Text('Continue'),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: const Text('Resend Email'),
                  onPressed: ()=>controller.sendEmailVerification(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
