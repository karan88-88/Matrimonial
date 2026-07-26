import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
          
              const SizedBox(height: 20),
          
              const Text(
                "Complete Profile",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
          
              const SizedBox(height: 10),
          
              const Text(
                "Complete your details or continue\nwith social media",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
          
              const SizedBox(height: 35),
          
              CustomTextField(
                label: "First Name",
                hint: "Enter your first name",
                icon: Icons.person_outline,
                controller: firstNameController,
              ),
          
              const SizedBox(height: 20),
          
              CustomTextField(
                label: "Last Name",
                hint: "Enter your last name",
                icon: Icons.person_outline,
                controller: lastNameController,
              ),
          
              const SizedBox(height: 20),
          
              CustomTextField(
                label: "Phone Number",
                hint: "Enter your phone number",
                icon: Icons.phone_android,
                controller: phoneController,
              ),
          
              const SizedBox(height: 20),
          
              CustomTextField(
                label: "Address",
                hint: "Enter your address",
                icon: Icons.location_on_outlined,
                controller: addressController,
              ),
          
              const SizedBox(height: 35),
          
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {

                    if (_formKey.currentState!.validate()) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Registration Successful"),
                        ),
                      );

                    }

                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          
              const SizedBox(height: 25),
          
              const Text(
                "By continuing you confirm that you agree\nwith our Term and Condition",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      validator: (value) {

        if (value == null || value.trim().isEmpty) {
          return "$label is required";
        }

        // First Name Validation
        if (label == "First Name") {
          if (!RegExp(r'^[A-Za-z ]+$').hasMatch(value)) {
            return "Only letters allowed";
          }

          if (value.length < 2) {
            return "Minimum 2 characters";
          }
        }

        // Last Name Validation
        if (label == "Last Name") {
          if (!RegExp(r'^[A-Za-z ]+$').hasMatch(value)) {
            return "Only letters allowed";
          }

          if (value.length < 2) {
            return "Minimum 2 characters";
          }
        }

        // Phone Validation
        if (label == "Phone Number") {

          if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
            return "Enter valid 10 digit phone number";
          }

        }

        // Address Validation
        if (label == "Address") {

          if (value.length < 5) {
            return "Address is too short";
          }

        }

        return null;
      },

      decoration: InputDecoration(

        labelText: label,

        hintText: hint,

        suffixIcon: Icon(icon),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.deepOrange,
            width: 2,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }
}


