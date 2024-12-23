import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/custom_image_picker.dart';
import '../../../core/core.dart';
import '../../../data/models/request/pos_request/customer_request_model.dart';
import '../blocs/customer/customer_bloc.dart';

class AddNewCustomer extends StatefulWidget {
  const AddNewCustomer({super.key});

  @override
  State<AddNewCustomer> createState() => _AddNewCustomerState();
}

class _AddNewCustomerState extends State<AddNewCustomer> {
  final statuses = ['Enable', 'Disable'];

  late final TextEditingController profileImageController;
  late final TextEditingController addressController;
  late final TextEditingController nameController;
  late final TextEditingController emailAddressController;
  late final TextEditingController passwordController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController statusController;
  late final TextEditingController taxNumberController;
  late final TextEditingController openingBalanceController;

  @override
  void initState() {
    profileImageController = TextEditingController();
    addressController = TextEditingController();
    nameController = TextEditingController();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();
    statusController = TextEditingController(text: statuses.first);
    taxNumberController = TextEditingController();
    openingBalanceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    profileImageController.dispose();
    addressController.dispose();
    nameController.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    statusController.dispose();
    taxNumberController.dispose();
    openingBalanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.deviceWidth - 600.0,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add New Customer',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SpaceHeight(4.0),
                Text(
                  'Please Complete Add New Customer',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SpaceHeight(16.0),
                Divider(),
              ],
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            CustomImagePicker(
              label: 'Profile Image',
              onChanged: (imagePath) =>
                  profileImageController.text = imagePath.toString(),
            ),
            const SpaceHeight(16.0),

            CustomTextField(
              controller: nameController,
              label: 'Name',
              hintText: 'Please Enter Name',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            const SpaceHeight(16.0),
            CustomTextField(
              controller: emailAddressController,
              label: 'Email Address',
              hintText: 'Please Enter Email Address',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
            ),
            const SpaceHeight(16.0),
            // CustomTextField(
            //   controller: passwordController,
            //   label: 'Password',
            //   hintText: 'Please Enter Password',
            //   textInputAction: TextInputAction.next,
            //   keyboardType: TextInputType.text,
            //   obscureText: true,
            // ),
            // const SpaceHeight(16.0),
            CustomTextField(
              controller: addressController,
              label: 'Address',
              hintText: 'Please Enter Address',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            const SpaceHeight(16.0),
            Row(
              children: [
                Flexible(
                  child: CustomTextField(
                    controller: phoneNumberController,
                    label: 'Phone Number',
                    hintText: 'Please Enter Phone Number',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SpaceWidth(16.0),
                // Flexible(
                //   child: CustomDropdown(
                //     value: statusController.text,
                //     items: statuses,
                //     label: 'Status',
                //     onChanged: (value) {
                //       statusController.text = value ?? '';
                //       setState(() {});
                //     },
                //   ),
                // ),
              ],
            ),
            const SpaceHeight(16.0),
            // Row(
            //   children: [
            //     Flexible(
            //       child: CustomTextField(
            //         controller: taxNumberController,
            //         label: 'Tax Number',
            //         hintText: 'Please Enter Tax Number',
            //         textInputAction: TextInputAction.next,
            //         keyboardType: TextInputType.number,
            //       ),
            //     ),
            //     const SpaceWidth(16.0),
            //     Flexible(
            //       child: CustomTextField(
            //         controller: openingBalanceController,
            //         label: 'Opening Balance',
            //         hintText: 'Please Enter Opening Balance',
            //         keyboardType: TextInputType.number,
            //         prefixIcon: const SizedBox(
            //           width: 50.0,
            //           child: Center(child: Text('Rp')),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              const SpaceHeight(16.0),
              Row(
                children: [
                  const Spacer(),
                  Flexible(
                    child: Button.outlined(
                      onPressed: () => context.pop(),
                      label: 'Cancel',
                    ),
                  ),
                  const SpaceWidth(16.0),
                  Flexible(
                    child: BlocListener<CustomerBloc, CustomerState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          successAdd: (data) {
                            context.pop();

                            context
                                .read<CustomerBloc>()
                                .add(const CustomerEvent.fetch());
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
                      child: Button.filled(
                        onPressed: () {
                          final dataReq = CustomerRequestModel(
                            name: nameController.text,
                            email: emailAddressController.text,
                            phone: phoneNumberController.text,
                            address: addressController.text,
                          );
                          context
                              .read<CustomerBloc>()
                              .add(CustomerEvent.add(dataReq));
                        },
                        label: 'Create',
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
