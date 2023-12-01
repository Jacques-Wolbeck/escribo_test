import 'package:flutter/material.dart';

class GetIntTextField extends StatelessWidget {
  final Function(String?)? onSaved;
  const GetIntTextField({super.key, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .4,
      child: TextFormField(
        onSaved: onSaved,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlign: TextAlign.center,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor, digite um número inteiro positivo.';
          }
          if (value.contains('-') ||
              value.contains(',') ||
              value.contains('.')) {
            return 'O número digitado não é um inteiro positivo.';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: 'Ex: 1,2,3,4,5....',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(width: 1),
          ),
          errorMaxLines: 3,
          contentPadding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
