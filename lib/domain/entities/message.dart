enum Whos { him, her }

class MessageEntity {
  final String text;
  final String? image;
  final Whos who;

  MessageEntity({required this.text, this.image, required this.who});
}
