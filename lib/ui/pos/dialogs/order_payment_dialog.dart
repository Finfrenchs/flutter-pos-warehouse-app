// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../data/models/request/pos_request/draft_order_request_model.dart';
import '../../../data/models/request/pos_request/order_request_model.dart';
import '../blocs/checkout/checkout_bloc.dart';
import '../blocs/draft_order/draft_order_bloc.dart';
import '../blocs/order/order_bloc.dart';
import 'print_invoice_preview_dialog.dart';

class OrderPaymentDialog extends StatefulWidget {
  final int userId;
  const OrderPaymentDialog({
    super.key,
    required this.userId,
  });

  @override
  State<OrderPaymentDialog> createState() => _OrderPaymentDialogState();
}

class _OrderPaymentDialogState extends State<OrderPaymentDialog> {
  bool isAddNewPayment = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500.0,
      child: Card(
        color: AppColors.background,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Payment',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SpaceHeight(4.0),
                      Text(
                        'Walk In Customer',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  if (!isAddNewPayment)
                    InkWell(
                      onTap: () {
                        isAddNewPayment = true;
                        setState(() {});
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.add_circle),
                            SpaceWidth(8.0),
                            Text('Add New Payment'),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              const SpaceHeight(20.0),
              if (isAddNewPayment)
                _AddNewPayment(
                  onAddTap: () {
                    isAddNewPayment = false;
                    setState(() {});
                  },
                )
              else
                Expanded(
                    child: OrderPaymentContent(
                  userId: widget.userId,
                )),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderPaymentContent extends StatefulWidget {
  final int userId;
  const OrderPaymentContent({
    super.key,
    required this.userId,
  });

  @override
  State<OrderPaymentContent> createState() => _OrderPaymentContentState();
}

class _OrderPaymentContentState extends State<OrderPaymentContent> {
  final paymentMethods = ['Cash', 'Transfer'];

  final orderNumberController = TextEditingController();
  final paymentModeController = TextEditingController(text: 'Cash');
  final customerNotesController = TextEditingController();

  @override
  void dispose() {
    orderNumberController.dispose();
    paymentModeController.dispose();
    customerNotesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          success: (products, totalQuantity, totalPrice) {
            return ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final data = products[index];
                    return Card(
                      color: AppColors.white,
                      child: ListTile(
                        leading: ClipOval(
                          child: ColoredBox(
                            color: AppColors.primary,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                index.toString(),
                                style: const TextStyle(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        title: Text(data.product.name ?? ''),
                        subtitle: Text(data.quantity.toString()),
                        trailing: Text(
                          ((data.product.price ?? 0) * (data.quantity))
                              .currencyFormatRpIdn(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SpaceHeight(10.0),
                CustomTextField(
                  controller: orderNumberController,
                  label: 'Enter order number',
                  hintText: 'Please Enter number',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
                const SpaceHeight(12.0),
                CustomDropdown(
                  value: paymentModeController.text,
                  items: paymentMethods,
                  label: 'Payment Type',
                  onChanged: (value) {
                    paymentModeController.text = value ?? '';
                    setState(() {});
                  },
                ),
                const SpaceHeight(12.0),
                CustomTextField(
                  controller: customerNotesController,
                  label: 'Enter a customer notes...',
                  hintText: 'Customer Notes',
                  maxLines: 5,
                ),
                const SpaceHeight(10.0),
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text('Grand Total'),
                            const Spacer(),
                            Text(totalPrice.currencyFormatRp),
                          ],
                        ),
                        const SpaceHeight(16.0),
                        Row(
                          children: [
                            const Text('Tax (PPN 10%)'),
                            const Spacer(),
                            Text(123000.currencyFormatRp),
                          ],
                        ),
                        const SpaceHeight(16.0),
                        BlocConsumer<OrderBloc, OrderState>(
                          listener: (context, state) {
                            state.maybeWhen(
                              orElse: () {},
                              successAdd: (data) {
                                context.pop();
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      PrintInvoicePreviewOrderDialog(
                                    order: data.data!,
                                  ),
                                );
                              },
                              failed: (message) {
                                print(message);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: AppColors.red,
                                    content: Text(message),
                                  ),
                                );
                              },
                            );
                          },
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () {
                                return Button.filled(
                                  onPressed: () {
                                    context.read<OrderBloc>().add(
                                          OrderEvent.doOrder(
                                            userId: widget.userId,
                                            customerNote:
                                                customerNotesController.text,
                                            orderNumber:
                                                orderNumberController.text,
                                            total: totalPrice,
                                            status: "paid",
                                            paymentStatus: "paid",
                                            paymentType:
                                                paymentModeController.text,
                                            items: products
                                                .map((e) => OrderItemModel(
                                                    productId: e.product.id,
                                                    quantity: e.quantity,
                                                    price: e.product.price,
                                                    total: totalPrice))
                                                .toList(),
                                          ),
                                        );
                                  },
                                  label: 'Complete Order',
                                );
                              },
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ),
                        const SpaceHeight(10.0),
                        const Text('OR'),
                        const SpaceHeight(10.0),
                        BlocConsumer<DraftOrderBloc, DraftOrderState>(
                          listener: (context, state) {
                            state.maybeWhen(
                              orElse: () {},
                              successCu: (data) {
                                context.pop();
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      PrintInvoicePreviewDraftDialog(
                                    id: data.data!.id!,
                                  ),
                                );
                                context
                                    .read<CheckoutBloc>()
                                    .add(const CheckoutEvent.started());
                              },
                              failed: (message) {
                                print(message);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: AppColors.red,
                                    content: Text(message),
                                  ),
                                );
                              },
                            );
                          },
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () {
                                return Button.filled(
                                  onPressed: () {
                                    context.read<DraftOrderBloc>().add(
                                          DraftOrderEvent.addDraft(
                                            userId: widget.userId,
                                            customerNote:
                                                customerNotesController.text,
                                            orderNumber:
                                                orderNumberController.text,
                                            total: totalPrice,
                                            status: "draft",
                                            paymentStatus: "unpaid",
                                            paymentType:
                                                paymentModeController.text,
                                            items: products
                                                .map((e) => DraftOrderItemModel(
                                                    productId: e.product.id,
                                                    quantity: e.quantity,
                                                    price: e.product.price,
                                                    total: totalPrice))
                                                .toList(),
                                          ),
                                        );
                                  },
                                  label: 'Pay Later',
                                );
                              },
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _AddNewPayment extends StatefulWidget {
  final VoidCallback onAddTap;

  const _AddNewPayment({
    required this.onAddTap,
  });

  @override
  State<_AddNewPayment> createState() => _AddNewPaymentState();
}

class _AddNewPaymentState extends State<_AddNewPayment> {
  final paymentMethods = ['Cash', 'Transfer'];

  final payingAmountController = TextEditingController();
  final paymentModeController = TextEditingController(text: 'Cash');
  final notesController = TextEditingController();

  @override
  void dispose() {
    payingAmountController.dispose();
    paymentModeController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: payingAmountController,
          label: 'Enter a paying amount',
          hintText: 'Please Enter Name',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
        ),
        const SpaceHeight(12.0),
        CustomDropdown(
          value: paymentModeController.text,
          items: paymentMethods,
          label: 'Payment Mode',
          onChanged: (value) {
            paymentModeController.text = value ?? '';
            setState(() {});
          },
        ),
        const SpaceHeight(12.0),
        CustomTextField(
          controller: notesController,
          label: 'Enter a notes...',
          hintText: 'Notes',
          maxLines: 5,
        ),
        const SpaceHeight(36.0),
        Button.filled(
          onPressed: widget.onAddTap,
          label: 'Add',
        ),
      ],
    );
  }
}
