import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../assets/assets.dart';
import '../constants/colors.dart';
import '../core.dart';
import 'spaces.dart';

class CustomImagePicker extends StatefulWidget {
  final String label;
  final void Function(XFile? imagePath) onChanged;
  final String? imageUrl;
  final bool showLabel;
  final double borderRadius;

  const CustomImagePicker({
    super.key,
    required this.label,
    required this.onChanged,
    this.imageUrl,
    this.showLabel = true,
    this.borderRadius = 18.0,
  });

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  XFile? _image;

  Future<void> _choosePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      widget.onChanged(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabel) ...[
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SpaceHeight(12.0),
        ],
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: AppColors.stroke),
          ),
          child: InkWell(
            onTap: _choosePhoto,
            child: Center(
              child: _image != null
                  ? Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(12.0),
                          width: 65.0,
                          height: 65.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius),
                            border: Border.all(color: AppColors.stroke),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius),
                            child: Image.file(
                              File(_image!.path),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => setState(() {
                            _image = null;
                            widget.onChanged(null);
                          }),
                          icon: const Icon(Icons.cancel),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: widget.imageUrl != null
                            ? CachedNetworkImage(
                                imageUrl:
                                    '${Variables.baseUrl}/storage/${widget.imageUrl}',
                                height: 65.0,
                                width: 65.0,
                                fit: BoxFit.cover,
                              )
                            : Assets.icons.imagePlaceholder.svg(height: 65.0),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
