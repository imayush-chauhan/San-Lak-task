import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shooping_app/core/extensions/app_extensions.dart';
import 'package:shooping_app/core/init/navigation/nav.dart';
import 'package:shooping_app/features/home/view/home_view.dart';
import 'package:shooping_app/features/home/view/signup_view.dart';
import 'package:shooping_app/product/component/textfield.dart';
import 'package:shooping_app/util/error_code.dart';

class Login extends StatefulWidget {
  static const path = '/login';
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final formKey = GlobalKey<FormState>();

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
        title: Text("Login",
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

              textField("Email", email, TextInputType.emailAddress, false, !(email.text.length > 3 && email.text.contains("@") && email.text.contains(".")),(value) => setState(() {}),),

              textField("Password", pass, TextInputType.name, false, !(pass.text.length > 3),(value) => setState(() {})),

              const SizedBox(height: 100,)
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

                  UserCredential? user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text.trim(), password: pass.text.trim());

                  if(user.user != null){

                    Navigator.push(context, SlidePageRoute(page: const HomeView(),direction: AxisDirection.right));

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
                child: load ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator(color: Colors.white,)),
                ) : const Text("Login",
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
                const Text("New here? ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),),
                InkWell(
                  onTap: (){
                    Navigator.push(context, SlidePageRoute(page: const SignUp(),direction: AxisDirection.left));
                  },
                  child: Text("Signup",
                    style: TextStyle(
                        color: context.purple,
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
