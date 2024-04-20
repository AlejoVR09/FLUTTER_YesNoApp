import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom({super.key});

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
      },
      decoration: InputDecoration(
          enabledBorder: inputDecoration,
          focusedBorder: inputDecoration,
          filled: true,
          suffixIcon: IconButton(
              onPressed: () {
                textController.clear();
                print(textController.text);
                nodeFocus.requestFocus();
              },
              icon: const Icon(Icons.send_outlined))),
    );
  }
}
