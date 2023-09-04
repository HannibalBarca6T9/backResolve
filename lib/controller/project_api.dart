import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:resolve/models/category_model.dart';
import 'package:resolve/models/project_model.dart';

import '../config/config.dart';

class ProjectApi {
  static String addCategoryUrl = "${AppConst.url}/project/ajoutcategorie";
  static String getCategoryUrl = "${AppConst.url}/project/getallcategorie";
  static String getProjectUrl = "${AppConst.url}/project/getallproject";
  static Future<void> addCategory(
      {required String categoryName,
      required PlatformFile pickedFile,
      required File fileToDisplay}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(addCategoryUrl));
      print(request.url);
      request.headers['Content-Type'] = 'multipart/form-data';
      request.fields['nom'] = categoryName;

      // Assuming you want to send the picture as a file
      var picture =
          await http.MultipartFile.fromPath('photo', fileToDisplay.path);
      request.files.add(picture);
      final response = await request.send();
      if (response.statusCode == 200) {
        print('Data sent successfully');
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<List<CategoryModel>>? getCategory() async {
    // Replace with your actual header value

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Charset': 'utf-8'
    };

    try {
      final response =
          await http.get(Uri.parse(getCategoryUrl), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = (json.decode(response.body)["resut"]);
        List<CategoryModel> categoryList = [];

        for (var item in jsonData) {
          categoryList.add(CategoryModel.fromJson(item));
        }

        return categoryList;
      } else {
        // Error response
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
  static Future<List<ProjectModel>>? getProject() async {
    // Replace with your actual header value

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Charset': 'utf-8'
    };

    try {
      final response =
          await http.get(Uri.parse(getProjectUrl), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = (json.decode(response.body)["resut"]);
        List<ProjectModel> projectList = [];

        for (var item in jsonData) {
          projectList.add(ProjectModel.fromJson(item));
        }

        return projectList;
      } else {
        // Error response
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  static void addProject({required ProjectModel projectModel}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(addCategoryUrl));
      print(request.url);
      request.headers['Content-Type'] = 'multipart/form-data';
      request.fields['nom'] = projectModel.name;
      request.fields['Adresse'] = projectModel.address;
      request.fields['Entreprise'] =
          jsonEncode(projectModel.entreprise.asMap());

      // Assuming you want to send the picture as a file
      var picture =
          await http.MultipartFile.fromPath('photo', projectModel.image);

      request.files.add(picture);
      final response = await request.send();
      if (response.statusCode == 200) {
        print('Data sent successfully');
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print(e);
    }
  }
}
