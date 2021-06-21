import 'package:news_app/models/catergory_modal.dart';

List<CategorieModel> getCategories(){

  List<CategorieModel> myCategories = <CategorieModel>[];
  CategorieModel categorieModel;

  //1
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Business";
  categorieModel.imageAssetUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm9bZGM5vjA2FFIVQru2EBj9Wz9nTn1WnfmYbcQbllmnWRY9U64uMS86PWUEXpymDOR2g&usqp=CAU";
  myCategories.add(categorieModel);

  //2
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Entertainment";
  categorieModel.imageAssetUrl = "https://media.glamour.com/photos/5fbe7869a97f78c67b228b6f/master/w_3200,h_1800,c_limit/winter-tv.jpg";
  myCategories.add(categorieModel);

  //3
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "General";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  myCategories.add(categorieModel);

  //4
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Health";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Science";
  categorieModel.imageAssetUrl = "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2F1215151032%2F960x0.jpg%3Ffit%3Dscale";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Sports";
  categorieModel.imageAssetUrl = "https://media.istockphoto.com/photos/sports-balls-on-the-field-with-yard-line-soccer-ball-american-and-picture-id942206100?k=6&m=942206100&s=612x612&w=0&h=3e7uXynT9d_aCT4qVmJsfcmkd53DpqMiw_ZCUKi9smY=";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Technology";
  categorieModel.imageAssetUrl = "https://cdn.mos.cms.futurecdn.net/8bEfxy8skS6fUVZnfaLWxj.jpg";
  myCategories.add(categorieModel);

  return myCategories;

}