import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../core/core.dart';
import '../../models/response/inventory_response/product_response_model.dart';
import '../auth_local_data_source.dart';

class ProductRemoteDatasource {
  // 'name': 'TV 72 inc',
  // 'description': 'Good',
  // 'unit_id': '1',
  // 'brand_id': '1',
  // 'category_id': '1',
  // 'warehouse_id': '1',
  // 'price': '5000000',
  // 'stock': '40',
  // 'alert_stock': '2',
  // 'item_code': '2331313dsfdsf',
  // 'status': '1'
  Future<Either<String, String>> add({
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
  }) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/products');
    final header = {
      'Accept': 'application/json',
      'content-type': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
    };

    final request = http.MultipartRequest('POST', url)
      ..headers.addAll(header)
      ..fields.addAll({
        'name': name,
        'description': description,
        'unit_id': unitId.toString(),
        'brand_id': brandId.toString(),
        'category_id': categoryId.toString(),
        'warehouse_id': warehouseId.toString(),
        'price': price,
        'stock': stock.toString(),
        'alert_stock': alertStock.toString(),
        'item_code': itemCode,
        'status': status.toString(),
      })
      ..files.add(
        await http.MultipartFile.fromPath(
          'image',
          photo.path,
        ),
      );

    final response = await request.send();
    if (response.statusCode == 201) {
      return const Right('Product added successfully');
    } else {
      return Left(response.reasonPhrase ?? 'Failed to add Product');
    }
  }

  //get all brands
  Future<Either<String, ProductResponseModel>> getAll() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/products');
    final header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
    };

    final response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return Left(response.reasonPhrase ?? 'Failed to get products');
    }
  }

  //get all brands
  Future<Either<String, ProductResponseModel>> getProductsByCategory(
      int categoryId) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url =
        Uri.parse('${Variables.baseUrl}/api/products?category_id=$categoryId');
    final header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
    };

    final response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return Left(response.reasonPhrase ?? 'Failed to get products');
    }
  }

  Future<Either<String, ProductResponseModel>> getProductsByName(
      String name) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/products?name=$name');
    final header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
    };

    final response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return Left(response.reasonPhrase ?? 'Failed to get products');
    }
  }

  //delete brand
  Future<Either<String, String>> delete(int id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/products/$id');
    final header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
    };

    final response = await http.delete(url, headers: header);

    if (response.statusCode == 200) {
      return const Right('products deleted successfully');
    } else {
      return Left(response.reasonPhrase ?? 'Failed to delete products');
    }
  }

  //edit brand
  Future<Either<String, String>> edit({
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
  }) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/products/$id');
    final header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
    };

    final request = http.MultipartRequest('POST', url)
      ..headers.addAll(header)
      ..fields.addAll({
        'name': name,
        'description': description,
        'unit_id': unitId.toString(),
        'brand_id': brandId.toString(),
        'category_id': categoryId.toString(),
        'warehouse_id': warehouseId.toString(),
        'price': price,
        'stock': stock.toString(),
        'alert_stock': alertStock.toString(),
        'item_code': itemCode,
        'status': status.toString(),
      })
      ..files.add(
        await http.MultipartFile.fromPath(
          'image',
          photo.path,
        ),
      );

    final response = await request.send();
    if (response.statusCode == 200) {
      return const Right('products updated successfully');
    } else {
      return Left(response.reasonPhrase ?? 'Failed to update products');
    }
  }
}
