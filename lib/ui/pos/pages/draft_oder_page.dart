import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../blocs/draft_order/draft_order_bloc.dart';
import '../dialogs/edit_draft_order.dart';
import '../widgets/app_bar_pos_widget.dart';
import '../widgets/pagination_widget.dart';

class DraftOrderPage extends StatefulWidget {
  const DraftOrderPage({super.key});

  @override
  State<DraftOrderPage> createState() => _DraftOrderPageState();
}

class _DraftOrderPageState extends State<DraftOrderPage> {
  bool isEmptyData = false;

  final searchController = TextEditingController();
  late List<DraftOrderPage> searchResult;

  @override
  void initState() {
    //searchResult = departements;
    context.read<DraftOrderBloc>().add(const DraftOrderEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBarPosWidget(title: 'Draft Order'),
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
                BlocBuilder<DraftOrderBloc, DraftOrderState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      failed: (message) => Center(
                        child: Text(message),
                      ),
                      success: (data) {
                        final draftOrder = data.data ?? [];
                        if (draftOrder.isEmpty) {
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
                                          const DataColumn(
                                              label: Text('Action')),
                                        ],
                                        rows: draftOrder.isEmpty
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
                                            : draftOrder
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
                                                    DataCell(Text(
                                                        item.status ?? '')),
                                                    DataCell(
                                                      IconButton(
                                                        onPressed: () =>
                                                            showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              EditDraftOrder(
                                                            item: item,
                                                          ),
                                                        ),
                                                        icon: const Icon(Icons
                                                            .edit_outlined),
                                                      ),
                                                    ),
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
                                  if (draftOrder.isNotEmpty)
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
