import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../data/models/response/inventory_response/product_response_model.dart';

class EditProduct extends StatefulWidget {
  final Product item;
  final VoidCallback onConfirmTap;
  const EditProduct({
    super.key,
    required this.item,
    required this.onConfirmTap,
  });

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final taxOption = ['Tax option', 'etc...'];
  final taxTypes = ['PPN', 'etc...'];

  late final TextEditingController unitPriceController;
  late final TextEditingController discountController;
  late final TextEditingController taxController;
  late final TextEditingController taxTypeController;

  @override
  void initState() {
    unitPriceController = TextEditingController();
    discountController = TextEditingController();
    taxController = TextEditingController();
    taxTypeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    unitPriceController.dispose();
    discountController.dispose();
    taxController.dispose();
    taxTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 500.0,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name!,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: unitPriceController,
                  label: 'Unit Price',
                  hintText: 'Please Enter Unit Price',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
                const SpaceHeight(12.0),
                CustomTextField(
                  controller: unitPriceController,
                  label: 'Discount',
                  hintText: 'Please Enter Discount',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  suffixIcon: const SizedBox(
                    width: 50.0,
                    child: Center(child: Text('%')),
                  ),
                ),
                const SpaceHeight(12.0),
                CustomDropdown(
                  value: taxController.text.isEmpty ? null : taxController.text,
                  items: taxOption,
                  label: 'Tax',
                  onChanged: (value) {
                    taxController.text = value ?? '';
                    setState(() {});
                  },
                ),
                const SpaceHeight(12.0),
                CustomDropdown(
                  value: taxTypeController.text.isEmpty
                      ? null
                      : taxTypeController.text,
                  items: taxTypes,
                  label: 'Tax Type',
                  onChanged: (value) {
                    taxTypeController.text = value ?? '';
                    setState(() {});
                  },
                ),
                const SpaceHeight(24.0),
                Row(
                  children: [
                    Flexible(
                        child: Button.outlined(
                      onPressed: () => context.pop(),
                      label: 'Cancel',
                    )),
                    const SpaceWidth(16.0),
                    Flexible(
                      child: Button.filled(
                        onPressed: widget.onConfirmTap,
                        label: 'Update',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
