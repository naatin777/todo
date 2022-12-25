import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/ui/providers/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text("Settings"),
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ListTile(
              title: const Text("Theme"),
              subtitle: Text(themeMode.title),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Choose theme"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: ThemeMode.values
                            .map(
                              (e) => ListTile(
                                leading: Radio<ThemeMode>(
                                  value: e,
                                  groupValue: themeMode,
                                  onChanged: (value) async {
                                    Navigator.of(context).pop();
                                    await ref
                                        .watch(themeProvider.notifier)
                                        .changeThemeMode(e);
                                  },
                                ),
                                title: Text(e.title),
                                onTap: () async {
                                  Navigator.of(context).pop();
                                  await ref
                                      .watch(themeProvider.notifier)
                                      .changeThemeMode(e);
                                },
                                horizontalTitleGap: 0.0,
                              ),
                            )
                            .toList(),
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 0.0,
                        top: Theme.of(context).useMaterial3 ? 16.0 : 20.0,
                        right: 0.0,
                        bottom: 24.0,
                      ),
                    );
                  },
                );
              },
            ),
          ]),
        ),
      ],
    );
  }
}

extension on ThemeMode {
  String get title {
    switch (this) {
      case ThemeMode.light:
        return "Light";
      case ThemeMode.dark:
        return "Dark";
      case ThemeMode.system:
        return "System default";
    }
  }
}
