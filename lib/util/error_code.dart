import 'package:flutter/material.dart';

errorCode(BuildContext context,String error){
  switch (error) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      snackBar(context,"Email already in use");
      break;
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      snackBar(context,"Wrong email/password combination.");
      break;
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      snackBar(context,"No user found with this email.");
      break;
    case "ERROR_USER_DISABLED":
    case "user-disabled":
      snackBar(context,"User disabled.");
      break;
    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      snackBar(context,"Too many requests to log into this account.");
      break;
    case "ERROR_OPERATION_NOT_ALLOWED":
    case "operation-not-allowed":
      snackBar(context,"Server error, please try again later.");
      break;
    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      snackBar(context,"Email address is invalid.");
      break;
    default:
      snackBar(context,"Login failed. Please try again.");
      break;
  }
}

snackBar(BuildContext context,String s){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 3000),
      backgroundColor: Colors.purple,
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Text(s,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}