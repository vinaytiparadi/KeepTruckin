import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keeptruckin/constants.dart';
import 'package:keeptruckin/home_screen.dart';


class RegisterScreen extends StatefulWidget {
  static String routeName = '/register_screen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Object? registeredAs;

  TextEditingController userNameController = TextEditingController();
  TextEditingController alternateMobileNumber = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: userNameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          border: outlineEnabledBorder(),
                          labelText: 'Name',
                          hintText: 'Enter Name'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: alternateMobileNumber,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      maxLength: 10,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          border: outlineEnabledBorder(),
                          labelText: 'Mobile Number',
                          hintText: 'Enter Mobile Number'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // style: const TextStyle(fontSize: 16),
                      controller: countryController,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          border: outlineEnabledBorder(),
                          labelText: 'Country',
                          hintText: 'Enter Country'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // style: const TextStyle(fontSize: 16),
                      controller: stateController,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          border: outlineEnabledBorder(),
                          labelText: 'State',
                          hintText: 'Enter State'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // style: const TextStyle(fontSize: 16),
                      textCapitalization: TextCapitalization.words,

                      controller: districtController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          border: outlineEnabledBorder(),
                          labelText: 'City',
                          hintText: 'Enter City'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // style: const TextStyle(fontSize: 16),
                      controller: pinCodeController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          border: outlineEnabledBorder(),
                          labelText: 'Pincode',
                          hintText: 'Enter Pincode'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: scHeight(context)*0.06,
                      width: double.infinity,
                      child: FilledButton(
                          onPressed: () async {
                            const snackBar = SnackBar(
                              duration: Duration(milliseconds: 800),
                              backgroundColor: Colors.green,
                              content: Text('Registering user..'),
                            );

                            User user = FirebaseAuth.instance.currentUser!;

                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(user.uid)
                                .set({
                              'user_name': userNameController.text,
                              'country': countryController.text,
                              'mobile_number': alternateMobileNumber.text,
                              'state': stateController.text,
                              'city': districtController.text,
                              'pincode': pinCodeController.text,
                            });

                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (builder) => HomeScreen()),
                                  (route) => false,
                            );
                          }, child: Text("Register"),),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
