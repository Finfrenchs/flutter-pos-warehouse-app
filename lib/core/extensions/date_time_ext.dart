import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const List<String> dayNames = [
  'Senin',
  'Selasa',
  'Rabu',
  'Kamis',
  'Jumat',
  'Sabtu',
  'Minggu'
];

const List<String> monthNames = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember'
];

extension DateTimeExt on DateTime {
  String toFormattedDate() {
    final dayName = dayNames[weekday - 1];
    final monthName = monthNames[month - 1];
    return '$dayName, $day $monthName $year';
  }

  String toFormattedTime() {
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute WIB';
  }

  String getMonthYearName() {
    return '${monthNames[month - 1]} $year';
  }
}

extension IntToMonthName on int {
  String get monthName {
    if (this < 1 || this > 12) return '-'; // Menangani jika nilai tidak valid

    return monthNames[this - 1];
  }
}

extension StringToMonthName on String {
  int get toMonthNumber {
    switch (toLowerCase()) {
      case 'januari':
        return 1;
      case 'februari':
        return 2;
      case 'maret':
        return 3;
      case 'april':
        return 4;
      case 'mei':
        return 5;
      case 'juni':
        return 6;
      case 'juli':
        return 7;
      case 'agustus':
        return 8;
      case 'september':
        return 9;
      case 'oktober':
        return 10;
      case 'november':
        return 11;
      case 'desember':
        return 12;
      default:
        return 0;
    }
  }
}

extension TimeOfDayExt on TimeOfDay {
  String toFormattedTime() {
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute WIB';
  }

  String toFormattedTimeString() {
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    String second = "00";
    return '$hour:$minute:$second';
  }
}

extension TimePickerExt on BuildContext {
  Future<DateTime?> selectTime({
    required bool isClockIn,
    DateTime? clockInTime,
    DateTime? clockOutTime,
    String? format, // Tambahkan parameter opsional untuk format
  }) async {
    final initialTime = isClockIn
        ? (clockInTime != null
            ? TimeOfDay.fromDateTime(clockInTime)
            : TimeOfDay.now())
        : (clockOutTime != null
            ? TimeOfDay.fromDateTime(clockOutTime)
            : TimeOfDay.now());

    final pickedTime = await showTimePicker(
      context: this,
      initialTime: initialTime,
    );

    if (pickedTime != null) {
      final now = DateTime.now();
      final selectedTime = DateTime(
          now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);

      if (format != null) {
        // Jika format disediakan, kembalikan tanggal terformat
        return DateFormat(format)
            .parse(DateFormat(format).format(selectedTime));
      }

      // Jika tidak ada format, kembalikan DateTime asli
      return selectedTime;
    }
    return null;
  }
}
