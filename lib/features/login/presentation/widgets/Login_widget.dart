import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_tdd_app/features/login/presentation/bloc/login_bloc.dart';

Widget Login_Widget(BuildContext context) {
  var textControllerUsername = TextEditingController();
  var textControllerPassword = TextEditingController();
  void clickedBtnLogin(){
    BlocProvider.of<LoginBloc>(context).add(LoginBtnPreesEvent(username: textControllerUsername.text, password: textControllerPassword.text));
  }
  return Container(
    height: MediaQuery.of(context).size.height/3 ,
    padding: EdgeInsets.only(left: 5,right: 5),
    child: Column(
      children: [
        TextField(
          controller: textControllerUsername,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)),
              hintText: "user name",
              suffixIcon: Icon(Icons.account_circle_outlined)),
        ),
        TextField(
          controller: textControllerPassword,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)),
              hintText: "password",
              suffixIcon: Icon(Icons.vpn_key_outlined)),
        ),
        SizedBox(
          height: 5,
        ),
    FlatButton(
      child: Text('login'),
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onPressed: clickedBtnLogin,
    )
      ],
    ),
  );
}