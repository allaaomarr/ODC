import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/presentation/widgets/inputField.dart';
import 'package:odc/presentation/screens/register/registerscreen.dart';
import '../../../business_logic/auth/login/login_cubit.dart';
import '../../../business_logic/auth/login/login_state.dart';
import '../../../constants/constant_methods.dart';
import '../homepage.dart';


class loginScreen extends StatelessWidget {
  loginScreen({Key? key}) : super(key: key);
final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
bool hidden_password = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            flutterToast(msg: 'Logged in Successfully', color: Colors.green);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const home(),
                ),
                    (route) => false);
          }
        },
        builder: (context, state) {
          LoginCubit loginCubit = LoginCubit.get(context);
          return Scaffold(
              body: SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.all(25),
                      child: Form(
                        key: loginKey,
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            Image.asset("images/orange.jpg"),
                            SizedBox(height: 40),
                            Container(
                                alignment: AlignmentDirectional.topStart,
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 30, fontWeight: FontWeight
                                      .bold),
                                )),
                            SizedBox(height: 30),
                            inputfield(
                                label: "Email",
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Your Email';
                                  } else if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                                      .hasMatch(value)) {
                                    return 'Please Enter Valid as example@gmail.com';
                                  }
                                },
                                controller: email_controller,
                                iconButton: IconButton(
                                  icon: Icon(Icons.email_outlined,color: Colors.orange,),
                                  onPressed: () {},
                                )),
                            SizedBox(height: 20),
                            inputfield(
                                label: "Password",
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Your password';
                                  }
                                },
                                controller: password_controller,
                                iconButton: IconButton(
                                  icon: Icon(Icons.remove_red_eye_outlined),
                                  onPressed: () {},
                                ),isObscureText: true,isPasswordField: true,),
                            SizedBox(height: 5),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.orange,
                                    ),
                                  )),
                            ),
                            SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                if (loginKey.currentState!.validate()) { //
                                  loginCubit.postLogin(
                                    email: email_controller.text,
                                    password: password_controller.text,
                                  );
                                }
                              },
                              child:
                              Container(
                                width: 390,
                                height: 50,
                                child: Container(
                                    alignment: AlignmentDirectional.center,
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    )),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.orange, width: 2),
                                ),
                              ),),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Expanded(
                                  child: Divider(
                                    indent: 20.0,
                                    endIndent: 10.0,
                                    thickness: 2,
                                  ),
                                ),
                                Text(
                                  "OR",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                Expanded(
                                  child: Divider(
                                    indent: 10.0,
                                    endIndent: 20.0,
                                    thickness: 2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ));
                              },
                              child: Container(
                                width: 390,
                                height: 50,
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.orange, width: 2),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))));
        }
    );
  }
}
