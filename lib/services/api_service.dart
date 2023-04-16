import 'dart:convert';
import 'dart:io';
import 'package:chatgpt_app/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants/api_constant.dart';
import '../models/model.dart';


class ApiService {
  static Future<List<ApiModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse('$baseUrl/models'),
        headers: {'Authorization': 'Bearer $apiKey'},
      );

      Map jsonResponse = jsonDecode(response.body);
      if(jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }
      debugPrint('Run Successfully');
      debugPrint('The data is: $jsonResponse');
      List temp = [];
      for(var value in jsonResponse["data"]) {
        temp.add(value);
      } 
      return ApiModel.modelsFromSnapshot(temp);
    } catch (error) {
      debugPrint('The error is: $error');  
      rethrow;    
    }
  }

  // Send Message 
  static Future<List<ChatModel>> sendMessage({required String message, required String modelId}) async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/completions'),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "model": modelId, 
          "prompt": message, 
          "max_tokens": 100,
        }),
      );

      Map jsonResponse = jsonDecode(response.body);
      if(jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }
      debugPrint('The data: $jsonResponse');
      List<ChatModel> chatList = [];
      if(jsonResponse['choices'].length > 0) {
        chatList = List.generate(
          jsonResponse['choices'].length, 
          (index) => ChatModel(
            msg: jsonResponse['choices'][index]['text'], 
            chatIndex: 1,
          ),
        );
      }
      return chatList;
    } catch (error) {
      debugPrint('The error is: $error');  
      rethrow;    
    }
  } 
}