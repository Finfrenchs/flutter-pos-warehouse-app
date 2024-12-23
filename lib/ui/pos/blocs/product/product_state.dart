part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.error(String message) = _Error;
  const factory ProductState.loaded(List<Product> products) = _Loaded;
}
