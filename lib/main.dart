import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/presentation/app.dart';
import 'package:todo/presentation/notifiers/home/settings/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
  );
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  final themeMode = await ThemeProvider.loadThemeMode();
  runApp(
    ProviderScope(
      overrides: [
        themeProvider.overrideWith(
          (ref) => ref.read(themeProviderFamily(themeMode).notifier),
        )
      ],
      child: const App(),
    ),
  );
}
