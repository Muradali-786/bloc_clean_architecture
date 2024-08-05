import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final double height, textSize;
  final double width;
  final VoidCallback onPress;
  final Color buttonColor;
  final bool loading;

  const RoundButton({
    Key? key,
    required this.title,
    required this.onPress,
    required this.buttonColor,
    this.width = double.infinity,
    this.height = 50,
    this.textSize = 14,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              )
            : Center(
                child: Text(title,
                    style: TextStyle(
                      fontSize: textSize,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    )),
              ),
      ),
    );
  }
}
