import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kings_cogent_app/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //signup user6
  Future<String> signUpUser({
    required String email,
    required String password,
    required String confirmpassword,
    required String firstname,
    required String lastname,
    required String address,
    required String city,
    required String subcounty,
    required String parish,
    required String village,
    required String dateofbirth,
    required String telephonenumber1,
    required String telephonenumber2,
    required String nationalIDnumber,
    required String nextofkin1,
    required String nextofkin2,
  }) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          confirmpassword.isNotEmpty ||
          firstname.isNotEmpty ||
          lastname.isNotEmpty ||
          address.isNotEmpty ||
          city.isNotEmpty ||
          subcounty.isNotEmpty ||
          parish.isNotEmpty ||
          village.isNotEmpty ||
          dateofbirth.isNotEmpty ||
          telephonenumber1.isNotEmpty ||
          telephonenumber2.isNotEmpty ||
          nationalIDnumber.isNotEmpty ||
          nextofkin1.isNotEmpty ||
          nextofkin2.isNotEmpty) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);
        // add user to our datebase

        model.User user = model.User(
          firstname: firstname,
          lastname: lastname,
          email: email,
          uid: cred.user!.uid,
          city: city,
          subcounty: subcounty,
          parish: parish,
          village: village,
          telephonenumber1: telephonenumber1,
          telephonenumber2: telephonenumber2,
          nationalIDnumber: nationalIDnumber,
          dateofbirth: dateofbirth,
          address: address,
          nextofkin1: nextofkin1,
          nextofkin2: nextofkin2,
        );

        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJson(),
            );
        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid email') {
        res = 'Incorrect Email';
      } else if (err.code == 'weak password') {
        res = 'Weak Password';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // signing in user

  // signing in user
  Future<String> signinUser({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          confirmPassword.isNotEmpty) {
        // Check if password and confirm password match
        if (password != confirmPassword) {
          return 'Passwords do not match';
        }
        // Sign in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}
