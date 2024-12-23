import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../data/models/response/inventory_response/product_response_model.dart';
import '../blocs/checkout/checkout_bloc.dart';

class ProductPosCard extends StatelessWidget {
  final Product item;

  const ProductPosCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.stroke),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8.0),
            ),
            child: CachedNetworkImage(
              imageUrl: '${Variables.baseUrlImage}/${item.image}',
              width: context.deviceWidth,
              height: 145.0,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  item.price?.currencyFormatRp ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SpaceHeight(15),
                Button.filled(
                  height: 30,
                  onPressed: () {
                    context
                        .read<CheckoutBloc>()
                        .add(CheckoutEvent.addCheckout(item));
                  },
                  label: 'Add to chart',
                  fontSize: 14,
                ),
                // Text(
                //   'qty: ${item.quantity} Unit',
                //   style: const TextStyle(
                //     color: AppColors.gray,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
