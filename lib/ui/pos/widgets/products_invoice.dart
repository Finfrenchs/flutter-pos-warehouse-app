import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../data/models/response/pos_response/orders_response_model.dart';
import '../blocs/checkout/checkout_bloc.dart';

class ProductsInvoice extends StatelessWidget {
  final List<Item> items;
  const ProductsInvoice(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DataTable(
          dataRowMinHeight: 30.0,
          dataRowMaxHeight: 60.0,
          headingRowColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            return AppColors.background;
          }),
          columns: const [
            DataColumn(label: Text('Item')),
            DataColumn(label: Text('Price')),
            DataColumn(label: Text('Qty')),
            DataColumn(label: Text('Total')),
          ],
          rows: items
              .map(
                (item) => DataRow(cells: [
                  DataCell(
                    Text(
                      item.product?.name ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(Text(item.product?.price?.currencyFormatRp ?? '')),
                  DataCell(Center(child: Text('${item.quantity}'))),
                  DataCell(Text(
                    ((item.product?.price ?? 0) * (item.quantity ?? 0))
                        .currencyFormatRpIdn(),
                  )),
                ]),
              )
              .toList(),
        ),
        const Divider(),
        const SpaceHeight(12.0),
        BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox(),
              success: (products, totalQuantity, totalPrice) {
                return Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          flex: 3,
                          child: SizedBox.shrink(),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'Order Tax ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            0.currencyFormatRp,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        const SpaceWidth(12.0),
                      ],
                    ),
                    const SpaceHeight(12.0),
                    Row(
                      children: [
                        const Expanded(
                          flex: 3,
                          child: SizedBox.shrink(),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'Discount ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            0.currencyFormatRp,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        const SpaceWidth(12.0),
                      ],
                    ),
                    const SpaceHeight(12.0),
                    Row(
                      children: [
                        const Expanded(
                          flex: 3,
                          child: SizedBox.shrink(),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'Shipping ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            totalPrice.currencyFormatRp,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        const SpaceWidth(12.0),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
        const SpaceHeight(12.0),
        const Divider(),
        BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              success: (products, totalQuantity, totalPrice) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Item : ${products.length}', //total item
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Qty : $totalQuantity', //total kuantitas
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Total: ${totalPrice.currencyFormatRp}',
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const ColoredBox(
                      color: AppColors.background,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Paid Amount',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Due Amount',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              totalPrice.currencyFormatRp,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Total: ${totalPrice.currencyFormatRp}',
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
