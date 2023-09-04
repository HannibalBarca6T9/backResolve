import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:resolve/models/reserve_model.dart';

import '../config/config.dart';

class ReserveApi {
  
  static String getCategoryUrl = "${AppConst.url}/project/getallcategorie";


  static void addReserve(
      {
        required ReserveModel reserveModel,
        required String pdfId
      }) async {
    try {
      String addReserveUrl = "${AppConst.url}/reserve/ajoutreserve/${pdfId}";
      var request = http.MultipartRequest('POST', Uri.parse(addReserveUrl));
      request.headers['Content-Type'] = 'multipart/form-data';

      request.fields['numero'] = reserveModel.numero;
      request.fields['Entreprise'] = reserveModel.entreprise;
      request.fields['libele'] =reserveModel.libele;
      request.fields['Support'] =reserveModel.support;
      request.fields['Nature'] =reserveModel.nature;
      request.fields['type'] =reserveModel.type;
      request.fields['Zone'] =reserveModel.zone;
      request.fields['Perioriter'] =reserveModel.perioriter.toIso8601String();
      request.fields['Datedepot'] =reserveModel.datedepot.toIso8601String();
      request.fields['datelivraison'] =reserveModel.datelivraison.toIso8601String();
      request.fields['Commentaire'] =reserveModel.commentaire;

      // Assuming you want to send the picture as a file
      var picture =
          await http.MultipartFile.fromPath('photo', reserveModel.photo);
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

  static Future<List<ReserveModel>>? getReserve() async {
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
        List<ReserveModel> reserveList = [];

        for (var item in jsonData) {
          reserveList.add(ReserveModel.fromJson(item));
        }

        return reserveList;
      } else {
        // Error response
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

 
}
