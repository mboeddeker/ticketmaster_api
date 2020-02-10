import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketmaster/core/utils/generic_state.dart';
import 'package:ticketmaster/styles/colors.dart';
import 'package:ticketmaster/styles/textstyles.dart';
import 'package:ticketmaster/ticketmaster_app_state.dart';
import 'package:ticketmaster/use_cases/wishlist/wish_list.dart';
import 'package:ticketmaster/widgets/neumorph_widget.dart';

class TicketMasterAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  TicketMasterAppBar(this.title);
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<TicketMasterAppState>(context);
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColors.lightBackground,
      title: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          title,
          style: AppTextStyles.appBarHeader,
        ),
      ),
      actions: [
        ListenableProvider<GenericState<int>>.value(
          value: appState.provideFavoriteNumber(),
          child: Consumer<GenericState<int>>(
            builder: (context, state, _) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WishList())),
                child: Container(
                  child: Center(
                    child: NeuMorphWidget(
                      height: 30,
                      width: 30,
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightBackground,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            '${state.value}',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(width: 30),
      ],
    );
  }

  @override
  Size get preferredSize => Size.copy(AppBar().preferredSize);
}
//
