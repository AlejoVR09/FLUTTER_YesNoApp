import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:yesno/config/theme/app_theme.dart";

class MessageBubble extends StatelessWidget {
  final message;

  const MessageBubble(
    {super.key,
    required this.message
    }
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: color.primary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
