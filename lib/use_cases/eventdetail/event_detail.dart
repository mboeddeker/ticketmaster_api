import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketmaster/core/models/event.dart';
import 'package:ticketmaster/styles/colors.dart';
import 'package:ticketmaster/styles/textstyles.dart';
import 'package:ticketmaster/use_cases/eventdetail/event_detail_viewmodel.dart';
import 'package:ticketmaster/widgets/favorite_button.dart';
import 'package:ticketmaster/widgets/ticketmaster_app_bar.dart';

class EventDetail extends StatelessWidget {
  final Event _event;
  EventDetail(this._event);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TicketMasterAppBar('Event Detail'),
      body: Provider<EventDetailViewModel>(
        create: (_) => EventDetailViewModel(event: _event),
        child: Consumer<EventDetailViewModel>(
          builder: (context, viewModel, _) {
            return buildDetailView(context, viewModel);
          },
        ),
      ),
    );
  }

  Widget buildDetailView(BuildContext context, EventDetailViewModel viewModel) {
    return Container(
      color: AppColors.lightBackground,
      child: ListView(
        children: <Widget>[
          Image.network(
            viewModel.provideImageUrl(),
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 16),
                Text(
                  viewModel.provideEventName(),
                  style: AppTextStyles.itemName,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(viewModel.provideEventDate()),
                    FavoriteButton(event: viewModel.event),
                  ],
                ),
                SizedBox(height: 16),
                Text(viewModel.provideEventDescription()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
