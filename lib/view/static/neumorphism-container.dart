import '../../provider/theme-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NeuContainer extends StatelessWidget {
  final Color color;
  final BorderRadius borderRadius;
  final BoxShape shape;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const NeuContainer({Key key, this.color, this.borderRadius, this.child, this.shape, this.padding, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(8.0),
      margin: margin ?? EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).backgroundColor,
        borderRadius: borderRadius != null ? borderRadius :  shape == BoxShape.circle ? null : BorderRadius.circular(8.0),
        shape: shape ?? BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
              color: !Provider.of<ThemeProvider>(context,listen: false).isDark() ? Color.fromRGBO(0, 0, 0, 0.1) : Colors.black.withOpacity(0.1),
              offset: Offset(6, 4),
              blurRadius: 6.0,
//              spreadRadius: 3.0
          ),
          BoxShadow(
              color: !Provider.of<ThemeProvider>(context,listen: false).isDark() ? Color.fromRGBO(255, 255, 255, 0.9) : Colors.grey[500].withOpacity(0.1),
              offset: Offset(-6, -4),
              blurRadius: 6.0,
//              spreadRadius: 3.0
          )
        ]
      ),
      child: child,
    );
  }
}

class CardContainer extends StatelessWidget {
  final Color color;
  final BorderRadius borderRadius;
  final BoxShape shape;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final DecorationImage decorationImage;
  final double dx;
  final double dy;
  final double blur;
  final Alignment alignment;
  final BoxBorder border;

  const CardContainer({Key key, this.color, this.borderRadius, this.child, this.shape, this.padding, this.margin, this.decorationImage, this.dx : 6, this.dy : 4, this.blur : 6, this.alignment, this.border}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(0.0),
      margin: margin ?? EdgeInsets.all(0.0),
      alignment: alignment,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).backgroundColor,
        borderRadius: borderRadius != null ? borderRadius :  shape == BoxShape.circle ? null : BorderRadius.circular(8.0),
        shape: shape ?? BoxShape.rectangle,
        image: decorationImage,
        border: border,
        boxShadow: [
          BoxShadow(
              color: !Provider.of<ThemeProvider>(context,listen: false).isDark() ? Color.fromRGBO(0, 0, 0, 0.1) : Colors.black.withOpacity(0.1),
              offset: Offset(dx, dy),
              blurRadius: blur,
          ),
          BoxShadow(
            color: !Provider.of<ThemeProvider>(context,listen: false).isDark() ? Color.fromRGBO(0, 0, 0, 0.1) : Colors.black.withOpacity(0.1),
              offset: Offset(-dx, -dy),
              blurRadius: blur,
          )
        ]
      ),
      child: child,
    );
  }
}
