import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/insights/model/Insight_model.dart' as insight;
import 'package:heyva/constant/colors.dart';

class InsightMoodWidget extends StatelessWidget {
  const InsightMoodWidget({
    super.key,
    required this.data,
  });

  final insight.Insight data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: Get.width - 65,
      decoration: const BoxDecoration(
          color: ColorApp.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: Get.width,
            decoration: const BoxDecoration(
                color: ColorApp.btn_orange,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: Text(
              data.type?.title ?? "",
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: ColorApp.white),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(data.response?.length ?? 0, (index) {
                debugPrint(
                    "data ${data.response?[index].answer?.firstWhereOrNull((e) => e.emoji == "")?.emoji != ""}");
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.response?[index].trackerDetail?.title ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ColorApp.blue_container),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    data.response?[index].answer?.length != 0
                        ? Container(
                            child: data.response?[index].answer
                                        ?.firstWhereOrNull((e) => e.emoji == "")
                                        ?.emoji !=
                                    ""
                                ? GridView.count(
                                    physics: NeverScrollableScrollPhysics(),
                                    crossAxisCount: 2,
                                    shrinkWrap: true,
                                    childAspectRatio: 110 / 39,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                    padding: EdgeInsets.zero,
                                    children: List.generate(
                                        data.response?[index].answer?.length ??
                                            0, (i) {
                                      var itemData =
                                          data.response?[index].answer?[i];
                                      return Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 11),
                                          decoration: const BoxDecoration(
                                              color: ColorApp.text_input_bg,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12))),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (itemData?.emoji != "")
                                                Text(
                                                  itemData?.emoji ?? "",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: ColorApp
                                                          .black_font_underline,
                                                      fontSize: 14),
                                                ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                itemData?.name ?? "",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: ColorApp
                                                        .black_font_underline,
                                                    fontSize: 14),
                                              )
                                            ],
                                          ));
                                    }),
                                  )
                                : Column(
                                    children: List.generate(
                                        data.response?[index].answer?.length ??
                                            0, (i) {
                                      var itemData =
                                          data.response?[index].answer?[i];
                                      return Container(
                                        width: Get.width,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 11),
                                          decoration: const BoxDecoration(
                                              color: ColorApp.text_input_bg,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12))),
                                          child: Expanded(
                                            child: Text(
                                              itemData?.name ?? "",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorApp
                                                      .black_font_underline,
                                                  fontSize: 14),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ));
                                    }),
                                  ),
                          )
                        : Container(
                            width: Get.width,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                border: Border.all(
                                    color: ColorApp.btn_orange, width: 1)),
                            child: Text(
                              data.response?[index].note ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: ColorApp.blue_container),
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              }),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(24.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const Text(
          //         Strings.youFelt,
          //         style: TextStyle(
          //             fontWeight: FontWeight.w500,
          //             fontSize: 16,
          //             color: ColorApp.blue_container),
          //       ),
          //       const SizedBox(
          //         height: 20,
          //       ),
          //       Container(
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 10, vertical: 11),
          //           decoration: const BoxDecoration(
          //               color: ColorApp.text_input_bg,
          //               borderRadius: BorderRadius.all(Radius.circular(12))),
          //           child: Row(
          //             mainAxisSize: MainAxisSize.min,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Image.asset("assets/images/smile.png"),
          //               const SizedBox(
          //                 width: 10,
          //               ),
          //               const Text(
          //                 "Joy",
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     color: ColorApp.blue_container,
          //                     fontSize: 14),
          //               )
          //             ],
          //           )),
          //       const SizedBox(
          //         height: 20,
          //       ),
          //       const Text(
          //         Strings.thisImpactedYou,
          //         style: TextStyle(
          //             fontWeight: FontWeight.w500,
          //             fontSize: 16,
          //             color: ColorApp.blue_container),
          //       ),
          //       const SizedBox(
          //         height: 20,
          //       ),
          //       Container(
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 10, vertical: 11),
          //           decoration: const BoxDecoration(
          //               color: ColorApp.text_input_bg,
          //               borderRadius: BorderRadius.all(Radius.circular(12))),
          //           child: Row(
          //             mainAxisSize: MainAxisSize.min,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Image.asset("assets/images/smile.png"),
          //               const SizedBox(
          //                 width: 10,
          //               ),
          //               const Text(
          //                 "Joy",
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     color: ColorApp.blue_container,
          //                     fontSize: 14),
          //               )
          //             ],
          //           )),
          //     ],
          //   ),
          // ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20.0),
          //   child: Text(
          //     Strings.yourNotes,
          //     style: TextStyle(
          //         fontWeight: FontWeight.w500,
          //         fontSize: 16,
          //         color: ColorApp.blue_container),
          //   ),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   width: Get.width,
          //   padding: const EdgeInsets.all(10),
          //   margin: const EdgeInsets.symmetric(horizontal: 10),
          //   decoration: BoxDecoration(
          //       borderRadius: const BorderRadius.all(Radius.circular(12)),
          //       border: Border.all(color: ColorApp.btn_orange, width: 1)),
          //   child: const Text(
          //     "This Your Notes",
          //     style: TextStyle(
          //         fontWeight: FontWeight.w500,
          //         fontSize: 16,
          //         color: ColorApp.blue_container),
          //   ),
          // ),
          // const SizedBox(
          //   height: 24,
          // ),
        ],
      ),
    );
  }
}
