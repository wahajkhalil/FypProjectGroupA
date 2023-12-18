import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/DB/DatabaseHelper.dart';
import 'package:fyp_project_group_a/Model/user.dart';
import 'package:fyp_project_group_a/Page/LoginPage.dart';
import 'package:fyp_project_group_a/Util/MyDialogUtils.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  DateTime? selectedDate;
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final DatabaseHelper databaseHelper = DatabaseHelper();

  String? nameError;
  String? phoneNumberError;
  String? emailError;
  String? dateOfBirthError;
  String? passwordError;

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  void _initializeDatabase() async {
    await databaseHelper.initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Container(
          height: MediaQuery.of(context).size.height, // Set a fixed height

          color: Color(0xFF357AFF),
          child: ListView(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Image.asset(
                      'assets/images/Pattern.png',
                      width: double.infinity,
                    ),
                  ),
                  Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: Image.asset(
                            'assets/images/Logo_App.png',
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Container(
                          height: 700,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, left: 20),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontFamily: 'Intersemibold',
                                        fontSize: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 0.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: _buildTextField(
                                  'Name',
                                  Icons.person,
                                  nameController,
                                  isPassword: false,
                                  errorText: nameError,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: _buildTextField(
                                  'Phone Number',
                                  Icons.phone,
                                  phoneNumberController,
                                  isPassword: false,
                                  errorText: phoneNumberError,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: _buildTextField(
                                  'Email Address',
                                  Icons.email,
                                  emailController,
                                  isPassword: false,
                                  errorText: emailError,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: _buildDateField(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: _buildTextField(
                                  'Password',
                                  Icons.lock,
                                  passwordController,
                                  isPassword: true,
                                  errorText: passwordError,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Container(
                                height: 56,
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    _registerUser();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.orange),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.white,
                                          fontFamily: "Intersemibold"),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child:GestureDetector(
                                onTap: () {
                                  // Handle the click here, e.g., navigate to another screen
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));


                                }, child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Already have an account? ",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                          fontFamily: "Inter"),
                                    ),
                                    TextSpan(
                                      text: "Sign In",
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 16.0,
                                          fontFamily: "Intersemibold"),
                                    ),
                                  ],
                                ),
                              )
                              ),

                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, IconData icon, TextEditingController controller,
      {bool isPassword = false, String? errorText}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
        style: TextStyle(
          fontFamily: 'Intersemibold',
          fontSize: 14.0,
        ),
        controller: controller,
        keyboardType: isPassword ? TextInputType.text : TextInputType.text,
        obscureText: isPassword ? !isPasswordVisible : false,
        onChanged: (value) {
          setState(() {
            // Update the corresponding errorText state variable
            if (controller.text.isEmpty) {
              errorText = 'Field cannot be empty';
            } else {
              errorText = null;
            }
          });
        },
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          errorText: errorText,
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );

          if (pickedDate != null && pickedDate != selectedDate) {
            // Check if the selected date is at least 18 years ago
            DateTime eighteenYearsAgo = DateTime.now().subtract(Duration(days: 18 * 365));
            if (pickedDate.isBefore(eighteenYearsAgo)) {
              setState(() {
                selectedDate = pickedDate;
                dateOfBirthError = null; // Reset error when a valid date is selected
              });
            } else {
              setState(() {
                dateOfBirthError = 'Age must be at least 18 years old';
              });
            }
          }
        },
        child: AbsorbPointer(
          child: TextField(
            style: TextStyle(
              fontFamily: 'Intersemibold',
              fontSize: 14.0,
            ),
            controller: TextEditingController(
              text: selectedDate != null
                  ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                  : '',
            ),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Date of Birth',
              prefixIcon: Icon(Icons.calendar_today),
              errorText: dateOfBirthError,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _registerUser() async {
    if (_validateInputs()) {
      User newUser = User(
        name: nameController.text,
        phoneNumber: phoneNumberController.text,
        email: emailController.text,
        dateOfBirth: selectedDate,
        password: passwordController.text,
      );

      // Check if email is already registered
      bool isEmailRegistered =
      await databaseHelper.isEmailRegistered(emailController.text);
      if (isEmailRegistered) {
        // Email is already registered, show error message
        MyDialogUtils.showGenericDialogNegative(
          context: context,
          title: 'Email is already registered.',
          onConfirmPressed: (value) {
            print('User entered: $value');
          },
        );

        return;
      }

      int userId = await databaseHelper.insertUseritem(newUser);

      if (userId > 0) {
        // Successfully registered
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));


        // You can navigate to another screen or perform any other actions.
      } else {
        // Failed to register.
        MyDialogUtils.showGenericDialogNegative(
          context: context,
          title: 'Failed to register user',
          onConfirmPressed: (value) {
            print('User entered: $value');
          },
        );
      }
    }
  }

  bool _validateInputs() {
    bool isValid = true;

    if (nameController.text.isEmpty) {
      setState(() {
        nameError = 'Field cannot be empty';
      });
      isValid = false;
    } else {
      setState(() {
        nameError = null;
      });
    }

    if (phoneNumberController.text.isEmpty) {
      setState(() {
        phoneNumberError = 'Field cannot be empty';
      });
      isValid = false;
    } else {
      setState(() {
        phoneNumberError = null;
      });
    }

    if (emailController.text.isEmpty) {
      setState(() {
        emailError = 'Field cannot be empty';
      });
      isValid = false;
    } else if (!isValidEmail(emailController.text)) {
      setState(() {
        emailError = 'Enter a valid email address';
      });
      isValid = false;
    } else {
      setState(() {
        emailError = null;
      });
    }

    if (selectedDate == null) {
      setState(() {
        dateOfBirthError = 'Field cannot be empty';
      });
      isValid = false;
    } else {
      setState(() {
        dateOfBirthError = null;
      });
    }

    if (passwordController.text.isEmpty) {
      setState(() {
        passwordError = 'Field cannot be empty';
      });
      isValid = false;
    } else {
      setState(() {
        passwordError = null;
      });
    }

    return isValid;
  }

  bool isValidEmail(String email) {
    // Add your email validation logic here
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+")
        .hasMatch(email);
  }
}
