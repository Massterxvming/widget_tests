import 'package:deepseek_api/deepseek_api.dart';

extension ChatCompletionResponseHelper on ChatCompletionResponse {
  String get detailedMessage {
    return 'Id: ${id}, Object: ${object}, Model: ${model},';
  }
}