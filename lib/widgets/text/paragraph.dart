// import 'package:flutter/cupertino.dart';

// class Paragraph extends StatefulWidget {
//   final String title;
//   final FontStyle? style;
//   final int size;
//   final Color color;
//   final FontWeight? weight;
//   final TextAlign? alignment;

//   const Paragraph(
//       {Key? key,
//       required this.title,
//       required this.size,
//       required this.color,
//       this.weight,
//       this.alignment,
//       this.style})
//       : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _ParagraphState();
// }

// class _ParagraphState extends State<Paragraph> {
//   setFontSize(initialSize) {
//     double finalFontSize = 16.0;

//     switch (initialSize) {
//       case 1:
//         finalFontSize = 18.0;
//         break;
//       case 2:
//         finalFontSize = 16.0;
//         break;
//       case 3:
//         finalFontSize = 12.0;
//         break;
//       default:
//         finalFontSize = 16.0;
//         break;
//     }

//     return finalFontSize;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       widget.title,
//       textAlign: widget.alignment,
//       style: TextStyle(
//         fontStyle: widget.style,
//         fontWeight: widget.weight,
//         fontSize: setFontSize(widget.size),
//         color: widget.color,
//       ),
//     );
//   }
// }
