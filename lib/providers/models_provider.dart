import 'package:flutter/material.dart';
import '../models/model.dart';
import '../services/api_service.dart';

class ModelsProvider with ChangeNotifier {
  List<ApiModel> modelsList = [];
  String currentModel = "text-davinci-003";

  List<ApiModel> get getModelsList {
    return modelsList;
  }

  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel (String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  Future<List<ApiModel>> getAllModels () async {
    modelsList = await ApiService.getModels();
    return modelsList;
  }
}