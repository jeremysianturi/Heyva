// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:heyva/app/modules/mood_tracker/mood_tracker_form/controllers/mood_tracker_form_controller.dart';
// import 'package:heyva/app/modules/mood_tracker/mood_tracker_form/widget/feeling_item.dart';
// import 'package:heyva/app/widgets/reusable_header.dart';
// import 'package:heyva/app/widgets/reusable_orange_button_with_trailing_icon.dart';
// import 'package:heyva/constant/colors.dart';
// import 'package:heyva/constant/strings.dart';

// class MoodCheckForm1 extends StatelessWidget {
//   const MoodCheckForm1({
//     super.key,
//     required this.controller,
//     required this.pagePosition,
//   });
//
//   final MoodTrackerFormController controller;
//   final int pagePosition;
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       var data = controller
//           .trackerResponse.value.data?[0].trackerDetail?[pagePosition];
//       return SafeArea(
//         child: Container(
//           height: Get.height,
//           width: Get.width,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/images/bg_heyva.png"),
//               fit: BoxFit.fill,
//             ),
//           ),
//           child: Stack(
//             children: [
//               Column(
//                 children: [
//                   Container(
//                       margin: const EdgeInsets.only(top: 14),
//                       child: const Header(
//                           showCenterTitle: true,
//                           centerTitle: Strings.moodCheckIn,
//                           rightText: Strings.skip,
//                           showIcon: false)),
//                   const SizedBox(
//                     height: 24,
//                   ),
//                   Text(
//                     data?.title ?? "",
//                     style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
//                     textAlign: TextAlign.center,
//                   ),
//                   if (data?.body != "")
//                     Column(
//                       children: [
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         Text(
//                           data?.body ?? "",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 16,
//                               color: ColorApp.grey_font),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   Expanded(child: Container()),
//                   OrangeButtonWTrailingIcon(
//                     determineAction: "ontap",
//                     text: Strings.lets_go,
//                     ontap: () {},
//                   )
//                 ],
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // const SizedBox(
//                   //   height: 94,
//                   // ),
//                   if (data?.jsonContent.toString() != "null")
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: GridView.builder(
//                         physics: ClampingScrollPhysics(),
//                         shrinkWrap: true,
//                         padding: EdgeInsets.zero,
//                         itemCount: data?.jsonContent?.length,
//                         itemBuilder: (context, index) => FeelingItem(
//                           ontap: () {
//                             controller.onSelectFeeling(index);
//                           },
//                           name: data?.jsonContent?[index].name ?? "",
//                           isSelected:
//                               data?.jsonContent?[index].isSelected ?? false,
//                         ),
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2,
//                                 childAspectRatio: 162 / 46,
//                                 crossAxisSpacing: 11,
//                                 mainAxisSpacing: 10),
//                       ),
//                     ),
//
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 20),
//                     child: TextFormField(
//                       maxLines: null,
//                       minLines: controller.pagePosition == 2 ? 9 : 1,
//                       controller: controller.otherC,
//                       decoration: InputDecoration(
//                         hintText: Strings.other,
//                         contentPadding: const EdgeInsets.symmetric(
//                             vertical: 17, horizontal: 20),
//                         filled: true,
//                         fillColor: ColorApp.white,
//                         hintStyle: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400,
//                             color: ColorApp.grey_font),
//                         labelStyle: const TextStyle(
//                             fontSize: 16,
//                             color: ColorApp.blue_container,
//                             fontWeight: FontWeight.w400),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(14),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(14.0),
//                           borderSide: const BorderSide(
//                             color: Colors.red,
//                             width: 0.8,
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(14.0),
//                           borderSide: const BorderSide(
//                             color: Colors.red,
//                             width: 0.8,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
