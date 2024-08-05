import 'package:bloc_clean_architecture/config/color/app_color.dart';
import 'package:flutter/material.dart';

class InternetException extends StatelessWidget {
  final VoidCallback onTap;
  const InternetException({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * .15),
        const Icon(
          Icons.cloud_off,
          size: 50,
          color: kAlertColor,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              "We're unable to show results.\nPlease check your data\nconnection.",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 20),
            ),
          ),
        ),
        TextButton(onPressed: onTap, child: const Text('RETRY'))
      ],
    );
  }
}
