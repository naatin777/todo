import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morph_todo/presentation/notifiers/home/task/task_screen_notifier.dart';
import 'package:morph_todo/presentation/pages/home/tasks/task_list_tile.dart';

class TasksScreen extends ConsumerWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskScreenNotifierProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return DefaultTabController(
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder: (
                BuildContext context,
                bool innerBoxIsScrolled,
              ) {
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                    sliver: SliverAppBar(
                      bottom: TabBar(
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        tabs: [
                          GestureDetector(
                            onTap: () {
                              debugPrint("");
                            },
                            onLongPress: () {
                              debugPrint("");
                            },
                            onDoubleTap: () {
                              debugPrint("");
                            },

                            child: const Tab(text: "All"),
                          ),
                          Tab(text: "Today"),
                          Tab(child: Text("Other")),
                        ],
                      ),
                      automaticallyImplyLeading: false,
                      title: Text('Tasks'),
                      pinned: true,
                      forceElevated: innerBoxIsScrolled,
                      actions: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: MenuAnchor(
                            builder: (
                              BuildContext context,
                              MenuController controller,
                              Widget? child,
                            ) {
                              return IconButton(
                                icon: const Icon(Icons.more_vert),
                                onPressed: () {
                                  if (controller.isOpen) {
                                    controller.close();
                                  } else {
                                    controller.open();
                                  }
                                },
                              );
                            },
                            menuChildren: [
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: MenuItemButton(
                                  leadingIcon: const Icon(Icons.delete),
                                  onPressed: () async {},
                                  trailingIcon: const Icon(null),
                                  child: const Text("Delete project"),
                                ),
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: MenuItemButton(
                                  leadingIcon: const Icon(Icons.edit),
                                  trailingIcon: const Icon(null),
                                  child: const Text("Edit project name"),
                                  onPressed: () async {},
                                ),
                              ),
                            ],
                            style: MenuStyle(
                              alignment: AlignmentDirectional.bottomCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ];
              },
              body: Builder(
                builder: (BuildContext context) {
                  return TabBarView(
                    children: [
                      CustomScrollView(
                        slivers: [
                          SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context,
                                ),
                          ),
                          tasks.when(
                            data: (data) {
                              return SliverList(
                                delegate: SliverChildBuilderDelegate((
                                  context,
                                  index,
                                ) {
                                  final task = data[index];
                                  return TaskListTile(task: task);
                                }, childCount: data.length),
                              );
                            },
                            loading: () {
                              return const SliverPadding(
                                padding: EdgeInsets.all(0),
                              );
                            },
                            error: (error, stackTrace) {
                              return const SliverPadding(
                                padding: EdgeInsets.all(0),
                              );
                            },
                          ),
                          const SliverPadding(padding: EdgeInsets.all(50)),
                        ],
                      ),
                      CustomScrollView(
                        slivers: [
                          SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context,
                                ),
                          ),
                          tasks.when(
                            data: (data) {
                              return SliverList(
                                delegate: SliverChildBuilderDelegate((
                                  context,
                                  index,
                                ) {
                                  final task = data[index];
                                  return TaskListTile(task: task);
                                }, childCount: data.length),
                              );
                            },
                            loading: () {
                              return const SliverPadding(
                                padding: EdgeInsets.all(0),
                              );
                            },
                            error: (error, stackTrace) {
                              return const SliverPadding(
                                padding: EdgeInsets.all(0),
                              );
                            },
                          ),
                          const SliverPadding(padding: EdgeInsets.all(50)),
                        ],
                      ),
                      CustomScrollView(
                        slivers: [
                          SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context,
                                ),
                          ),
                          tasks.when(
                            data: (data) {
                              return SliverList(
                                delegate: SliverChildBuilderDelegate((
                                  context,
                                  index,
                                ) {
                                  final task = data[index];
                                  return TaskListTile(task: task);
                                }, childCount: data.length),
                              );
                            },
                            loading: () {
                              return const SliverPadding(
                                padding: EdgeInsets.all(0),
                              );
                            },
                            error: (error, stackTrace) {
                              return const SliverPadding(
                                padding: EdgeInsets.all(0),
                              );
                            },
                          ),
                          const SliverPadding(padding: EdgeInsets.all(50)),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        } else {
          return NestedScrollView(
            headerSliverBuilder: (
              BuildContext context,
              bool innerBoxIsScrolled,
            ) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                    context,
                  ),
                  sliver: SliverAppBar(
                    automaticallyImplyLeading: false,
                    title: Text('Tasks'),
                    pinned: true,
                    forceElevated: innerBoxIsScrolled,
                    actions: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: MenuAnchor(
                          builder: (
                            BuildContext context,
                            MenuController controller,
                            Widget? child,
                          ) {
                            return IconButton(
                              icon: const Icon(Icons.more_vert),
                              onPressed: () {
                                if (controller.isOpen) {
                                  controller.close();
                                } else {
                                  controller.open();
                                }
                              },
                            );
                          },
                          menuChildren: [
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: MenuItemButton(
                                leadingIcon: const Icon(Icons.delete),
                                onPressed: () async {},
                                trailingIcon: const Icon(
                                  Icons.arrow_forward_ios,
                                ),
                                child: const Text("Delete project"),
                              ),
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: MenuItemButton(
                                leadingIcon: const Icon(Icons.edit),

                                trailingIcon: const Icon(
                                  Icons.arrow_forward_ios,
                                ),
                                child: const Text("Edit project name"),
                                onPressed: () async {},
                              ),
                            ),
                          ],
                          style: MenuStyle(
                            alignment: AlignmentDirectional.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: Builder(
              builder: (BuildContext context) {
                return CustomScrollView(
                  slivers: [
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context,
                      ),
                    ),
                    tasks.when(
                      data: (data) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            final task = data[index];
                            return TaskListTile(task: task);
                          }, childCount: data.length),
                        );
                      },
                      loading: () {
                        return const SliverPadding(padding: EdgeInsets.all(0));
                      },
                      error: (error, stackTrace) {
                        return const SliverPadding(padding: EdgeInsets.all(0));
                      },
                    ),
                    const SliverPadding(padding: EdgeInsets.all(50)),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}
