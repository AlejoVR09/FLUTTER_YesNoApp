import 'package:yesno/domain/entities/message.dart';

class YesNoModel {
  final String image;
  final String answer;
  final bool forced;

  YesNoModel({required this.image, required this.answer, required this.forced});

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
      image: json['image'], answer: json['answer'], forced: json['forced']);

  MessageEntity toMessageEntity() {
    return MessageEntity(text: answer, who: Whos.her, image: image);
  }
}
