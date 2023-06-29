
import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYenNoAnswer {

  final _dio = Dio();


  Future <Message> getAnswer() async {

    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModdel = YesNoModdel.fromJsonMap( response.data );

    return yesNoModdel.toMessageEntity();




  }


}