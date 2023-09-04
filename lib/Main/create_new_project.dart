import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:resolve/models/project_model.dart';

import '../controller/project_api.dart';
import 'Categories.dart';

class CreateNewProject extends StatefulWidget {
  const CreateNewProject({super.key});

  @override
  State<CreateNewProject> createState() => _CreateNewProjectState();
}

class _CreateNewProjectState extends State<CreateNewProject> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;
  TextEditingController _categoryName = TextEditingController();
  TextEditingController _categoryDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Création d'une Categorie",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('Nom du Project'),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  controller: _categoryName,
                  maxLines: 1,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Noms d'entreprise"),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: TextField(
                  controller: _categoryDescription,
                  maxLines: 1,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Choisir une fichier pdf '),
              const SizedBox(
                height: 10,
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(
                                type: FileType.custom,
                                dialogTitle: 'Please select pdf file:',
                                allowedExtensions: ['pdf']);

                        if (result != null) {
                          File file = File(result.files.single.path!);
                          /*await for (var page
                    in Printing.raster(await file.readAsBytes())) {
                  final Uint8List image = await page.toPng();*/

                          /* Navigator.pushNamed(context, AppRoute.choosePdfFile,
                    arguments: file);*/
                        } else {
                          print("error");
                        }
                      },
                      child: const Text(
                        'Image',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor: const Color(0xFF333A56)),
                    ),
              const SizedBox(
                height: 20,
              ),
              if (pickedFile != null)
                SizedBox(
                  height: 100,
                  width: 200,
                  child: Image.file(fileToDisplay!),
                ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_categoryName.text.isNotEmpty && pickedFile != null) {
                    //AuthApi.loginUser(email: "ggsdsd@gmail.com", password: "fqfe");
                    await ProjectApi.addProject(
                        projectModel: ProjectModel(
                            id: id,
                            name: name,
                            image: image,
                            address: address,
                            nomberlogement: nomberlogement,
                            pdf: pdf));
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => MainPage()));
                  }
                },
                child: const Text(
                  'Créer',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.orange,
                ),
              ),
            ],
          ),
        ));
  }
}
