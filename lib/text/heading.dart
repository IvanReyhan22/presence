import 'package:flutter/cupertino.dart';

class Heading extends StatefulWidget {
  final String title;
  final int size;
  final Color color;
  final FontWeight? weight;
  final TextAlign? alignment;

  const Heading(
      {Key? key,
      required this.title,
      required this.size,
      required this.color,
      this.weight,
      this.alignment})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _HeadingState();
}

class _HeadingState extends State<Heading> {
  setFontSize(initialSize) {
    double finalFontSize = 18.0;

    switch (initialSize) {
      case 1:
        finalFontSize = 36.0;
        break;
      case 2:
        finalFontSize = 32.0;
        break;
      case 3:
        finalFontSize = 28.0;
        break;
      case 4:
        finalFontSize = 24.0;
        break;
      case 5:
        finalFontSize = 20.0;
        break;
      case 6:
        finalFontSize = 18.0;
        break;
      default:
        finalFontSize = 18.0;
        break;
    }

    return finalFontSize;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.alignment,
      style: TextStyle(
        fontWeight: widget.weight,
        fontSize: setFontSize(widget.size),
        color: widget.color,
      ),
    );
  }
}
