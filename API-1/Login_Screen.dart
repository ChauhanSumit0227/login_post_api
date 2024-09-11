// import 'package:flutter/material.dart';
// import 'package:login_post_api/API-1/Model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'Api_Service.dart';
// import 'Home_Screen.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final login = TextEditingController();
//   final password = TextEditingController();
//   LoginModel loginModel = LoginModel();
//   bool isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login Screen'),
//         centerTitle: true,
//         backgroundColor: Colors.teal,
//         foregroundColor: Colors.black,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(30),
//         child: Column(
//           children: [
//             TextField(
//               controller: login,
//               decoration: InputDecoration(
//                 hintText: 'Email',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextField(
//               controller: password,
//               decoration: InputDecoration(
//                 hintText: 'Password',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             SizedBox(
//               height: 55,
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: isLoading
//                     ? null
//                     : () async {
//                   setState(() {
//                     isLoading = true;
//                   });
//
//                      await ApiServices().loginWithModel(
//                       login.text.toString(),
//                       password.text.toString(),
//                     );
//
//                   var sharedPref = await SharedPreferences.getInstance();
//                   await sharedPref.setBool(KEYLOGIN, true);
//
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => HomeScreen()));
//                 },
//                 child: isLoading
//                     ? const CircularProgressIndicator(
//                   strokeWidth: 5,
//                   backgroundColor: Colors.yellow,
//                   valueColor: AlwaysStoppedAnimation<Color>(
//                     Colors.red,
//                   ),
//                 )
//                     : const Text('Login'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//



import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Api_Service.dart';
import 'Home_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  final String KEYLOGIN = "isLoggedIn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
             TextField(
              controller: loginController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 10),
             TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 50),
            // Login button
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null :  () async {
                  setState(() {
                    isLoading = true;
                  });

                  // bool success =
                  await ApiServices().loginWithModel(
                    loginController.text.trim(),
                    passwordController.text.trim(),
                  );

                    SharedPreferences sharedPref = await SharedPreferences.getInstance();
                    await sharedPref.setBool(KEYLOGIN, true);

                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => HomeScreen()));
                     ScaffoldMessenger.of(context).showSnackBar;
                 },

                child: isLoading
                    ? const CircularProgressIndicator(
                  strokeWidth: 5,
                  backgroundColor: Colors.yellow,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                )
                    : const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// // correct_login@example.com
// // C0rr3Ct_P@55w0rd