import '../../../core/core.dart';

class ProductPosModel {
  final String imageUrl;
  final String name;
  final double price;
  final bool isAvailable;
  final int quantity;

  ProductPosModel({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.isAvailable,
    required this.quantity,
  });

  String get priceFormatted => price.currencyFormatRp;
  String get totalPriceFormatted => (price * quantity).currencyFormatRp;
  String get subtitle {
    String label = '';
    if (isAvailable) {
      label = 'Available';
    } else {
      label = 'Not Available';
    }
    return '$label, qty $quantity Unit';
  }
}

final List<ProductPosModel> posProducts = [
  ProductPosModel(
    imageUrl:
        'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/07/21/infinix-hot-30-3295941164.jpg',
    name: 'Samsung Galaxy S21',
    price: 10999000,
    isAvailable: true,
    quantity: 10,
  ),
  ProductPosModel(
    imageUrl:
        'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/07/21/infinix-hot-30-3295941164.jpg',
    name: 'Apple iPhone 13',
    price: 14999000,
    isAvailable: true,
    quantity: 5,
  ),
  ProductPosModel(
    imageUrl:
        'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/07/21/infinix-hot-30-3295941164.jpg',
    name: 'Xiaomi Mi 11',
    price: 9999000,
    isAvailable: false,
    quantity: 0,
  ),
  ProductPosModel(
    imageUrl:
        'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/07/21/infinix-hot-30-3295941164.jpg',
    name: 'Oppo Reno 6',
    price: 7999000,
    isAvailable: true,
    quantity: 3,
  ),
  ProductPosModel(
    imageUrl:
        'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/07/21/infinix-hot-30-3295941164.jpg',
    name: 'Vivo V21',
    price: 5999000,
    isAvailable: true,
    quantity: 7,
  ),
  ProductPosModel(
    imageUrl:
        'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/07/21/infinix-hot-30-3295941164.jpg',
    name: 'Realme 8 Pro',
    price: 4999000,
    isAvailable: false,
    quantity: 0,
  ),
  ProductPosModel(
    imageUrl:
        'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/07/21/infinix-hot-30-3295941164.jpg',
    name: 'OnePlus 9',
    price: 13999000,
    isAvailable: true,
    quantity: 12,
  ),
  ProductPosModel(
    imageUrl:
        'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/07/21/infinix-hot-30-3295941164.jpg',
    name: 'Google Pixel 6',
    price: 12999000,
    isAvailable: true,
    quantity: 8,
  ),
  ProductPosModel(
    imageUrl:
        'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/07/21/infinix-hot-30-3295941164.jpg',
    name: 'Sony Xperia 5 II',
    price: 11999000,
    isAvailable: true,
    quantity: 20,
  ),
  ProductPosModel(
    imageUrl:
        'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/07/21/infinix-hot-30-3295941164.jpg',
    name: 'Asus ROG Phone 5',
    price: 15999000,
    isAvailable: false,
    quantity: 0,
  ),
];
