import 'package:flutter/material.dart';
import 'package:todo/presentation/pages/home/screens/task/add_new_task_bottom_sheet.dart';

class AddNewTaskFab extends StatelessWidget {
  const AddNewTaskFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        await showModalBottomSheet(
          context: context,
          builder: (context) {
            final size = MediaQuery.of(context).size;
            final viewInsets = MediaQuery.of(context).viewInsets;
            final preferredSize = AppBar().preferredSize;
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: size.height - preferredSize.height,
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: 8,
                  bottom: viewInsets.bottom,
                ),
                child: const AddNewTaskBottomSheet(),
              ),
            );
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8),
            ),
          ),
          isScrollControlled: true,
        );
      },
    );
  }
}
