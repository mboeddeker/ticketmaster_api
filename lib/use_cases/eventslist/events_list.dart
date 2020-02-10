import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ticketmaster/core/di/injection_container.dart';
import 'package:ticketmaster/core/models/event.dart';
import 'package:ticketmaster/core/utils/generic_state.dart';
import 'package:ticketmaster/styles/colors.dart';
import 'package:ticketmaster/use_cases/eventslist/events_list_viewmodel.dart';
import 'package:ticketmaster/widgets/list_item.dart';
import 'package:ticketmaster/widgets/ticketmaster_app_bar.dart';

class EventsList extends StatefulWidget {
  @override
  _EventsListState createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TicketMasterAppBar('Events'),
      body: Provider<EventsListViewModel>(
        create: (_) => EventsListViewModel()..initialize(),
        child: Consumer<EventsListViewModel>(
          builder: (context, viewModel, _) {
            return _buildList(context, viewModel);
          },
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, EventsListViewModel viewModel) {
    return Container(
      color: AppColors.lightBackground,
      child: ListenableProvider<GenericState<List<Event>>>.value(
        value: viewModel.provideEvents(),
        child: Consumer<GenericState<List<Event>>>(
          builder: (context, state, _) {
            return ListView.builder(
              controller: viewModel.controller,
              itemCount: state.value.length + 1,
              itemBuilder: (context, index) {
                return index == state.value.length
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 50,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        ],
                      )
                    : ListItem(
                        state.value[index],
                        onPressed: () => viewModel.onEventClicked(
                          context,
                          state.value[index],
                        ),
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
