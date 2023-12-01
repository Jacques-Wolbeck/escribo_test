import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function() onPressed;
  const CalculateButton(
      {super.key, required this.formKey, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            onPressed();
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          minimumSize: Size(MediaQuery.of(context).size.width * .4, 40.0),
        ),
        child: const Text('Calcular',
            style: TextStyle(fontWeight: FontWeight.bold)));
  }
}
