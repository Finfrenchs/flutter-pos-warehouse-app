import 'package:intl/intl.dart';

extension NumExt on num {
  String get currencyFormatRp => NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp. ',
        decimalDigits: 0,
      ).format(this);
}

extension CurrencyFormat on int {
  String currencyFormatRpIdn() {
    return 'Rp. ${toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.')}';
  }
}

extension DoubleCurrencyFormat on double {
  String currencyFormatRpIndDouble() {
    return 'Rp. ${toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.')}';
  }
}

