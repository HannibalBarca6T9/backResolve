import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:resolve/Main/create_new_category.dart';
import 'package:resolve/controller/auth_api.dart';
import 'package:resolve/controller/project_api.dart';

import '../config/config.dart';
import '../models/category_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _HomeState();
}

class _HomeState extends State<MainPage> {
// ADD GET CATEGORIES
@override
  void initState() {
    // TODO: implement initState
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => CreateNewCategory()));
        },
        backgroundColor: const Color(0xFF598BB4),
        elevation: 10,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(30),
            child: SizedBox(
                height: AppConst.getHeight(context) * 0.8,
                child: categoryList())),
      ),
    );
  }

  Widget categoryList() {
    return FutureBuilder<List<CategoryModel>>(
      future: ProjectApi.getCategory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
              height: 100, width: 100, child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data!.isEmpty) {
            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Bienvenue, ',
                      style: TextStyle(fontSize: 26),
                    ),
                    Text(
                      'Iheb',
                      style: TextStyle(color: Color(0xFF598BB4), fontSize: 28),
                    )
                  ],
                ),
                SizedBox(
                  height: 250,
                ),
                Center(
                  child: Text('Pour créer une categorie, clickez sur +'),
                )
              ],
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final CategoryModel = snapshot.data![index];
                final pic = (CategoryModel.image.split("\\"))[1];
                print(pic);
                return ListTile(
                  title: Text(CategoryModel.name),
                  leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Image.network(
                        "${AppConst.url}/uploads/${pic}",
                        height: 100,
                        width: 100,
                      )),
                );
              },
            );
          }
        }
      },
    );
  }
}
