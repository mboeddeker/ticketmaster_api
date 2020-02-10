import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ticketmaster/core/database/entities/event_entity.dart';
import 'package:ticketmaster/core/utils/generic_state.dart';
import 'package:ticketmaster/styles/colors.dart';
import 'package:ticketmaster/styles/textstyles.dart';
import 'package:ticketmaster/use_cases/wishlist/wish_list_viewmodel.dart';
import 'package:ticketmaster/widgets/favorite_button.dart';
import 'package:ticketmaster/widgets/ticketmaster_app_bar.dart';

class WishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TicketMasterAppBar('Favorites'),
      body: Provider<WishListViewModel>(
        create: (_) => WishListViewModel(),
        child: Consumer<WishListViewModel>(
          builder: (context, viewModel, _) {
            return FutureBuilder(
              future: viewModel.loadFavorites(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return buildWishList(context, viewModel);
                } else {
                  return Container(
                    color: AppColors.lightBackground,
                    child: Center(
                      child: Container(height: 30, width: 30, child: CircularProgressIndicator()),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildWishList(BuildContext context, WishListViewModel viewModel) {
    return Container(
      color: AppColors.lightBackground,
      child: ListenableProvider<GenericState<List<EventEntity>>>.value(
        value: viewModel.provideFavoriteEvents(),
        child: Consumer<GenericState<List<EventEntity>>>(
          builder: (context, state, _) {
            return ListView.builder(
              itemCount: state.value.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => viewModel.navigateToDetail(context, state.value[index]),
                  child: ListTile(
                    title: Text(
                      viewModel.provideEventName(index),
                      style: AppTextStyles.itemName,
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        viewModel.provideEventImage(index),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
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
