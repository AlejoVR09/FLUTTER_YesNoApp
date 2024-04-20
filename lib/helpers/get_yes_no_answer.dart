import 'package:dio/dio.dart';
import 'package:yesno/domain/entities/message.dart';
import 'package:yesno/infrastructure/models/yes_no_models.dart';

class GetYesNoAnswer {
  final dio = Dio();

  Future<MessageEntity> getMessage() async {
    final response = await dio.get('https://yesno.wtf/api');
    final YesNoModel model = YesNoModel.fromJsonMap(response.data);
    return model.toMessageEntity();
  }
}
