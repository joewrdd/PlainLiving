import 'package:plainliving/utils/constants/images.dart';

class CategoryModel {
  final String name;
  final String icon;
  final String? color;

  CategoryModel({required this.name, required this.icon, this.color});
}

final List<CategoryModel> categories = [
  CategoryModel(name: 'General', icon: ConstantImages.general, color: 'green'),
  CategoryModel(name: 'Travel', icon: ConstantImages.travel, color: 'blue'),
  CategoryModel(name: 'Car', icon: ConstantImages.car, color: 'red'),
  CategoryModel(name: 'Housing', icon: ConstantImages.housing, color: 'yellow'),
  CategoryModel(
    name: 'Education',
    icon: ConstantImages.education,
    color: 'purple',
  ),
  CategoryModel(name: 'Gifts', icon: ConstantImages.gifts, color: 'pink'),
  CategoryModel(
    name: 'Electronics',
    icon: ConstantImages.electronics,
    color: 'darkBlue',
  ),
  CategoryModel(
    name: 'Investments',
    icon: ConstantImages.investments,
    color: 'orange',
  ),
];
