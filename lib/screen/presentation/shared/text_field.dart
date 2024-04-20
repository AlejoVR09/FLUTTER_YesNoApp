import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final ValueChanged<String> onValue;

  TextFieldCustom({super.key, required this.onValue});

  final inputDecoration = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.transparent));
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final nodeFocus = FocusNode();
    return TextFormField(
      controller: textController,
      focusNode: nodeFocus,
      onTapOutside: (event) {
        nodeFocus.unfocus();
      },
      onFieldSubmitted: (value) {
        nodeFocus.requestFocus();
        textController.clear();
        onValue(value);
      },
      decoration: InputDecoration(
          enabledBorder: inputDecoration,
          focusedBorder: inputDecoration,
          filled: true,
          suffixIcon: IconButton(
              onPressed: () {
                onValue(textController.value.text);
                textController.clear();
                nodeFocus.requestFocus();
              },
              icon: const Icon(Icons.send_outlined))),
    );
  }
}
