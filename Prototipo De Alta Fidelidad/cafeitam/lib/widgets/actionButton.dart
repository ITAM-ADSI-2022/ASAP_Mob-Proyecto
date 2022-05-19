import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSubmitting;
  const CustomActionButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isSubmitting = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Center(
            child: !isSubmitting
                ? Text(text,
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 18))
                : Container(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    )),
          ),
        ));
  }
}
