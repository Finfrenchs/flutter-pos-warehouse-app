// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../../../core/core.dart';
import '../../../data/models/response/pos_response/orders_response_model.dart';
import '../blocs/checkout/checkout_bloc.dart';
import '../blocs/draft_order/draft_order_bloc.dart';
import '../widgets/products_draft_invoice.dart';
import '../widgets/products_invoice.dart';

class PrintInvoicePreviewOrderDialog extends StatelessWidget {
  final Order order;
  const PrintInvoicePreviewOrderDialog({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Print Invoice',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.pop();
                    context
                        .read<CheckoutBloc>()
                        .add(const CheckoutEvent.started());
                    context
                        .read<DraftOrderBloc>()
                        .add(const DraftOrderEvent.fetch());
                  },
                  icon: const Icon(Icons.cancel),
                ),
              ],
            ),
            const Divider(),
            Center(
              child: Assets.images.logoPrimary.image(height: 60.0),
            ),
            const SpaceHeight(10.0),
            const Center(
              child: Text(
                'Phone : 0812-3456-7890',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkGray,
                ),
              ),
            ),
            const Center(
              child: Text(
                'Email: bahri@jagoflutter.id',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkGray,
                ),
              ),
            ),
            const Divider(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Invoice : ${order.orderNumber}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const Text(
                      'Customer : Walk In Customer',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGray,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date : ${order.createdAt!.toFormattedDate()}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const Text(
                      'Sold by : Admin',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SpaceHeight(12.0),
            ProductsInvoice(order.items!),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  'Payment Mode : ${order.paymentType}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Divider(),
            SizedBox(
              height: 60.0,
              child: SfBarcodeGenerator(
                value: 'John Doe',
              ),
            ),
            const SpaceHeight(12.0),
            const Center(
              child: Text(
                'CWB - 99',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SpaceHeight(12.0),
            const Center(
              child: Text(
                'Thank You For Shopping With Us. Please Come Again',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                ),
              ),
            ),
            const Divider(),
            const SpaceHeight(20.0),
            Center(
              child: Button.filled(
                width: 250.0,
                onPressed: () {},
                label: 'Print Invoice',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrintInvoicePreviewDraftDialog extends StatefulWidget {
  final int id;
  const PrintInvoicePreviewDraftDialog({
    super.key,
    required this.id,
  });

  @override
  State<PrintInvoicePreviewDraftDialog> createState() =>
      _PrintInvoicePreviewDraftDialogState();
}

class _PrintInvoicePreviewDraftDialogState
    extends State<PrintInvoicePreviewDraftDialog> {
  @override
  void initState() {
    context.read<DraftOrderBloc>().add(DraftOrderEvent.detail(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: BlocBuilder<DraftOrderBloc, DraftOrderState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              failed: (message) => Center(
                child: Text(message),
              ),
              successDetail: (data) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Print Invoice',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context.pop();
                            context
                                .read<CheckoutBloc>()
                                .add(const CheckoutEvent.started());
                          },
                          icon: const Icon(Icons.cancel),
                        ),
                      ],
                    ),
                    const Divider(),
                    Center(
                      child: Assets.images.logoPrimary.image(height: 60.0),
                    ),
                    const SpaceHeight(10.0),
                    const Center(
                      child: Text(
                        'Phone : 0812-3456-7890',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkGray,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Email: bahri@jagoflutter.id',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkGray,
                        ),
                      ),
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Invoice : ${data.data?.orderNumber ?? ''}',
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkGray,
                              ),
                            ),
                            const Text(
                              'Customer : Walk In Customer',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkGray,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date : ${data.data?.createdAt!.toFormattedDate()}',
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkGray,
                              ),
                            ),
                            const Text(
                              'Sold by : Admin',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkGray,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SpaceHeight(12.0),
                    ProductsDraftInvoice(data.data!.items!),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          data.data?.paymentStatus == 'paid'
                              ? 'Payment Status : Lunas'
                              : 'Belum Dibayar',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          'Payment Mode : ${data.data?.paymentType}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Divider(),
                    SizedBox(
                      height: 60.0,
                      child: SfBarcodeGenerator(
                        value: 'John Doe',
                      ),
                    ),
                    const SpaceHeight(12.0),
                    const Center(
                      child: Text(
                        'CWB - 99',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SpaceHeight(12.0),
                    const Center(
                      child: Text(
                        'Thank You For Shopping With Us. Please Come Again',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    const Divider(),
                    const SpaceHeight(20.0),
                    Center(
                      child: Button.filled(
                        width: 250.0,
                        onPressed: () {},
                        label: 'Print Invoice',
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
