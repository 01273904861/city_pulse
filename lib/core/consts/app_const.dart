import 'package:city_pulse/core/app_assets.dart';
import 'package:city_pulse/core/consts/app_colors.dart';
import 'package:city_pulse/features/on%20boarding/models/icon_model.dart';

abstract class AppConst {
  static List<ImageModel> imageModels = [
    ImageModel(image: Assets.imagesTermometer, color: AppColors.orange),
    ImageModel(image: Assets.imagesWaterdrop, color: AppColors.lightGreen),
    ImageModel(image: Assets.imagesBrainstorm, color: AppColors.lightBlue),
    ImageModel(image: Assets.imagesGroup, color: AppColors.maintGreen),
  ];
}
