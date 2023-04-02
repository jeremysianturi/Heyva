import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/splashscreen/splashscreen.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/variabels.dart';

import 'controllers/auth_controller.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var scrollController = ScrollController();
  final authC = Get.put(AuthController(), permanent: true);

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            final authC = Get.find<AuthController>();
            return StreamBuilder<User?>(
                stream: authC.streamAuthStatus,
                builder: (context, snapshot) {
                  authC.setLoginStatus(snapshot.data != null);
                  // print('snapshot data: ${snapshot.data}');
                  var box = GetStorage();
                  authToken = box.read(Keys.loginAccessToken).toString();
                  refreshToken = box.read(Keys.loginRefreshToken).toString();
                  debugPrint("auth token $authToken");
                  if (authToken != "null" && refreshToken != "null") {
                    return GetMaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: "HEYVA",
                      initialRoute: Routes.BREATHING_ONE,
                      getPages: AppPages.routes,
                    );
                  }
                  return GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: "HEYVA",
                    initialRoute: Routes.SIGNUP,
                    getPages: AppPages.routes,
                  );
                });
          }
        });
  }
}
