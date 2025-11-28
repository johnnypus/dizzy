import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:sixam_mart/common/widgets/address_widget.dart';
import 'package:sixam_mart/common/widgets/custom_ink_well.dart';
import 'package:sixam_mart/features/banner/controllers/banner_controller.dart';
import 'package:sixam_mart/features/location/controllers/location_controller.dart';
import 'package:sixam_mart/features/splash/controllers/splash_controller.dart';
import 'package:sixam_mart/features/address/controllers/address_controller.dart';
import 'package:sixam_mart/features/address/domain/models/address_model.dart';
import 'package:sixam_mart/helper/address_helper.dart';
import 'package:sixam_mart/helper/auth_helper.dart';
import 'package:sixam_mart/helper/responsive_helper.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/styles.dart';
import 'package:sixam_mart/common/widgets/custom_image.dart';
import 'package:sixam_mart/common/widgets/custom_loader.dart';
import 'package:sixam_mart/common/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/features/home/widgets/banner_view.dart';
import 'package:sixam_mart/features/home/widgets/popular_store_view.dart';

/*class ModuleView extends StatelessWidget {
  final SplashController splashController;
  const ModuleView({super.key, required this.splashController});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      GetBuilder<BannerController>(builder: (bannerController) {
       return const BannerView(isFeatured: true);
      }),

      splashController.moduleList != null ? splashController.moduleList!.isNotEmpty ?

      // Reemplaza aquí tu GridView/Wrap actual
    /*GridView.builder( gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3, mainAxisSpacing: Dimensions.paddingSizeExtraSmall,
    crossAxisSpacing: Dimensions.paddingSizeLarge, childAspectRatio: (1/1), ),
    padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
    itemCount: splashController.moduleList!.length, shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) { return Container( decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
    color: Colors.transparent,
    //boxShadow: [BoxShadow(color: Theme.of(context).primaryColor.withValues(alpha: 0.1), spreadRadius: 1, blurRadius: 3)],
    ), child: CustomInkWell( onTap: () => splashController.switchModule(index, true), radius: Dimensions.radiusDefault,
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [ ClipRRect( borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
    child: CustomImage( image: '${splashController.moduleList![index].iconFullUrl}', height: 85, width: 85, ), ),
    //const SizedBox(height: Dimensions.paddingSizeSmall),
    Center(child: Text( splashController.moduleList![index].moduleName!,
      textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis,
      style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall),
    )),
    ]),
    ),
    );
      },
    )*/

      Column(
        children: [
          // 🟣 Primera fila: 2 botones grandes
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
            child: Row(
              children: [
                // Primer módulo
                if (splashController.moduleList!.isNotEmpty)
                  Expanded(
                    child: CustomInkWell(
                      onTap: () => splashController.switchModule(0, true),
                      radius: Dimensions.radiusDefault,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                            child: CustomImage(
                              image: splashController.moduleList![0].iconFullUrl!,
                              height: 140,
                              width: 140,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            splashController.moduleList![0].moduleName!,
                            textAlign: TextAlign.center,
                            style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(width: Dimensions.paddingSizeLarge),

                // Segundo módulo (si existe)
                if (splashController.moduleList!.length > 1)
                  Expanded(
                    child: CustomInkWell(
                      onTap: () => splashController.switchModule(1, true),
                      radius: Dimensions.radiusDefault,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                            child: CustomImage(
                              image: splashController.moduleList![1].iconFullUrl!,
                              height: 140,
                              width: 140,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            splashController.moduleList![1].moduleName!,
                            textAlign: TextAlign.center,
                            style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // 🟢 Resto de los módulos (3 columnas)
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: Dimensions.paddingSizeExtraSmall,
              crossAxisSpacing: Dimensions.paddingSizeLarge,
              childAspectRatio: (1 / 1),
            ),
            padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
            itemCount: splashController.moduleList!.length > 2
                ? splashController.moduleList!.length - 2
                : 0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final module = splashController.moduleList![index + 2];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                  color: Colors.transparent,
                ),
                child: CustomInkWell(
                  onTap: () => splashController.switchModule(index + 2, true),
                  radius: Dimensions.radiusDefault,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                        child: CustomImage(
                          image: module.iconFullUrl!,
                          height: 85,
                          width: 85,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        module.moduleName!,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      )
          : Center(child: Padding(
        padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall), child: Text('no_module_found'.tr),
      )) : ModuleShimmer(isEnabled: splashController.moduleList == null),

      GetBuilder<AddressController>(builder: (locationController) {
        List<AddressModel?> addressList = [];
        if(AuthHelper.isLoggedIn() && locationController.addressList != null) {
          addressList = [];
          bool contain = false;
          if(AddressHelper.getUserAddressFromSharedPref()!.id != null) {
            for(int index=0; index<locationController.addressList!.length; index++) {
              if(locationController.addressList![index].id == AddressHelper.getUserAddressFromSharedPref()!.id) {
                contain = true;
                break;
              }
            }
          }
          if(!contain) {
            addressList.add(AddressHelper.getUserAddressFromSharedPref());
          }
          addressList.addAll(locationController.addressList!);
        }
        return (!AuthHelper.isLoggedIn() || locationController.addressList != null) ? addressList.isNotEmpty ? Column(
          children: [

            const SizedBox(height: Dimensions.paddingSizeLarge),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
              child: TitleWidget(title: 'deliver_to'.tr),
            ),
            const SizedBox(height: Dimensions.paddingSizeExtraSmall),

            SizedBox(
              height: 80,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: addressList.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: Dimensions.paddingSizeSmall, right: Dimensions.paddingSizeSmall, top: Dimensions.paddingSizeExtraSmall),
                itemBuilder: (context, index) {
                  return Container(
                    width: 300,
                    padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                    child: AddressWidget(
                      address: addressList[index],
                      fromAddress: false,
                      onTap: () {
                        if(AddressHelper.getUserAddressFromSharedPref()!.id != addressList[index]!.id) {
                          Get.dialog(const CustomLoaderWidget(), barrierDismissible: false);
                          Get.find<LocationController>().saveAddressAndNavigate(
                            addressList[index], false, null, false, ResponsiveHelper.isDesktop(context),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ) : const SizedBox() : AddressShimmer(isEnabled: AuthHelper.isLoggedIn() && locationController.addressList == null);
      }),

      const PopularStoreView(isPopular: false, isFeatured: true),

      const SizedBox(height: 120),

    ]);
  }
}*/
class ModuleView extends StatelessWidget {
  final SplashController splashController;
  const ModuleView({super.key, required this.splashController});

  void _showAgeGate(BuildContext context, VoidCallback onContinue) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text('+18'),
        content: const Text(
            'Este módulo puede incluir contenido para mayores de 18 años. ¿Deseas continuar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Atrás'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onContinue();
            },
            child: const Text('Continuar'),
          ),
        ],
      ),
    );
  }

  bool _isAdult(String? name) {
    final n = name?.toLowerCase() ?? '';
    return n.contains('licores') || n.contains('adultos');
  }

  @override
  Widget build(BuildContext context) {
    final modules = splashController.moduleList ?? [];

    if (modules.isEmpty) {
      return const Center(child: Text('No hay módulos disponibles'));
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          const BannerView(isFeatured: true),

          // 🟣 Dos primeros grandes
          if (modules.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(child: _buildItem(context, modules[0], 0, true)),
                  const SizedBox(width: 16),
                  if (modules.length > 1)
                    Expanded(child: _buildItem(context, modules[1], 1, true)),
                ],
              ),
            ),

          // 🟢 Resto en filas de 3
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: modules.length > 2 ? modules.length - 2 : 0,
            itemBuilder: (context, i) {
              final index = i + 2;
              return _buildItem(context, modules[index], index, false);
            },
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, dynamic module, int index, bool isLarge) {
    final size = isLarge ? 140.0 : 85.0;
    final isAdult = !isLarge && _isAdult(module.moduleName);

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        if (isAdult) {
          _showAgeGate(context, () {
            splashController.switchModule(index, true);
          });
        } else {
          splashController.switchModule(index, true);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CustomImage(
                  image: '${module.iconFullUrl}',
                  height: size,
                  width: size,
                ),
              ),
              if (isAdult)
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      '+18',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            module.moduleName ?? '',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class ModuleShimmer extends StatelessWidget {
  final bool isEnabled;
  const ModuleShimmer({super.key, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, mainAxisSpacing: Dimensions.paddingSizeSmall,
        crossAxisSpacing: Dimensions.paddingSizeSmall, childAspectRatio: (1/1),
      ),
      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      itemCount: 6,
      shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            color: Theme.of(context).cardColor,
            //  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)],
          ),
          child: Shimmer(
            duration: const Duration(seconds: 2),
            enabled: isEnabled,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

              Container(
                height: 50, width: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radiusSmall), color: Colors.grey[300]),
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),

              Center(child: Container(height: 15, width: 50, color: Colors.grey[300])),

            ]),
          ),
        );
      },
    );
  }
}

class AddressShimmer extends StatelessWidget {
  final bool isEnabled;
  const AddressShimmer({super.key, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Dimensions.paddingSizeLarge),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
          child: TitleWidget(title: 'deliver_to'.tr),
        ),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall),

        SizedBox(
          height: 70,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
            itemBuilder: (context, index) {
              return Container(
                width: 300,
                padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                child: Container(
                  padding: EdgeInsets.all(ResponsiveHelper.isDesktop(context) ? Dimensions.paddingSizeDefault
                      : Dimensions.paddingSizeSmall),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                    // boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)],
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(
                      Icons.location_on,
                      size: ResponsiveHelper.isDesktop(context) ? 50 : 40, color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: Dimensions.paddingSizeSmall),
                    Expanded(
                      child: Shimmer(
                        duration: const Duration(seconds: 2),
                        enabled: isEnabled,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                          Container(height: 15, width: 100, color: Colors.grey[300]),
                          const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                          Container(height: 10, width: 150, color: Colors.grey[300]),
                        ]),
                      ),
                    ),
                  ]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


