import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/presentation/providers/detail/detail_provider.dart';
import 'package:todo/presentation/providers/tasks_provider.dart';

class Detail extends ConsumerWidget {
  const Detail({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskFromTaskIdStreamProvider(id ?? ""));

    return task.when(
      data: (data) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                GoRouter.of(context).pop();
                if (data != null) {
                  await ref.read(detailProvider).deleteTask(data);
                }
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        body: Consumer(
          builder: (context, ref, child) {
            if (data != null) {
              final titleController =
                  ref.watch(detailTitleProvider(data.title));
              final descriptionController =
                  ref.watch(detailDescriptionProvider(data.description));
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 16.0,
                    ),
                    child: TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        border: InputBorder.none,
                        hintText: "Title",
                      ),
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(fontSize: 24),
                      onSubmitted: (value) async {
                        await ref.read(detailProvider).updateTitle(value, data);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 16.0,
                    ),
                    child: TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        border: InputBorder.none,
                        hintText: "Description",
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onSubmitted: (value) async {
                        await ref
                            .read(detailProvider)
                            .updateDescription(value, data);
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
