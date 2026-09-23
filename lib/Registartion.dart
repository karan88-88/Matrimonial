import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_project/user.dart';

import 'DBhelper.dart';

class RegistrationScreen extends StatefulWidget {
  User? user;

  RegistrationScreen({this.user});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String gender = "Male";

  //selected hobbies store in selectedHobbies list
  List<String> selectedHobbies = [];

  // hobbyList use for display hobby
  List<String> hobbyList = ["Reading", "Sports", "Music", "Travel"];

  //
  DateTime selectedDOB = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUserData();
    dobController.text = DateFormat("dd/MM/yyyy").format(selectedDOB);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration Form")),
      body: ListView(
        padding: EdgeInsets.all(4),
        children: [
          //First Name Text Field
          EditTextWidget(
            txtcontroller: firstNameController,
            hint: "Enter First Name",
            keyboardType: TextInputType.name,
          ),
          //Last Name Text Field
          EditTextWidget(
            txtcontroller: lastNameController,
            hint: "Enter Last Name",
            keyboardType: TextInputType.name,
          ),
          //Email Text Field
          EditTextWidget(
            txtcontroller: emailController,
            hint: "Enter Email",
            keyboardType: TextInputType.emailAddress,
          ),
          //Mobile number Text Field
          EditTextWidget(
            txtcontroller: mobileController,
            hint: "Enter Mobile",
            keyboardType: TextInputType.number,
          ),
          //City Text Field
          EditTextWidget(
            txtcontroller: cityController,
            hint: "Enter City",
            keyboardType: TextInputType.name,
          ),
          //Date of Birth Selection Text Field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onTap: () async {
                selectedDOB =
                    await showDatePicker(
                      context: context,
                      initialDate: selectedDOB!,
                      firstDate: DateTime(1925),
                      lastDate: DateTime.now(),
                    ) ??
                        DateTime.now();
                if (selectedDOB != null) {
                  dobController.text = DateFormat(
                    "dd/MM/yyyy",
                  ).format(selectedDOB);
                  setState(() {});
                }
              },
              readOnly: true,
              controller: dobController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Select Date of Birth",
              ),
            ),
          ),
          //Password Text Field
          EditTextWidget(
            txtcontroller: passwordController,
            hint: "Enter password",
            isPassword: true,
          ),
          //Gender Selection Radio
          Text(
            "Select Gender",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          RadioListTile(
            title: Text("Male"),
            secondary: Icon(Icons.male),
            value: "Male",
            groupValue: gender,
            onChanged: (value) {
              gender = value!;
              setState(() {});
            },
          ),
          RadioListTile(
            title: Text("Female"),
            secondary: Icon(Icons.female),
            value: "Female",
            groupValue: gender,
            onChanged: (value) {
              gender = value!;
              setState(() {});
            },
          ),
          //Hobbies Selection Checkbox
          Text(
            "Hobbies:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            hobbyList
                .map(
                  (hobby) => CheckboxListTile(
                title: Text(hobby),
                controlAffinity: ListTileControlAffinity.leading,
                value: selectedHobbies.contains(hobby),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      selectedHobbies.add(hobby);
                    } else {
                      selectedHobbies.remove(hobby);
                    }
                  });
                },
              ),
            )
                .toList(),
          ),
          // Submit and Clear Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  insertUser();
                },
                child: Text("Submit"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
              ),
              SizedBox(width: 24),
              ElevatedButton(
                onPressed: () {
                  clear();
                  setState(() {});
                },
                child: Text("Clear"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //Custom TextFormField for set common property
  Widget EditTextWidget({
    txtcontroller,
    hint,
    isPassword = false,
    keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: isPassword,
        controller: txtcontroller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: hint,
        ),
      ),
    );
  }

  //Clear Function for clear registration page
  void clear() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    mobileController.clear();
    //dobController.clear();
    selectedDOB = DateTime.now();
    cityController.clear();
    passwordController.clear();
    selectedHobbies.clear();
  }

  void setUserData() {
    if (widget.user != null) {
      firstNameController.text = widget.user!.FirstName;
      lastNameController.text = widget.user!.LastName;
      emailController.text = widget.user!.Email;
      mobileController.text = widget.user!.Mobile;
      cityController.text = widget.user!.City;
      passwordController.text = widget.user!.Password;
      selectedHobbies = List<String>.from(jsonDecode(widget.user!.Hobbies));
      selectedDOB = DateTime.parse(widget.user!.DOB);
      gender = widget.user!.Gender;
    }
  }

  Future<void> insertUser() async {
    DBHelper db = DBHelper();
    /* List<User> listUser=await db.getAllUser();
    print(listUser[0].toString());*/
    User user = User();
    user.FirstName = firstNameController.text;
    user.LastName = lastNameController.text;
    user.Email = emailController.text;
    user.Hobbies = jsonEncode(selectedHobbies);
    user.Gender = gender;
    user.City = cityController.text;
    user.Password = passwordController.text;
    user.DOB = selectedDOB.toIso8601String();
    user.Mobile = mobileController.text;

    if(widget.user==null)
    {
      db.insertUser(user).then((value){
        if(value != 0)
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Data add successfully!!!")));
          clear();
          setState(() {

          });
        }
      },);
    }
    else{
      user.UserID  = widget.user!.UserID;
      user.isFavourite = widget.user!.isFavourite;
      db.updateUser(user).then((value){
        if(value != 0)
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Data Update successfully!!!")));
          clear();
          Navigator.pop(context);
        }
      },);
    }

    List<User> listUser = await db.getAllUser();

    // if (widget.user == null) {
    //   db.insertUser(user).then((value) {
    //     if (value != 0) {
    //       ScaffoldMessenger.of(
    //         context,
    //       ).showSnackBar(SnackBar(content: Text("Data add successfully!!!")));
    //       clear();
    //       setState(() {});
    //     }
    //   });
    // } else {
    //   user.UserID = widget.user!.UserID;
    //   user.isFavourite = widget.user!.isFavourite;
    //   db.updateUser(user).then((value) {
    //     if (value != 0) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text("Data Update successfully!!!")),
    //       );
    //       clear();
    //       Navigator.pop(context);
    //     }
    //   });
    // }
  }
}
