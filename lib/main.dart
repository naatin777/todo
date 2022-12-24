import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/preference/theme_mode_preference.dart';
import 'package:todo/ui/app.dart';
import 'package:todo/ui/providers/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
  );
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  final themeMode = await ThemeModePreference.getThemeMode();
  runApp(
    ProviderScope(
      overrides: [
        themeProvider.overrideWith(
            (ref) => ref.read(themeProviderFamily(themeMode).notifier))
      ],
      child: const App(),
    ),
  );
}
