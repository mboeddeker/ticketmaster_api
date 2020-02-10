import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketmaster/core/di/injection_container.dart';
import 'package:ticketmaster/ticketmaster_app.dart';
import 'package:ticketmaster/ticketmaster_app_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Setup Dependency Injection
  InjectionContainer.setup();

  // Setup AppState
  final appState = await TicketMasterAppState.initializeAppState();

  runApp(
    Provider(
      create: (_) => appState,
      child: TicketMasterApp(),
    ),
  );
}
