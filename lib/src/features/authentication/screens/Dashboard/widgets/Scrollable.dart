// import 'package:flutter/material.dart';
// import 'package:loginsys/src/features/authentication/screens/Dashboard/widgets/categories_model.dart';

// import '../../../../../constants/colors.dart';
// import '../../../../../constants/sizes.dart';
// import 'package:loginsys/src/features/authentication/screens/Dashboard/widgets/categories.dart';

// class DashboardScrollable extends StatelessWidget {
//   const DashboardScrollable({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final list = DashboardCategoriesModel.list;
//     return SizedBox(
//       height: 200,
//       child: ListView.builder(
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemCount: list.length,
//         itemBuilder: (context, index) => GestureDetector(
//           onTap: list[index].onPress,
//           child: SizedBox(
//             width: 320,
//             height: 200,
//             child: Padding(
//               padding: const EdgeInsets.only(right: 10, top: 5),
//               child: Container(
//                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
//                   //For Dark Color
//                   color: tCardBgColor,
//                 ),
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Flexible(
//                           child: Text(
//                             list[index].title,
//                             style: Theme.of(context).textTheme.headline4,
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         const Flexible(child: Image(image: AssetImage('assets/images/googlelogo.png'), height: 110)),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(shape: const CircleBorder()),
//                           onPressed: () {},
//                           child: const Icon(Icons.play_arrow),
//                         ),
//                         const SizedBox(width: tDashboardCardPadding),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               list[index].heading,
//                               style: Theme.of(context).textTheme.headline4,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             Text(
//                               list[index].subHeading,
//                               style: Theme.of(context).textTheme.bodyText2,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//     SizedBox(height: 6);
//   }
// }
import 'package:flutter/material.dart';
import 'package:loginsys/src/features/authentication/screens/Dashboard/widgets/categories_model.dart';

import '../../../../../constants/sizes.dart';
import 'package:loginsys/src/features/authentication/screens/Dashboard/widgets/categories.dart';

class DashboardScrollable extends StatelessWidget {
  const DashboardScrollable({Key? key});

  @override
  Widget build(BuildContext context) {
    final list = DashboardCategoriesModel.list;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF191970),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            list[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Flexible(
                          child: Image(
                              image: AssetImage('assets/images/googlelogo.png'),
                              height: 110),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: const Color(0xFFFF9B21),
                          ),
                          onPressed: () {},
                          child:
                              const Icon(Icons.play_arrow, color: Colors.white),
                        ),
                        const SizedBox(width: tDashboardCardPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index].heading,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              list[index].subHeading,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
