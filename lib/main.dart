import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/preference/theme_mode_preference.dart';
import 'package:todo/provider_logger.dart';
import 'package:todo/presentation/app.dart';
import 'package:todo/presentation/providers/home/screens/settings/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
  );
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  final themeMode = await ThemeModePreference.getThemeMode();
  runApp(
    ProviderScope(
      observers: [
        ProviderLogger(),
      ],
      overrides: [
        themeProvider.overrideWith(
          (ref) => ref.read(themeProviderFamily(themeMode).notifier),
        )
      ],
      child: const App(),
    ),
  );
}
