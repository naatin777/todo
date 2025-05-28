import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/presentation/notifiers/detail/detail_notifier.dart';

class Detail extends ConsumerStatefulWidget {
  const Detail({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailState();
}

class _DetailState extends ConsumerState<Detail> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final task = ref.watch(detailNotifierProvider);
    return task.when(
      data: (data) {
        if (data != null) {
          titleController.text = data.title;
          descriptionController.text = data.description;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  // if (GoRouter.of(context).canPop()) {
                  //   GoRouter.of(context).pop();
                  // } else {
                  //   GoRouter.of(context).go("/task");
                  // }
                },
                icon: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () async {
                    // GoRouter.of(context).pop();
                    // await ref
                    //     .read(detailNotifierProvider.notifier)
                    //     .deleteTask(data);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            body: Consumer(
              builder: (context, ref, child) {
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
                          await ref
                              .read(detailNotifierProvider.notifier)
                              .updateTitle(value, data);
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
                              .read(detailNotifierProvider.notifier)
                              .updateDescription(value, data);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                children: [
                  TextButton(
                    onPressed: () async {
                      GoRouter.of(context).pop();

                      await ref
                          .read(detailNotifierProvider.notifier)
                          .updateCheck(!data.isDone, data);
                    },
                    child: Text(data.isDone ? "Undone" : "Done"),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
