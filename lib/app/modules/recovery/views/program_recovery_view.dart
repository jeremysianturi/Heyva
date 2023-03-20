import 'package:easy_stepper/easy_stepper.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/strings.dart';
import '../../../widgets/reusable_article_container.dart';

class TabBarRecoveryProgram extends StatefulWidget {
  const TabBarRecoveryProgram({Key? key}) : super(key: key);

  @override
  State<TabBarRecoveryProgram> createState() => _TabBarRecoveryProgramState();
}

class _TabBarRecoveryProgramState extends State<TabBarRecoveryProgram> with SingleTickerProviderStateMixin {
  bool isVisible1 = true;
  bool isVisible2 = false;
  bool isVisible3 = false;
  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
        const SizedBox(height: 20.0),
        DefaultTabController(
          animationDuration: const Duration(milliseconds: 200),
          length: 3, // length of tabs
          initialIndex: 0,
          child: Builder(builder: (BuildContext context){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TabBar(

                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(28), // Creates border
                      color: ColorApp.btn_orange),
                  onTap: (index){
                    setState(() {
                      currentPosition = index;
                      if(currentPosition == 0){
                        isVisible1 = true;
                        isVisible2 = false;
                        isVisible3 = false;
                      } else if (currentPosition == 1){
                        isVisible1 = false;
                        isVisible2 = true;
                        isVisible3 = false;
                      } else if (currentPosition == 2){
                        isVisible1 = false;
                        isVisible2 = false;
                        isVisible3 = true;
                      }
                    });
                  },
                  labelColor: ColorApp.grey_tab_title,
                  labelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorApp.grey_tab_title),
                  tabs: const [
                    // DefaultTabController.of(context).index
                    Tab(
                      text: Strings.all_program,
                    ),
                    Tab(
                      text: Strings.pelvic_floor,
                    ),
                    Tab(
                      text: Strings.mental_health,
                    ),
                  ],
                ),
                Container(
                  height: 250,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      AnimatedSwitcher(
                        duration:  const Duration(milliseconds: 200),
                        child: isVisible1?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ArticleContainer(
                              containerColor: ColorApp.blue_container,
                              title: Strings.managing_anxiety,
                              tag: Strings.articles,
                              tagIcon: "assets/images/ic_bookmark.png",
                              desc: Strings.desc_related_article,
                            ),
                            Container(),
                            const ArticleContainer(
                              containerColor: ColorApp.btn_maroon,
                              title: Strings.managing_anxiety,
                              tag: Strings.program,
                              tagIcon: "assets/images/ic_program.png",
                              desc: Strings.desc_related_article,
                            ),
                          ],
                        ) : Container(),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        child: isVisible2?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ArticleContainer(
                              containerColor: ColorApp.blue_container,
                              title: Strings.managing_anxiety,
                              tag: Strings.articles,
                              tagIcon: "assets/images/ic_bookmark.png",
                              desc: Strings.desc_related_article,
                            ),
                            Container(),
                            const ArticleContainer(
                              containerColor: ColorApp.btn_maroon,
                              title: Strings.managing_anxiety,
                              tag: Strings.program,
                              tagIcon: "assets/images/ic_program.png",
                              desc: Strings.desc_related_article,
                            ),
                          ],
                        ) : Container(),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        child: isVisible3?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ArticleContainer(
                              containerColor: ColorApp.blue_container,
                              title: Strings.managing_anxiety,
                              tag: Strings.articles,
                              tagIcon: "assets/images/ic_bookmark.png",
                              desc: Strings.desc_related_article,
                            ),
                            Container(),
                            const ArticleContainer(
                              containerColor: ColorApp.btn_maroon,
                              title: Strings.managing_anxiety,
                              tag: Strings.program,
                              tagIcon: "assets/images/ic_program.png",
                              desc: Strings.desc_related_article,
                            ),
                          ],
                        ) : Container(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          })

        ),
      ]),
    );
  }
}
