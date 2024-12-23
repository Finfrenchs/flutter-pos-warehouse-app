import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../data/models/response/pos_response/draft_orders_response_model.dart';
import '../blocs/draft_order/draft_order_bloc.dart';
import 'print_invoice_preview_dialog.dart';

class EditDraftOrder extends StatefulWidget {
  final DraftOrder item;
  const EditDraftOrder({
    super.key,
    required this.item,
  });

  @override
  State<EditDraftOrder> createState() => _EditDraftOrderState();
}

class _EditDraftOrderState extends State<EditDraftOrder> {
  late final TextEditingController paymentStatusController;
  late final TextEditingController statusController;

  final paymentStatus = ['unpaid', 'paid'];
  final status = ['draft', 'paid'];

  @override
  void initState() {
    paymentStatusController =
        TextEditingController(text: widget.item.paymentStatus);
    statusController = TextEditingController(text: widget.item.status);
    super.initState();
  }

  @override
  void dispose() {
    paymentStatusController.dispose();
    statusController.dispose();
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
                const Text(
                  'Edit Draft Order',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(24.0),
                CustomDropdown(
                  value: statusController.text,
                  items: status,
                  label: 'Status Order',
                  onChanged: (value) {
                    statusController.text = value ?? '';
                    setState(() {});
                  },
                ),
                const SpaceHeight(12.0),
                CustomDropdown(
                  value: paymentStatusController.text,
                  items: paymentStatus,
                  label: 'Payment Status Order',
                  onChanged: (value) {
                    paymentStatusController.text = value ?? '';
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
                      child: BlocConsumer<DraftOrderBloc, DraftOrderState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () {},
                            failed: (message) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(message),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            },
                            successCu: (data) {
                              context.pop();

                              showDialog(
                                context: context,
                                builder: (context) =>
                                    PrintInvoicePreviewDraftDialog(
                                  id: data.data!.id!,
                                ),
                              );
                              context.read<DraftOrderBloc>().add(
                                    const DraftOrderEvent.fetch(),
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
                                        DraftOrderEvent.editDraft(
                                          id: widget.item.id!,
                                          status: statusController.text,
                                          paymentStatus:
                                              paymentStatusController.text,
                                        ),
                                      );
                                },
                                label: 'Complate Order',
                              );
                            },
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
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
