import 'package:flutter/material.dart';
import 'package:ticketmaster/styles/colors.dart';

class NeuMorphWidget extends StatelessWidget {
  final Widget child;
  final double height, width;

  final Color color;
  final BorderRadius borderRadius;
  final List<Shadow> shadows;

  NeuMorphWidget({
    Key key,
    @required this.child,
    this.height,
    this.width,
    this.color,
    this.borderRadius,
    this.shadows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? AppColors.lightBackground,
        borderRadius: borderRadius ?? BorderRadius.circular(15.0),
        boxShadow: shadows ?? (AppColors.lightShadows(3)),
      ),
      child: child,
    );
  }

  static Widget buildRoundMorph(BuildContext context, {@required Icon icon, double size = 100}) {
    return NeuMorphWidget(
      height: size,
      width: size,
      borderRadius: BorderRadius.circular(size / 2),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightBackground,
          borderRadius: BorderRadius.circular(size / 2),
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
