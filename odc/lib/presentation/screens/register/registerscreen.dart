 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/presentation/screens/homepage.dart';
import 'package:odc/presentation/screens/login/loginscreen.dart';
import 'package:odc/presentation/widgets/inputField.dart';

import '../../../business_logic/auth/register/register_cubit.dart';


class RegisterScreen extends StatefulWidget {

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var name_controller =TextEditingController();

  var email_controller =TextEditingController();

  var password_controller =TextEditingController();

  var confirmpassword_controller =TextEditingController();

  var phone_controller =TextEditingController();

  var gender_controller =TextEditingController();

  var university_controller =TextEditingController();

  var grade_controller =TextEditingController();

  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

 List<DropdownMenuItem<String>> genderMenu = const [

    DropdownMenuItem(
    value: 'm',
      child: Text('Male'),
 ),
    DropdownMenuItem(
      value: 'f',
      child: Text('Female'),
    ),
  ];

  String gender = 'm';

  void changeGender(val) {
    gender = val;
  }

  var genderSelected = "Select gender";

  String dropdownvalue = 'AUC';

  // List of items in our dropdown menu
  var items = [
    'AUC',
    'GUC',
    'Cairo',
    'Ain Shams',

  ];
  String dropdownvalue2 = 'One';

  // List of items in our dropdown menu
  var items2 = [
    'One',
    'Two',
    'Three',
    'Four',

  ];

/*
  List<DropdownMenuItem<String>> uniMenu = const [
    DropdownMenuItem(
      //value: '1',
      child: Text('AUC'),
    ),
    DropdownMenuItem(
     // value: '2',
      child: Text('GUC'),
    ),
    DropdownMenuItem(
      // value: '2',
      child: Text('Cairo'),
    ),
    DropdownMenuItem(
      // value: '2',
      child: Text('Ain Shams'),
    )
  ];
 String uni = 'GUC';
*/
  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    return BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Scaffold(body: SingleChildScrollView(child: Container(
            padding: EdgeInsets.all(25),
            child: Form(
              key: registerKey,
              child: Column(
                  children: [
                    SizedBox(height: 50),
                    Image.asset("images/orange.jpg"),
                    SizedBox(height: 40),
                    Container(alignment: AlignmentDirectional.topStart,
                        child: Text("Sign Up",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight
                              .bold),)),
                    SizedBox(height: 30),
                    inputfield(label: "Name",
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Your Name';
                        } else if (value.length > 32) {
                          return 'Name Must be less than 32 characters';
                        }
                      },
                      iconButton: IconButton(
                        icon: Icon(Icons.person,color: Colors.orange,), onPressed: () {},),
                      controller: name_controller,),
                    SizedBox(height: 20),
                    inputfield(label: "Email",
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Your Email';
                        } else if (!RegExp(
                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                            .hasMatch(value)) {
                          return 'Please Enter Valid as example@gmail.com';
                        }
                      },
                      iconButton: IconButton(
                        icon: Icon(Icons.email_outlined,color: Colors.orange,), onPressed: () {},),
                      controller: email_controller,),
                    SizedBox(height: 20),
                    inputfield(label: "Password",
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Your Password';
                        }
                      },
                      iconButton: IconButton(
                        icon: Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {},),
                      controller: password_controller,
                      isObscureText: true,
                      isPasswordField: true,),
                    SizedBox(height: 20),
                    inputfield(label: "Confirm Password",
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Your Confirm Password';
                        }
                      },
                      iconButton: IconButton(
                        icon: Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {},),
                      controller: confirmpassword_controller,
                      isObscureText: true,
                      isPasswordField: true,),
                    SizedBox(height: 20),
                    inputfield(label: "Phone Number",
                      iconButton: IconButton(
                        icon: Icon(Icons.phone,color: Colors.orange,), onPressed: () {},),
                      controller: phone_controller,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Your Phone Number';
                        } else if (value.length != 11) {
                          return "Phone Number Must be 11 Number";
                        }
                      },),
                    SizedBox(height: 15),


                    Row(
                        children: [

                          SizedBox(width: 5,),
                          Column(
                            children: [
                              Text("Grade",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                              SizedBox(height: 10,),
                              Container(
                                  height: 50,
                                  width: 130,
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.orange, width: 2),
                                  ),
                       child :   DropdownButton(

                                // Initial Value
                                value: dropdownvalue2,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: items2.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue2 = newValue!;
                                  });
                                },
                              ),
                              ),
                            ],
                          ),

                          Spacer(),
                          Column(
                            children: [
                              Text("University",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                              SizedBox(height: 10,),
                              Container(
                                height: 50,
                                width: 130,
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.orange, width: 2),
                                ),
                                child :   DropdownButton(

                                  value: dropdownvalue,


                                  icon: const Icon(Icons.keyboard_arrow_down),

                                  // Array list of items
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),

                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),


                             ]
                            ),


                    /*    Column(
             children: [
               Text("University"),
               SizedBox(height:10),
               Container(
                 height: 50,
                 width: 100,
                 padding: EdgeInsets.symmetric(horizontal: 5),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(10),
                   border: Border.all(color: Colors.orange, width: 2),
                 ),
                 child: DropdownButtonHideUnderline(
                   child: DropdownButton<String>(
                     isExpanded: true,
                     onChanged: (value) {
                       registerCubit.changeuni(value);
                     },
                     value: registerCubit.uni,
                     items: uniMenu,
                   ),
                 ),
               ),
             ],
           ),
*/
/* Spacer(),
      Column(
             children: [
               Text("Grade"),
               SizedBox(height:10),
               Container(
                 height: 50,
                 width: 100,
                 padding: EdgeInsets.symmetric(horizontal: 5),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(10),
                   border: Border.all(color: Colors.orange, width: 2),
                 ),
                 child: DropdownButtonHideUnderline(
                   child: DropdownButton<String>(
                     isExpanded: true,
                     onChanged: (value) {
                       registerCubit.changegrade(value);
                     },
                     value: registerCubit.grade,
                     items: gradeMenu,
                   ),
                 ),
               ),
             ],
           ),
*/
                    SizedBox(height: 15,),


                 /*   Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange, width: 2),
                      ),
                      child:
                      DropdownButton
                        (borderRadius: BorderRadius.circular(2),

                        items: [
                          DropdownMenuItem(child: Text("University")
                          ),

                        ], onChanged: null,),),
                    SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange, width: 2),
                      ),
                      child:
                      DropdownButton
                        (borderRadius: BorderRadius.circular(2),

                        items: [
                          DropdownMenuItem(child: Text("Grade")
                          ),

                        ], onChanged: null,),),
*/
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Gender",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                            SizedBox(height: 10),

                            Container(
                              alignment: AlignmentDirectional.topStart,
                              height: 50,
                              width: 130,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.orange, width: 2),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  onChanged: (value) {
                                    registerCubit.changeGender(value);
                                  },
                                  value: registerCubit.gender,
                                  items: genderMenu,
                                ),
                              ),
                            ),
                          ]),
                    ),
SizedBox(height: 15,),
                    GestureDetector(
                      onTap: () {
                        if (registerKey.currentState!.validate()) {
                          registerCubit.postRegister(
                              name: name_controller.text,
                              email: email_controller.text,
                              password: password_controller.text,
                              phoneNumber: phone_controller.text,
                              gender:
                              registerCubit.gender == 'male' ? 'm' : 'f',
                       universityId: 'AUC',

                              gradeId: '4',

                                  );

                        }
                      },
                      child: Container(
                        width: 390,
                        height: 50,
                        child: Container(
                            alignment: AlignmentDirectional.center,
                            child: Text("Sign Up", style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,),)),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.orange, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    /* Container(
        alignment: AlignmentDirectional.center,
        child:Text("OR",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),),*/
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
                          style: TextStyle(color: Colors.black,
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
                      ],),
                    SizedBox(height: 10,),
    GestureDetector(
    onTap: () {Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => loginScreen(),
        ));},
                child :    Container(
                      width: 390,
                      height: 50,
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        child: Text("Login", style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),),),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange, width: 2),
                      ),
                    ),

            ),
                  ]
              ),
                  ),

            ),
          ),


          );

        }
  );

  }
}
