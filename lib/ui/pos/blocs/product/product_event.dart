part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.started() = _Started;
  const factory ProductEvent.addProduct({
    required String name,
    required String description,
    required int unitId,
    required int brandId,
    required int categoryId,
    required int warehouseId,
    required String price,
    required int stock,
    required int alertStock,
    required String itemCode,
    required int status,
    required XFile photo,
  }) = _AddProduct;

  const factory ProductEvent.getProducts() = _GetProducts;

  //delete product
  const factory ProductEvent.deleteProduct(int id) = _DeleteProduct;

  //update product
  const factory ProductEvent.updateProduct({
    required int id,
    required String name,
    required String description,
    required int unitId,
    required int brandId,
    required int categoryId,
    required int warehouseId,
    required String price,
    required int stock,
    required int alertStock,
    required String itemCode,
    required int status,
    required XFile photo,
  }) = _UpdateProduct;
  const factory ProductEvent.searchProducts(String query) = _SearchProducts;
}
