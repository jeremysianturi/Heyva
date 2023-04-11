import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/modules/login/controllers/login_controller.dart';
import 'package:heyva/app/modules/splashscreen/splashscreen.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/constant/variabels.dart';

import '../firebase_options.dart';
import 'controllers/auth_controller.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "heyva-b10f5",
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
                  // box.write(Keys.loginAccessToken,
                  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkZW50aWZpZXIiOiJhMDM1YTEzOS05MjU4LTQ2NWEtODVmYS1lZjZhMGJhM2E1MzIiLCJleHAiOjE2ODA5Mzc3NDEsImlhdCI6MTY4MDkzNDE0MS42MTk5MjQsInNjb3BlIjoiQUNDRVNTIiwidXNlcm5hbWUiOm51bGwsImVtYWlsIjoia2FuZy1iYWtzb0BoYXJha2lyaW1haWwuY29tIiwicGhvbmVfbnVtYmVyIjpudWxsLCJwcm9maWxlX2NvZGUiOiIyMDIzMDMxNjAwMDAwMDE0Iiwicm9sZXMiOlsiNzYzOWViODktNWM3Ni00MDI4LWE5YmYtNzBkMDAwOGY3MTRlIl19.orOGcIi71g_S-TJSffIdSSU_rFVAgF4jnS2FIuWrZhQ");
                  // box.write(Keys.loginRefreshToken,
                  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkZW50aWZpZXIiOiJhMDM1YTEzOS05MjU4LTQ2NWEtODVmYS1lZjZhMGJhM2E1MzIiLCJleHAiOjE2ODE1Mzg5NDEsImlhdCI6MTY4MDkzNDE0MS42MjIzNjMsInNjb3BlIjoiUkVGUkVTSCIsInVzZXJuYW1lIjpudWxsLCJlbWFpbCI6ImthbmctYmFrc29AaGFyYWtpcmltYWlsLmNvbSIsInBob25lX251bWJlciI6bnVsbCwicm9sZXMiOlsiNzYzOWViODktNWM3Ni00MDI4LWE5YmYtNzBkMDAwOGY3MTRlIl19.QtRqC7F4oIx8JThu3IyAS6L6n72_0mhqFOz4YIyF8HA");
                  // box.write(
                  //     Keys.loginID, "a035a139-9258-465a-85fa-ef6a0ba3a532");
                  authToken = box.read(Keys.loginAccessToken).toString();
                  refreshToken = box.read(Keys.loginRefreshToken).toString();
                  debugPrint("auth token $authToken");
                  var loginC = Get.put(LoginController());
                  loginC.refresh();
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
