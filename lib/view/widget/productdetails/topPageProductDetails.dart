import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:home_food/controller/home/productdetalis_controller.dart';

import '../../../core/constant/color.dart';
import '../../../likeapi.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: Container(
              height: Get.width * 0.7,
              width: Get.width,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  image: DecorationImage(
                    repeat: ImageRepeat.repeatX,
                      image: CachedNetworkImageProvider(
                          maxWidth: Get.width.toInt(),
                          "${AppLink.imageItems}/${controller.itemsModel.itemsImage}")),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(30))),
            )),
        controller.itemsModel.itemsDescount != "0"
            ? PositionedDirectional(
                end: 10,
                top: 10,
                child: Image.asset(
                  "assets/images/dis.png",
                  width: 80,
                ))
            : const Text(""),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: CircleAvatar(
              backgroundColor: AppColor.white,
              child: IconButton(
                  onPressed: () {
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: SystemUiOverlay.values); // to re-show bars
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColor.black,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
