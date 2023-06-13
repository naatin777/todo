import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/constant.dart';
import 'package:todo/domain/models/task_list.dart';
import 'package:todo/presentation/providers/home/task/project_selection_provider.dart';

class ProjectSelectionBottomSheet extends ConsumerWidget {
  const ProjectSelectionBottomSheet({super.key, required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsStreamProvider);
    return projects.when(
      data: (data) => SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.inbox),
                title: Text(inbox.name),
                onTap: () {
                  Navigator.of(context).pop(inbox.id);
                },
                selected: projectId == inbox.id,
              ),
              const Divider(
                height: 0,
              ),
              for (Project project in data)
                ListTile(
                  leading: const Icon(Icons.list),
                  title: Text(project.name),
                  onTap: () {
                    Navigator.of(context).pop(project.id);
                  },
                  selected: projectId == project.id,
                ),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
