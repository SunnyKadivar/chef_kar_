import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_kart/utils/common_import.dart';

class IngredientsScreen extends StatelessWidget {
  int dishId;

  IngredientsScreen({Key? key, required this.dishId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<IngredientsController>(
          init: IngredientsController(dishId),
          builder: (controller) {
            var data = controller.ingredientsModel;
            return SafeArea(
              child: controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
                      children: [
                        SizedBox(
                          height: 280,
                          child: Stack(
                            children: [
                              Positioned(
                                right: -30,
                                top: 40,
                                child: Container(
                                  height: 210,
                                  width: 210,
                                  decoration: BoxDecoration(
                                      color: AppColors.liteOrange,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                              ),
                              Positioned(
                                bottom: 30,
                                child: Container(
                                  height: 3,
                                  width: MediaQuery.of(context).size.width,
                                  color: AppColors.dividerColor,
                                ),
                              ),
                              Positioned(
                                  right: -200,
                                  top: 120,
                                  // left: 0,
                                  child: Image.asset(
                                    AppImages.vegi,
                                    width: 400,
                                    fit: BoxFit.fitWidth,
                                  )),
                              Positioned(
                                  right: -90,
                                  top: 80,
                                  // left: 0,
                                  child: Image.asset(
                                    AppImages.vegi2,
                                    fit: BoxFit.fitWidth,
                                    scale: 2,
                                  )),
                              Positioned(
                                top: 80,
                                right: 120,
                                left: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          data?.name ?? '',
                                          style: AppFontStyle.black24w900,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 1),
                                          decoration: BoxDecoration(
                                            color: AppColors.green,
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          child: Row(
                                            children: const [
                                              Text(
                                                '4.2',
                                                style: AppFontStyle.white8,
                                              ),
                                              SizedBox(
                                                width: 1,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: AppColors.white,
                                                size: 8,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 20.0),
                                      child: Text(
                                        AppStrings.dishDes,
                                        style: AppFontStyle.textGrey2s12,
                                        maxLines: 3,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          AppImages.clock,
                                          scale: 1.5,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          data?.timeToPrepare ?? '',
                                          style: AppFontStyle.black12w900,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                      Icons.arrow_back_ios_new_rounded))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                AppStrings.ingredients,
                                style: AppFontStyle.black18w900,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                AppStrings.for2People,
                                style: AppFontStyle.textGrey10,
                              ),
                              Divider(
                                color: Color(0xffd6d6d6ce),
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: const [
                              Text(
                                AppStrings.vegetables,
                                style: AppFontStyle.black14w900,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.arrow_drop_down_sharp)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shrinkWrap: true,
                            itemCount: data?.ingredients?.vegetables?.length,
                            itemBuilder: (context, index) {
                              var data2 = data?.ingredients?.vegetables?[index];
                              return Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data2?.name ?? '',
                                      style: AppFontStyle.black12w500,
                                    ),
                                    Text(
                                      data2?.quantity ?? '',
                                      style: AppFontStyle.black12w500,
                                    )
                                  ],
                                ),
                              );
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: const [
                              Text(
                                AppStrings.spices,
                                style: AppFontStyle.black14w900,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.arrow_drop_down_sharp)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            shrinkWrap: true,
                            itemCount: data?.ingredients?.spices?.length,
                            itemBuilder: (context, index) {
                              var data2 = data?.ingredients?.spices?[index];
                              return Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data2?.name ?? '',
                                      style: AppFontStyle.black12w500,
                                    ),
                                    Text(
                                      data2?.quantity ?? '',
                                      style: AppFontStyle.black12w500,
                                    )
                                  ],
                                ),
                              );
                            }),
                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: const [
                              Text(
                                AppStrings.appliance,
                                style: AppFontStyle.black16w900,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: data?.ingredients?.appliances?.length,
                              itemBuilder: (context, index) {
                                var data2 =
                                    data?.ingredients?.appliances?[index];
                                return Container(
                                  width: 80,
                                  height: 90,
                                  margin: EdgeInsets.only(
                                      left: index == 0 ? 16 : 0, right: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: AppColors.applianceBgColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      CachedNetworkImage(
                                        memCacheHeight: 400,
                                        height: 75,
                                        width: 110,
                                        fit: BoxFit.cover,
                                        imageUrl: data2?.image ?? ' ',
                                        placeholder: (context, url) =>
                                            Container(
                                          height: 75,
                                          width: 110,
                                          color: AppColors.white,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(AppImages.ref),
                                      ),
                                      Text(
                                        data2?.name ?? '',
                                        style: AppFontStyle.lightBlack9,
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
            );
          }),
    );
  }
}
