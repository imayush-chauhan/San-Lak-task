import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shooping_app/core/extensions/app_extensions.dart';
import 'package:shooping_app/core/init/navigation/nav.dart';
import 'package:shooping_app/features/home/view/home_view.dart';
import 'package:shooping_app/features/home/view/login_view.dart';
import 'package:shooping_app/product/component/textfield.dart';
import 'package:shooping_app/util/error_code.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool load = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: bottomWidget(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const SizedBox(),
        leadingWidth: 0,
        title: Text("SignUp",
          style: TextStyle(
              color: context.purple,
              fontSize: 20,
              fontWeight: FontWeight.w700
          ),),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              textField("Name", name, TextInputType.name, false, !(name.text.length > 3),(value) => setState(() {})),

              textField("Email", email, TextInputType.emailAddress, false, !(email.text.length > 3 && email.text.contains("@") && email.text.contains(".")),(value) => setState(() {})),

              textField("Password", pass, TextInputType.name, false, !(pass.text.length > 3),(value) => setState(() {})),

              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }

  bottomWidget(){
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: 110,
        child: Column(
          children: [
            InkWell(
              onTap: () async{
                setState(() {
                  load = true;
                });

                if(!formKey.currentState!.validate()){
                  setState(() {
                    load = false;
                  });
                  return;
                }

                try{

                  UserCredential? user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text.trim(), password: pass.text.trim());

                  if(user.user != null){
                    await FirebaseFirestore.instance.collection("user").add({
                      "name": name.text,
                      "email": email.text,
                      "uid": user.user!.uid,
                      "mask": false
                    });

                    Navigator.push(context, SlidePageRoute(page: const HomeView(),direction: AxisDirection.right));
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    //   return const HomeView();
                    // }));
                  }
                  setState(() {
                    load = false;
                  });
                }on FirebaseAuthException catch (e){
                  setState(() {
                    load = false;
                  });
                  errorCode(context, e.code);
                }

              },
              child: Container(
                height: 49,
                width: 231,
                decoration: BoxDecoration(
                  color: context.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: load ? const Center(child: CircularProgressIndicator(color: Colors.white,)) : const Text("Signup",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16
                  ),),
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),),
                InkWell(
                  onTap: (){
                    Navigator.push(context, SlidePageRoute(page: const Login(),direction: AxisDirection.right));
                  },
                  child: const Text("Login",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                    ),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }



}
