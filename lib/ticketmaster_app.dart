import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketmaster/core/di/injection_container.dart';
import 'package:ticketmaster/core/services/ticketmaster_service.dart';
import 'package:ticketmaster/use_cases/eventslist/events_list.dart';

class TicketMasterApp extends StatelessWidget {
  final tmApi = inject<TicketMasterService>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticketmaster App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.iBMPlexSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: EventsList(),
    );
  }
}
