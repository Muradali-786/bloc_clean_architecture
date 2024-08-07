import 'package:bloc_clean_architecture/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login/login_bloc.dart';

/// A widget representing the email input field.
class EmailInput extends StatelessWidget {
  const EmailInput({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (current, previous) => current.email != previous.email,
      builder: (context, state) {
        return TextFormField(
          focusNode: focusNode,
          // Setting focus node
          decoration: const InputDecoration(
            icon: Icon(Icons.email), // Icon for email input field
            labelText: 'Email', // Label text for email input field
            helperText:
                'EmailExamplejoegmailcom', // Helper text for email input field


          ),
          keyboardType: TextInputType.emailAddress,
          // Setting keyboard type to email address
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(email: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter email';
            }

            if (!Validation.emailValidator(value)) {
              return 'Email is not correct';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
