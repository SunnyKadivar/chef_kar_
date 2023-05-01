import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_kart/utils/common_import.dart';

class SelectDishScreen extends StatelessWidget {
  const SelectDishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.selectDishes),
      ),
      body: GetBuilder<SelectDishController>(
        init: SelectDishController(),
        builder: (controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    SizedBox(
                      height: 100,
                      child: Stack(
                        children: [
                          Container(
                            color: AppColors.black,
                            height: 50,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                right: 16, left: 16, top: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 20),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(0.6),
                                    blurRadius: 2.0,
                                  ),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      AppImages.calender,
                                      height: 18,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      AppStrings.date,
                                      style: AppFontStyle.black12w900,
                                    )
                                  ],
                                ),
                                Container(
                                  height: 30,
                                  width: 1,
                                  color: AppColors.grey.withOpacity(0.7),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      AppImages.timer,
                                      height: 18,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      AppStrings.time,
                                      style: AppFontStyle.black12w900,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<SelectDishController>(
                        id: 'dishType',
                        builder: (controller) {
                          return SizedBox(
                            height: 30,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: AppConst.dishTypeList.length,
                                itemBuilder: (context, index) {
                                  var data = AppConst.dishTypeList[index];
                                  var isSelected =
                                      controller.selectedDishType?.id ==
                                          data.id;
                                  return GestureDetector(
                                    onTap: () {
                                      controller.onChangeDishType(data);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: 16, left: index == 0 ? 16 : 0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: isSelected
                                              ? AppColors.liteOrange
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: isSelected
                                                  ? AppColors.orange
                                                  : AppColors.lightGrey,
                                              width: 1)),
                                      child: Text(
                                        data.name ?? '',
                                        style: AppFontStyle.black12w900
                                            .copyWith(
                                                color: isSelected
                                                    ? AppColors.orange
                                                    : AppColors.greyText),
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        AppStrings.popularDishes,
                        style: AppFontStyle.black16w900,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              controller.dishesModel?.popularDishes?.length,
                          itemBuilder: (context, index) {
                            var data =
                                controller.dishesModel?.popularDishes?[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: 10.0, left: index == 0 ? 16 : 0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: AppColors.orange, width: 2),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: CachedNetworkImage(
                                        memCacheHeight: 400,
                                        height: 62,
                                        width: 62,
                                        fit: BoxFit.cover,
                                        imageUrl: data?.image ?? ' ',
                                        placeholder: (context, url) =>
                                            Container(
                                          height: 60,
                                          width: 60,
                                          color: AppColors.white,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          color:
                                              AppColors.black.withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(2),
                                    height: 62,
                                    width: 62,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: AppColors.black.withOpacity(0.5),
                                    ),
                                    child: Text(
                                      data?.name ?? '',
                                      textAlign: TextAlign.center,
                                      style: AppFontStyle.white10,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    const Divider(
                      height: 50,
                      color: AppColors.dividerColor,
                      thickness: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            AppStrings.recommended,
                            style: AppFontStyle.black18w900,
                          ),
                          const Icon(
                            Icons.arrow_drop_down_sharp,
                            color: AppColors.black,
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Text(
                              AppStrings.menu,
                              style: AppFontStyle.white10w900,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var data = controller.dishesModel?.dishes?[index];
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          data?.name ?? '',
                                          style: AppFontStyle.black15w800,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(
                                          AppImages.veg,
                                          scale: 0.7,
                                        ),
                                        const SizedBox(
                                          width: 5,
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
                                            children: [
                                              Text(
                                                '${data?.rating}',
                                                style: AppFontStyle.white8,
                                              ),
                                              const SizedBox(
                                                width: 1,
                                              ),
                                              const Icon(
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
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Image.asset(
                                              AppImages.refIcon,
                                              scale: 1.5,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              AppStrings.refrigerator,
                                              style: AppFontStyle.black6,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              AppImages.refIcon,
                                              scale: 1.5,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              AppStrings.refrigerator,
                                              style: AppFontStyle.black6,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 14,
                                        ),
                                        Container(
                                          height: 24,
                                          width: 1,
                                          color: const Color(0xffD6D6D6CE),
                                        ),
                                        const SizedBox(
                                          width: 14,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(() => IngredientsScreen(
                                                  dishId: data!.id!,
                                                ));
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                AppStrings.ingredients,
                                                style: AppFontStyle.black8w900,
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                AppStrings.viewList,
                                                style: AppFontStyle.orange7w800,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      data?.description ?? '',
                                      style: AppFontStyle.textGrey12,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 100,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        memCacheHeight: 400,
                                        height: 75,
                                        width: 110,
                                        fit: BoxFit.cover,
                                        imageUrl: data?.image ?? ' ',
                                        placeholder: (context, url) =>
                                            Container(
                                          height: 75,
                                          width: 110,
                                          color: AppColors.white,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          height: 75,
                                          width: 110,
                                          color:
                                              AppColors.black.withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 62,
                                      right: 20,
                                      left: 20,
                                      child: Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 4),
                                            decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                border: Border.all(
                                                  color: AppColors.orange,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.grey
                                                        .withOpacity(0.9),
                                                    blurRadius: 6.0,
                                                  ),
                                                ]),
                                            child: const Text(
                                              AppStrings.add,
                                              style: AppFontStyle.orangeW600,
                                            ),
                                          ),
                                          const Positioned(
                                            right: 3,
                                            top: 2,
                                            child: Icon(
                                              Icons.add,
                                              color: AppColors.orange,
                                              size: 10,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 40,
                          );
                        },
                        itemCount: controller.dishesModel?.dishes?.length ?? 0)
                  ],
                );
        },
      ),
    );
  }
}
