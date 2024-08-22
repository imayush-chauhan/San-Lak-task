import 'package:flutter/material.dart';

textField(String name,TextEditingController controller, TextInputType type,bool show,bool valid,ValueChanged<bool> onChange){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    child: TextFormField(
      controller: controller,
      cursorColor: Colors.purple,
      cursorHeight: 18,
      obscureText: show,
      onChanged: (_){
        onChange(true);
      },
      keyboardType: type,
      decoration: InputDecoration(
        hintText: " " + name,
        hintStyle: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(
            color: Colors.purple,
            width: 1,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(
            color: Colors.purple,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(
            color: Colors.purple,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
        ),
        isDense: true,
        contentPadding:
        const EdgeInsetsDirectional.fromSTEB(20, 15, 0, 15),
      ),
      validator: (_){
        if(valid){
          return "Invalid text";
        }
        return null;
      },
      style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400),
    ),
  );
}