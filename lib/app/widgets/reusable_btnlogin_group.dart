import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/login/views/login_view.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../constant/colors.dart';
import '../../constant/strings.dart';

class ReusableBtnLoginGroup extends StatelessWidget {
  ReusableBtnLoginGroup({
    required this.orangeBtnText,
    required this.detemineAction,
    this.onTap,
  });

  final String orangeBtnText;
  final String detemineAction;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              if (detemineAction == Strings.continue_email) {
                Get.to(LoginView());
              } else if (detemineAction == Strings.login) {
                // Get.to(RegisterView());
                onTap!();
              } else if (detemineAction == Strings.register) {
                // Get.to(OnBoardingOneView());
                onTap!();
              }
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorApp.btn_orange),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  side: BorderSide(color: ColorApp.btn_orange),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 17, right: 20, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(orangeBtnText),
                  const ImageIcon(
                    AssetImage("assets/icons/ic_arrow_right.png"),
                    color: ColorApp.arrow_white,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(children: const [
            Expanded(child: Divider()),
            SizedBox(
              width: 24,
            ),
            Text(Strings.or),
            SizedBox(
              width: 24,
            ),
            Expanded(child: Divider()),
          ]),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {
              _googleSignIn.signIn().then((value) => {
                print("value $value"),
                print("displayname ${value?.displayName}"),
                print("email ${value?.email}"),
                print("asdkalskdj ${value?.id}"),
                print("id ${value?.serverAuthCode}"),
                if (value?.email != null)
                  {
                    // controller.postLoginGoogle(
                    //     value?.email, value?.displayName),
                  },
                _googleSignIn.signOut()
              });

              // Get.to(LoginGoogleAppleView());
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(ColorApp.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  side: BorderSide(color: ColorApp.btn_orange),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 17, right: 20, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/ic_google.png"),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    Strings.continue_google,
                    style: TextStyle(color: ColorApp.black, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: () async {
              final credential = await SignInWithApple.getAppleIDCredential(
                scopes: [
                  AppleIDAuthorizationScopes.email,
                  AppleIDAuthorizationScopes.fullName,
                ],
              );

              print(credential);

              // Now send the credential (especially `credential.authorizationCode`) to your server to create a session
              // after they have been validated with Apple (see `Integration` section for more information on how to do this)
            },
            // onPressed:(){},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(ColorApp.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 17, right: 20, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/ic_apple.png"),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    Strings.continue_apple,
                    style: TextStyle(color: ColorApp.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
