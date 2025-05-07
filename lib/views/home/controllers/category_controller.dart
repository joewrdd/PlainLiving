import 'package:get/get.dart';
import 'package:plainliving/views/home/models/category_model.dart'
    as category_model;

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final RxList<category_model.CategoryModel> categories =
      <category_model.CategoryModel>[].obs;
  final RxInt selectedCategoryIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() {
    categories.assignAll(category_model.categories);
  }

  category_model.CategoryModel getCategoryByIndex(int index) {
    if (index >= 0 && index < categories.length) {
      return categories[index];
    }
    return category_model.CategoryModel(
      name: 'General',
      icon: '',
      color: 'grey',
    );
  }

  category_model.CategoryModel? getCategoryByName(String name) {
    try {
      return categories.firstWhere((category) => category.name == name);
    } catch (e) {
      return null;
    }
  }

  List<category_model.CategoryModel> getAllCategories() {
    return categories.toList();
  }

  category_model.CategoryModel get selectedCategory {
    if (selectedCategoryIndex.value >= 0 &&
        selectedCategoryIndex.value < categories.length) {
      return categories[selectedCategoryIndex.value];
    }
    return categories.first;
  }

  void selectCategory(int index) {
    if (index >= 0 && index < categories.length) {
      selectedCategoryIndex.value = index;
      update();
    }
  }

  void resetSelection() {
    selectedCategoryIndex.value = 0;
    update();
  }
}
