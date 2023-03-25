import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/breast_feeding/model/video_content_model.dart';
import 'package:heyva/app/modules/breast_feeding/widget/video_player_view.dart';
import 'package:heyva/constant/colors.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({
    super.key,
    required this.index,
    required this.data,
  });

  final int index;
  final Attachments? data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(myVidePlayer(
          videoUrl: data?.attachment ?? '',
        ));
      },
      child: Card(
        elevation: 2,
        margin: EdgeInsets.only(
            left: 0, right: 0, bottom: 16, top: index == 0 ? 20 : 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: ColorApp.txt_white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            left: 8,
            bottom: 8,
            right: 17,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/bg_video.png',
                  fit: BoxFit.fill,
                  alignment: Alignment.centerLeft,
                  width: 62,
                  height: 68,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data?.attachmentTitle ?? "",
                    style: const TextStyle(
                      color: ColorApp.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    data?.attachmentLength ?? "",
                    style: TextStyle(
                      color: ColorApp.black.withOpacity(0.3),
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  'assets/icons/ic_play.svg',
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
