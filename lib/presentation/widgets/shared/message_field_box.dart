import 'package:flutter/material.dart';

class MessageFielBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFielBox({
    super.key, 
    required this.onValue
  });

  @override
  Widget build(BuildContext context) {

    final textControler =  TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20)
    );

    final inputDecoration =  InputDecoration(
        hintText: 'End your message a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final tetxValue = textControler.value.text;
            textControler.clear();
            onValue(tetxValue);
          },
        )
      );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textControler,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textControler.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}