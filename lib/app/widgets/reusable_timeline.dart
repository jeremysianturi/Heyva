import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/keys.dart';
import 'package:heyva/model/timeline.dart';
import 'package:timelines/timelines.dart';

import '../../constant/colors.dart';
import '../../constant/strings.dart';

class TimelineView extends StatelessWidget {
  TimelineView({Key? key, required this.from}) : super(key: key);
  final String from;
  var kTileHeight = 144.0;
  var containerHeightHome = 500.0;
  var containerHeightRecovery = 344.0;

  @override
  Widget build(BuildContext context) {
    var data = from == "home" ? list : list2;
    return Container(
      // height: from == "home" ? containerHeightHome : containerHeightRecovery,
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          connectorTheme: const ConnectorThemeData(
            thickness: 4.0,
            color: Color(0xffd3d3d3),
          ),
          indicatorTheme: const IndicatorThemeData(
            size: 15.0,
          ),
        ),
        // mainAxisSize: MainAxisSize.min,
        builder: TimelineTileBuilder.connected(
          // contentsBuilder: (_ ,__) => _EmptyContents(),
          contentsBuilder: (context, index) {
            if (data[index].quote != "") {
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  data[index].quote,
                  style: const TextStyle(
                      color: ColorApp.blue_container,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  data[index].ontap();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorApp.blue_container,
                          ),
                          color: ColorApp.blue_container,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16))),
                      height: 136,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 16, bottom: 16, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index].title,
                                    style: const TextStyle(
                                        color: ColorApp.text_input_bg,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    data[index].subtitle,
                                    style: const TextStyle(
                                        color: ColorApp.txt_white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/ic_time.png",
                                        height: 11,
                                        width: 11,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        data[index].time,
                                        style: const TextStyle(
                                            color: ColorApp.txt_white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 115,
                              decoration: BoxDecoration(
                                color: ColorApp.grey_container,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                  image: AssetImage(data[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              );
            }
          },
          connectorBuilder: (_, index, __) {
            return const DashedLineConnector(
              thickness: 1,
            );
          },
          indicatorBuilder: (_, index) {
            if (data[index].isSelected.value == true) {
              return const DotIndicator(
                color: ColorApp.blue_container,
              );
            } else if (data[index].isSelected.value == false) {
              return const OutlinedDotIndicator(
                color: ColorApp.dash_color,
                backgroundColor: Colors.transparent,
                borderWidth: 2.0,
              );
            }
          },
          itemExtentBuilder: (_, index) => data[index].quote != ""
              ? from == "home"
                  ? 60
                  : 84
              : kTileHeight,
          itemCount: data.length,
        ),
      ),
    );
  }

  List<TimelineModel> list = [
    TimelineModel(
        quote: Strings.mother_love,
        title: "",
        subtitle: "",
        time: "",
        image: "",
        isSelected: true.obs,
        ontap: () {}),
    TimelineModel(
        quote: "",
        title: Strings.breathing_exercise,
        subtitle: Strings.welcome_heyva,
        time: Strings.minute,
        image: "assets/images/img_dummy_yoga.png",
        isSelected: true.obs,
        ontap: () {
          var box = GetStorage();
          box.remove(Keys.programIdStorage);
          box.remove(Keys.programIdChildStorage);
          Get.toNamed(Routes.BREATHING_EXERCISE);
        }),
    TimelineModel(
        quote: "",
        title: Strings.track_my_mood,
        subtitle: Strings.rhythm_of_health,
        time: Strings.minute,
        image: "assets/images/img_dummy_mood.png",
        isSelected: false.obs,
        ontap: () {
          Get.toNamed(Routes.MOOD_TRACKER);
        }),
  ];

  List<TimelineModel> list2 = [
    TimelineModel(
        quote: Strings.happy_mommy,
        title: "",
        subtitle: "",
        time: "",
        image: "",
        isSelected: true.obs,
        ontap: () {}),
    TimelineModel(
        quote: "",
        title: Strings.identification_exercise,
        subtitle: Strings.pelvic_floor,
        time: Strings.one_minute,
        image: "assets/images/img_dummy_yoga.png",
        isSelected: false.obs,
        ontap: () {
          Get.toNamed(Routes.BREATHING_ONE);
        }),
  ];
}

enum _TimelineStatus { finish, todo }

extension on _TimelineStatus {
  bool get isInProgress => this == _TimelineStatus.todo;
}
