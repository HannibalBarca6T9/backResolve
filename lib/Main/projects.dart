import 'package:flutter/material.dart';
import 'package:resolve/Main/create_new_category.dart';

import 'package:resolve/controller/project_api.dart';

import '../config/config.dart';
import '../models/category_model.dart';
import '../models/project_model.dart';
import 'create_new_project.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const CreateNewProject()));
        },
        backgroundColor: const Color(0xFF598BB4),
        elevation: 10,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(30),
            child: SizedBox(
                height: AppConst.getHeight(context) * 0.8,
                child: ProjectsList())),
      ),
    );
  }

  Widget ProjectsList() {
    return FutureBuilder<List<ProjectModel>>(
      future: ProjectApi.getProject(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
              height: 100, width: 100, child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data!.isEmpty) {
            return const Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Projects de ',
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
                final ProjectModel = snapshot.data![index];
                final pic = (ProjectModel.image.split("\\"))[1];
                print(pic);
                return ListTile(
                  title: Text(ProjectModel.name),
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
