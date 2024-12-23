import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../data/models/response/pos_response/orders_response_model.dart';
import '../blocs/order/order_bloc.dart';
import '../widgets/app_bar_pos_widget.dart';
import '../widgets/pagination_widget.dart';

class HistoryOrderPage extends StatefulWidget {
  const HistoryOrderPage({super.key});

  @override
  State<HistoryOrderPage> createState() => _HistoryOrderPageState();
}

class _HistoryOrderPageState extends State<HistoryOrderPage> {
  bool isEmptyData = false;

  final searchController = TextEditingController();
  late List<Order> searchResult;

  @override
  void initState() {
    //searchResult = departements;
    context.read<OrderBloc>().add(const OrderEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBarPosWidget(title: 'History Order'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: AppColors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: SearchInput(
                          controller: searchController,
                          hintText: 'Quick search..',
                          onChanged: (value) {
                            // searchResult = departements
                            //     .where((element) => element.departementName
                            //         .toLowerCase()
                            //         .contains(
                            //             searchController.text.toLowerCase()))
                            //     .toList();
                            // setState(() {});
                          },
                        ),
                      ),
                      const SpaceWidth(16.0),
                      // Button.filled(
                      //   onPressed: () => showDialog(
                      //     context: context,
                      //     builder: (context) => const AddNewDepartement(),
                      //   ),
                      //   label: 'Add New Departement',
                      //   fontSize: 14.0,
                      //   width: 250.0,
                      // ),
                    ],
                  ),
                ),
                BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      failed: (message) => Center(
                        child: Text(message),
                      ),
                      success: (order) {
                        if (order.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(70.0),
                            child: Center(
                              child: EmptyPlaceholder2(),
                            ),
                          );
                        } else {
                          return Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: DataTable(
                                        dataRowMinHeight: 30.0,
                                        dataRowMaxHeight: 60.0,
                                        columns: [
                                          DataColumn(
                                            label: SizedBox(
                                              height: 24.0,
                                              width: 24.0,
                                              child: Checkbox(
                                                value: false,
                                                onChanged: (value) {},
                                              ),
                                            ),
                                          ),
                                          const DataColumn(
                                              label: Text('Order Number')),
                                          const DataColumn(
                                              label: Text('Customer Note')),
                                          const DataColumn(
                                              label: Text('Status')),
                                        ],
                                        rows: order.isEmpty
                                            ? [
                                                const DataRow(
                                                  cells: [
                                                    DataCell(Row(
                                                      children: [
                                                        Icon(Icons
                                                            .highlight_off),
                                                        SpaceWidth(4.0),
                                                        Text(
                                                            'Data tidak ditemukan..'),
                                                      ],
                                                    )),
                                                    DataCell.empty,
                                                    DataCell.empty,
                                                    DataCell.empty,
                                                  ],
                                                ),
                                              ]
                                            : order
                                                .map(
                                                  (item) => DataRow(cells: [
                                                    DataCell(
                                                      SizedBox(
                                                        height: 24.0,
                                                        width: 24.0,
                                                        child: Checkbox(
                                                          value: false,
                                                          onChanged: (value) {},
                                                        ),
                                                      ),
                                                    ),
                                                    DataCell(Text(
                                                      item.orderNumber ?? '',
                                                      style: const TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    )),
                                                    DataCell(Text(
                                                        item.customerNote ??
                                                            '')),
                                                    DataCell(
                                                        Text(item.status ?? ''))
                                                    // DataCell(
                                                    //   Row(
                                                    //   children: [
                                                    //     IconButton(
                                                    //       onPressed: () =>
                                                    //           showDialog(
                                                    //               context:
                                                    //                   context,
                                                    //               builder:
                                                    //                   (context) {
                                                    //                 return BlocConsumer<
                                                    //                     DepartmentBloc,
                                                    //                     DepartmentState>(
                                                    //                   listener:
                                                    //                       (context,
                                                    //                           state) {
                                                    //                     state.maybeWhen(
                                                    //                         orElse: () {},
                                                    //                         failed: (message) {
                                                    //                           ScaffoldMessenger.of(context).showSnackBar(
                                                    //                             SnackBar(
                                                    //                               content: Text(message),
                                                    //                               backgroundColor: Colors.red,
                                                    //                             ),
                                                    //                           );
                                                    //                         },
                                                    //                         successDelete: (data) {
                                                    //                           context.pop();
                                                    //                         });
                                                    //                   },
                                                    //                   builder:
                                                    //                       (context,
                                                    //                           state) {
                                                    //                     return state
                                                    //                         .maybeWhen(
                                                    //                       orElse:
                                                    //                           () {
                                                    //                         return DeleteDialog(
                                                    //                           onConfirmTap:
                                                    //                               () {
                                                    //                             context.read<DepartmentBloc>().add(DepartmentEvent.delete(item.id!));
                                                    //                           },
                                                    //                         );
                                                    //                       },
                                                    //                     );
                                                    //                   },
                                                    //                 );
                                                    //               }),
                                                    //       icon: const Icon(Icons
                                                    //           .delete_outline),
                                                    //     ),
                                                    //     // IconButton(
                                                    //     //   onPressed: () =>
                                                    //     //       showDialog(
                                                    //     //     context: context,
                                                    //     //     builder: (context) =>
                                                    //     //         EditDepartement(
                                                    //     //       item: item,
                                                    //     //     ),
                                                    //     //   ),
                                                    //     //   icon: const Icon(Icons
                                                    //     //       .edit_outlined),
                                                    //     // ),
                                                    //   ],
                                                    // )),
                                                  ]),
                                                )
                                                .toList(),
                                      ),
                                    ),
                                  ),
                                  if (order.isNotEmpty)
                                    const Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: PaginationWidget(),
                                    ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
