import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    required this.label,
    this.maxLines,
    this.maxLength,
    required this.onSaved,
    this.validator,
  });
  final String label;
  final int? maxLines;
  final int? maxLength;

  final void Function(String?) onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Gap(10),
        Container(
          height: maxLines == null ? null : 150,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(20)),
          child: SingleChildScrollView(
            controller: scrollController,
            child: TextFormField(
              maxLines: maxLines,
              maxLength: maxLength,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              onSaved: onSaved,
              validator: validator,
            ),
          ),
        ),
      ],
    );
  }
}
