class CategoriesModel {
  bool status;

  CategoryDataModel data;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CategoryDataModel.fromJson(json['data']);
  }
}

class CategoryDataModel{

  int currentPage;
  List<CategoryData> categoryData =[];

  CategoryDataModel.fromJson(Map<String,dynamic> json){
    currentPage = json['current_page'];
    json['data'].forEach((element){
      categoryData.add(CategoryData.fromJson(element));

    });
  }
}

class CategoryData {
  int id;

  String name;
  String image;

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
