import 'package:dipl/app/app.dart';
import 'package:dipl/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  setupLogger();
  runApp(
    ProviderScope(
      child: const App(),
    ),
  );
}
