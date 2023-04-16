import 'package:flutter/material.dart';

Color scaffoldBackgroundColor = const Color(0xff343541);
Color cardColor = const Color(0xff444654);
// List<String> models = [
//   'Model1',
//   'Model2',
//   'Model3',
//   'Model4',
//   'Model5'
// ];

// List<DropdownMenuItem<String>>? get getModelsItem{
//   List<DropdownMenuItem<String>>? modelsItems = List<DropdownMenuItem<String>>.generate(
//     models.length, 
//     (index) => DropdownMenuItem(
//       value: models[index],
//       child: TextWidget(
//         label: models[index], 
//         fontSize: 15,
//       ),
//     ),
//   ); 
//   return modelsItems;
// }

final List<Map<String, dynamic>> chatMessages = [
  {
    "msg": "Hello who are you?",
    "chatIndex": 0,
  },
  {
    "msg": "Hello, I am ChatGPT, a large language model developed by OpenAI. I am here to assist you.",
    "chatIndex": 1,
  },
  {
    "msg": "What is flutter?",
    "chatIndex": 0,
  },
  {
    "msg": "flutter is an open-source mobile application development framework created by Google.",
    "chatIndex": 1,
  }
];