import 'package:ecommerce/models/products_model.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  var showAllProducts = <ProductsModel>[].obs;
  final _searchresult = <ProductsModel>[].obs;

  List<ProductsModel> get searchResult => _searchresult.value;

  void getProducts(List<ProductsModel> showProducts) {
    showAllProducts.value = showProducts;
    _searchresult.value = showProducts;
  }

  set searchResult(List<ProductsModel> showProducts) {
    _searchresult.value = showProducts;
  }
}

ProductsController productsController = Get.put(ProductsController());
