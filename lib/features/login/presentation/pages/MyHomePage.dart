import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_first_tdd_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_first_tdd_app/features/login/presentation/widgets/Login_widget.dart';

class MyhomePage extends StatefulWidget {
  @override
  _MyhomePageState createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Center(
        child: BlocBuilder<LoginBloc,LoginState>(
          builder: (context,state){
            if(state is LoginLoadingState){
              return Text("Loading...");
            }
            if (state is LoginLoadedState){
              return Text('Login sucssecful');
            }
            else
              return Login_Widget(context);
          },
        ),
      ),
    );
  }
}
