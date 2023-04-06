import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/detaildoctor/model/doctor_list_model.dart'
as doctor;
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/colors.dart';
import 'package:heyva/constant/keys.dart';


class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.data,
  });

  final doctor.Data? data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL_DOCTOR, arguments: {
          Keys.doctorIdArguments: data?.id ?? "",
        });
      },
      child: Card(
        elevation: 0,
        color: ColorApp.arrow_white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: Container(
              height: 68,
              width: 62,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorApp.blue_container,
                  ),
                  color: ColorApp.blue_container,
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
            ),
            title: Text(
              data?.name ?? "",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorApp.black_font_underline),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data?.specialist ?? "",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorApp.black_font_40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/ic_star.png"),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      data?.rate ?? "",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorApp.black),
                    ),
                  ],
                ),
              ],
            ),
            trailing: RawMaterialButton(
              constraints: BoxConstraints.tight(const Size(24, 24)),
              padding: EdgeInsets.zero,
              onPressed: () {},
              elevation: 0,
              fillColor: ColorApp.txt_white,
              shape: const CircleBorder(),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
