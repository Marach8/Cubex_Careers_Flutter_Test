// import 'package:campus_connect/src/utils/constants/colors.dart';
// import 'package:flutter/material.dart';


// class ContainerWidget extends StatelessWidget {
//   final List<Widget> children;
//   final CrossAxisAlignment? crossAxisAlignment;
//   final Color? backgroundColor;
//   final EdgeInsetsGeometry? padding;
//   final bool? addBorder;

//   const ContainerWidget({
//     super.key,
//     required this.children,
//     this.crossAxisAlignment,
//     this.backgroundColor,
//     this.padding,
//     this.addBorder
//   });

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
    
//     return ClipRect(
//       clipBehavior: Clip.hardEdge,
//       child: Container(
//         padding: padding,
//         constraints: BoxConstraints(
//           maxHeight: screenHeight,
//           minHeight: 0,
//           minWidth: 0,
//           maxWidth: screenWidth
//         ),
//         decoration: BoxDecoration(
//           color: backgroundColor ?? blackColor.withOpacity(0.3),
//           borderRadius: BorderRadius.circular(20),
//           border: addBorder ?? false ?
//             Border.all(
//               color: backgroundColor ?? whiteColor,
//               width: 1
//             ) : null
//         ),
//         child: ListView(
//           children: children
//         ),
//       ),
//     );
//   }
// }