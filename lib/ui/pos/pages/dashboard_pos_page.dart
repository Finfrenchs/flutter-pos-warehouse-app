import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../data/models/response/inventory_response/product_response_model.dart';
import '../../../data/models/response/pos_response/customers_response_model.dart';
import '../blocs/checkout/checkout_bloc.dart';
import '../blocs/customer/customer_bloc.dart';
import '../blocs/product/product_bloc.dart';
import '../dialogs/add_new_customer.dart';
import '../dialogs/delete_dialog.dart';
import '../dialogs/order_payment_dialog.dart';
import '../widgets/app_bar_pos_widget.dart';
import '../widgets/menu_card.dart';
import '../widgets/product_pos_card.dart';

enum EndDrawerState { payNow, addNewCustomer, none }

class DashboardPosPage extends StatefulWidget {
  const DashboardPosPage({super.key});

  @override
  State<DashboardPosPage> createState() => _DashboardPosPageState();
}

class _DashboardPosPageState extends State<DashboardPosPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();
  // final walkInCustomers = ['Opsi A', 'Opsi B'];
  final orderTax = ['PPN (10%)', 'PPN (20%)'];
  final discounts = ['0', 10000.currencyFormatRp];
  List<Product> searchResult = [];

  Customer? selectedCustomer;

  @override
  void initState() {
    //searchResult = posProducts;
    context.read<CustomerBloc>().add(const CustomerEvent.fetch());
    context.read<ProductBloc>().add(const ProductEvent.getProducts());
    super.initState();
  }

  EndDrawerState endDrawerState = EndDrawerState.none;

  Widget endDrawerWidget(EndDrawerState state) {
    if (state == EndDrawerState.payNow) {
      return OrderPaymentDialog(
        userId: selectedCustomer?.id ?? 0,
      );
    } else if (state == EndDrawerState.addNewCustomer) {
      return const AddNewCustomer();
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: endDrawerWidget(endDrawerState),
        backgroundColor: AppColors.background,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBarPosWidget(title: 'CWBPOS POINTHUB'),
        ),
        body: Row(
          children: [
            Expanded(
              child: Scaffold(
                body: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    Card(
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child:
                                      BlocBuilder<CustomerBloc, CustomerState>(
                                    builder: (context, state) {
                                      return state.maybeWhen(orElse: () {
                                        return CustomDropdown<Customer>(
                                          value: selectedCustomer,
                                          items: const [],
                                          label: 'Walk In Customer',
                                          showLabel: false,
                                        );
                                      }, success: (data) {
                                        return CustomDropdown<Customer>(
                                          value: selectedCustomer,
                                          items: data,
                                          label: 'Walk In Customer',
                                          showLabel: false,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedCustomer = value;
                                            });
                                          },
                                        );
                                      });
                                    },
                                  ),
                                ),
                                const SpaceWidth(12.0),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    endDrawerState =
                                        EndDrawerState.addNewCustomer;
                                    setState(() {});
                                    _scaffoldKey.currentState!.openEndDrawer();
                                  },
                                  icon: Assets.icons.addRounded.svg(),
                                ),
                              ],
                            ),
                            const SpaceHeight(10.0),
                            SearchInput(
                              controller: searchController,
                              hintText: 'Quick search..',
                              onChanged: (value) {
                                // searchResult = products
                                //     .where((element) => element.name
                                //         .toLowerCase()
                                //         .contains(searchController.text
                                //             .toLowerCase()))
                                //     .toList();
                                // setState(() {});
                                //             context
                                // .read<ProductBloc>()
                                // .add(ProductEvent.searchProducts(value));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SpaceHeight(16.0),
                    Card(
                      color: AppColors.white,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        scrollDirection: Axis.horizontal,
                        child: BlocBuilder<CheckoutBloc, CheckoutState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => const SizedBox.shrink(),
                              success: (products, totalQuantity, totalPrice) {
                                return DataTable(
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
                                    const DataColumn(label: Text('Product')),
                                    const DataColumn(label: Text('Quantity')),
                                    const DataColumn(label: Text('Subtotal')),
                                    const DataColumn(label: Text('Action')),
                                  ],
                                  rows: products.isEmpty
                                      ? [
                                          const DataRow(
                                            cells: [
                                              DataCell(Row(
                                                children: [
                                                  Icon(Icons.highlight_off),
                                                  SpaceWidth(4.0),
                                                  Text(
                                                      'Data tidak ditemukan..'),
                                                ],
                                              )),
                                              DataCell.empty,
                                              DataCell.empty,
                                              DataCell.empty,
                                              DataCell.empty,
                                            ],
                                          ),
                                        ]
                                      : products
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
                                              DataCell(Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    item.product.name ?? '',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(item.product.brand
                                                          ?.name ??
                                                      ''),
                                                ],
                                              )),
                                              DataCell(Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      context
                                                          .read<CheckoutBloc>()
                                                          .add(CheckoutEvent
                                                              .removeCheckout(
                                                                  item.product));
                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .remove_circle_outline,
                                                      color: AppColors.primary,
                                                    ),
                                                  ),
                                                  Text('${item.quantity}'),
                                                  InkWell(
                                                    onTap: () {
                                                      context
                                                          .read<CheckoutBloc>()
                                                          .add(CheckoutEvent
                                                              .addCheckout(item
                                                                  .product));
                                                    },
                                                    child: const Icon(
                                                      Icons.add_circle_outline,
                                                      color: AppColors.primary,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                              DataCell(
                                                Text(
                                                  ((item.product.price ?? 0) *
                                                          (item.quantity))
                                                      .currencyFormatRpIdn(),
                                                ),
                                              ),
                                              DataCell(Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () => showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          DeleteDialog(
                                                        onConfirmTap: () {},
                                                      ),
                                                    ),
                                                    icon: const Icon(
                                                        Icons.delete_outline),
                                                  ),
                                                  // IconButton(
                                                  //   onPressed: () => showDialog(
                                                  //     context: context,
                                                  //     builder: (context) =>
                                                  //         EditProduct(
                                                  //       item: item,
                                                  //       onConfirmTap: () {},
                                                  //     ),
                                                  //   ),
                                                  //   icon: const Icon(
                                                  //       Icons.edit_outlined),
                                                  // ),
                                                ],
                                              )),
                                            ]),
                                          )
                                          .toList(),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      success: (products, totalQuantity, totalPrice) {
                        return Card(
                          color: AppColors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: CustomDropdown(
                                        value: orderTax.first,
                                        items: orderTax,
                                        label: 'Order Tax',
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    const SpaceWidth(16.0),
                                    Flexible(
                                      child: CustomDropdown(
                                        value: discounts.first,
                                        items: discounts,
                                        label: 'Discount',
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(height: 2.0),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: Assets.icons.grandTotal.svg(),
                                        title: Text(
                                            'Grand Total : ${totalPrice.currencyFormatRp}'),
                                        subtitle: Text(
                                            'Tax : ${10850000.currencyFormatRp}   Discount : ${0.currencyFormatRp}'),
                                      ),
                                    ),
                                    const SpaceWidth(16.0),
                                    Flexible(
                                      flex: 1,
                                      child: Button.filled(
                                        onPressed: () {
                                          endDrawerState =
                                              EndDrawerState.payNow;
                                          setState(() {});
                                          _scaffoldKey.currentState!
                                              .openEndDrawer();
                                        },
                                        label: 'Pay Now',
                                      ),
                                    ),
                                    const SpaceWidth(8.0),
                                    Flexible(
                                      flex: 1,
                                      child: Button.outlined(
                                        onPressed: () {},
                                        label: 'Reset',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MenuCard(
                              imagePath: Assets.images.menu.allProduct.path,
                              title: 'All product',
                            ),
                            const SpaceWidth(16.0),
                            MenuCard(
                              imagePath: Assets.images.menu.electronic.path,
                              title: 'Electronic',
                            ),
                            const SpaceWidth(16.0),
                            MenuCard(
                              imagePath: Assets.images.menu.furniture.path,
                              title: 'Furniture',
                            ),
                            const SpaceWidth(16.0),
                            MenuCard(
                              imagePath: Assets.images.menu.fashion.path,
                              title: 'Fashion',
                            ),
                            const SpaceWidth(16.0),
                            MenuCard(
                              imagePath: Assets.images.menu.headphone.path,
                              title: 'Headphone',
                            ),
                            const SpaceWidth(16.0),
                            MenuCard(
                              imagePath: Assets.images.menu.grocery.path,
                              title: 'Grocery',
                            ),
                            const SpaceWidth(16.0),
                            MenuCard(
                              imagePath: Assets.images.menu.mineral.path,
                              title: 'Mineral W',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SpaceHeight(16.0),
                    Expanded(
                      child: SingleChildScrollView(
                        child: BlocBuilder<ProductBloc, ProductState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => const SizedBox(),
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              loaded: (products) {
                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 12.0,
                                    mainAxisSpacing: 20.0,
                                    childAspectRatio: 9 / 12,
                                  ),
                                  itemCount: products.length,
                                  itemBuilder: (context, index) =>
                                      ProductPosCard(
                                    item: products[index],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
