import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login/login_bloc.dart';


/// A widget representing the password input field.
class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (current,previous)=>current.password!=previous.password,

  builder: (context, state) {
    return TextFormField(
      focusNode: focusNode, // Setting focus node
      decoration: const InputDecoration(
        icon:  Icon(Icons.lock), // Icon for password input field
        helperText: 'Password', // Helper text for password input field
        helperMaxLines: 2, // Maximum lines for helper text
        labelText: 'password', // Label text for password input field
        errorMaxLines: 2, // Maximum lines for error text
      ),
      obscureText: true, // Making the text input obscure (i.e., showing dots instead of actual characters)
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter password';
        }
        if (value.length < 6) {
          return 'please enter password greater than 6 char';
        }
        return null;
      },
      onChanged: (value) {
        // Dispatching PasswordChanged event when password input changes
        context.read<LoginBloc>().add(PasswordChanged(password: value));

      },
      textInputAction: TextInputAction.done,
    );
  },
);
  }
}