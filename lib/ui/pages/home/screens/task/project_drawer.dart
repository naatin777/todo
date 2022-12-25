import 'package:flutter/material.dart';
import 'package:todo/ui/pages/home/screens/task/add_new_project_dialog.dart';

class ProjectDrawer extends StatelessWidget {
  const ProjectDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Add new project"),
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) => const AddNewProjectDialog(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
