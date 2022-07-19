import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/home/components/category_tile.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);
  List<String> categorias = [
    'Frutas',
    'Grãos',
    'Verduras',
    'Temperos',
    'Cereais',
  ];
  RxString selectedCategory = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
              ),
            ),
          ),
        ],
        title: Text.rich(TextSpan(style: TextStyle(fontSize: 30), children: [
          TextSpan(text: 'Green', style: TextStyle(color: CustomColors.customSwatchColor)),
          TextSpan(text: 'grocer', style: TextStyle(color: CustomColors.customContrastColor)),
        ])),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  hintText: 'Pesquise aqui',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customContrastColor,
                    size: 21,
                  ),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  )),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Obx(() => CategoryTile(
                      category: categorias[index],
                      isSelected: categorias[index] == selectedCategory.value,
                      onPressed: () {
                        selectedCategory.value = categorias[index];
                      },
                    ));
              },
              separatorBuilder: (_, index) => const SizedBox(
                width: 10,
              ),
              itemCount: categorias.length,
            ),
          )
        ],
      ),
    );
  }
}
