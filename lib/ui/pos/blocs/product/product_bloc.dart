import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/data_source/inventory/product_remote_datasource.dart';
import '../../../../data/models/response/inventory_response/product_response_model.dart';

part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRemoteDatasource productRemoteDatasource;
  ProductBloc(
    this.productRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetProducts>((event, emit) async {
      emit(const _Loading());
      final result = await productRemoteDatasource.getAll();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });

    on<_AddProduct>((event, emit) async {
      emit(const _Loading());
      final result = await productRemoteDatasource.add(
        name: event.name,
        description: event.description,
        photo: event.photo,
        categoryId: event.categoryId,
        brandId: event.brandId,
        unitId: event.unitId,
        warehouseId: event.warehouseId,
        price: event.price,
        stock: event.stock,
        alertStock: event.alertStock,
        itemCode: event.itemCode,
        status: event.status,
      );
      result.fold(
        (l) => emit(_Error(l)),
        (r) {
          add(const _GetProducts());
        },
      );
    });

    on<_DeleteProduct>((event, emit) async {
      emit(const _Loading());
      final result = await productRemoteDatasource.delete(event.id);
      result.fold(
        (l) => emit(_Error(l)),
        (r) {
          add(const _GetProducts());
        },
      );
    });

    on<_UpdateProduct>((event, emit) async {
      emit(const _Loading());
      final result = await productRemoteDatasource.edit(
        id: event.id,
        name: event.name,
        description: event.description,
        photo: event.photo,
        categoryId: event.categoryId,
        brandId: event.brandId,
        unitId: event.unitId,
        warehouseId: event.warehouseId,
        price: event.price,
        stock: event.stock,
        alertStock: event.alertStock,
        itemCode: event.itemCode,
        status: event.status,
      );
      result.fold(
        (l) => emit(_Error(l)),
        (r) {
          add(const _GetProducts());
        },
      );
    });

//   on<_SearchProducts>((event, emit) {
//   final query = event.query.toLowerCase();
//   final filteredProducts = state.products.where((product) {
//     return product.name.toLowerCase().contains(query);
//   }).toList();
//   emit(ProductState.loaded(filteredProducts));
// });
  }
}
