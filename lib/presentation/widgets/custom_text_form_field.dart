part of 'widgets.dart';

class CustomTextFormField<T> extends StatelessWidget {
  final double? height;
  final String? initialValue;
  final FocusNode? focusNode;
  final bool hasAutoFocus;
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle textFormFieldStyle;
  final TextStyle labelTextStyle;
  final TextStyle hintTextStyle;
  final BorderStyle borderStyle;
  final double borderRadius;
  final double borderWidth;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final String? prefixIconImagePath;
  final String? labelText;
  final bool labelTextInOutside;
  final String? hintText;
  final Color prefixIconColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color fillColor;
  final bool filled;
  final bool obscured;
  final bool hasPrefixIcon;
  final bool hasSuffixIcon;
  final bool isDense;
  final int maxLines;
  final int? maxLength;
  final VoidCallback? onTap;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final String? errorText;
  final Widget? suffixIconWidget;
  final bool enableInteractiveSelection;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final bool autocorrect;
  final InputBorder? errorBorder;
  // start for dropdown
  final bool isDropdown;
  final List<T?>? dropdownOptions;
  final T? dropdownValue;
  final String? Function(T?)? dropdownDisplayFunc;
  final void Function(T?)? onDropdownChanged;

  const CustomTextFormField({
    Key? key,
    this.height = 100,
    this.initialValue,
    this.focusNode,
    this.hasAutoFocus = false,
    this.readOnly = false,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.controller,
    this.hasPrefixIcon = false,
    this.hasSuffixIcon = false,
    this.isDense = false,
    this.prefixIconImagePath,
    this.maxLines = 1,
    this.maxLength,
    this.textFormFieldStyle = normalTextStyle,
    this.labelTextStyle = normalTextStyle,
    this.hintTextStyle = normalTextStyle,
    this.borderStyle = BorderStyle.none,
    this.borderRadius = 12.0,
    this.borderWidth = 0.0,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.labelText,
    this.labelTextInOutside = false,
    this.hintText,
    this.prefixIconColor = Colors.white,
    this.borderColor = kBlackColor,
    this.focusedBorderColor = kGreyColorLight,
    this.enabledBorderColor = kPrimaryColor,
    this.fillColor = kFillColor,
    this.filled = true,
    this.obscured = false,
    this.onTap,
    this.onFieldSubmitted,
    this.onChanged,
    this.errorText,
    this.suffixIconWidget,
    this.enableInteractiveSelection = true,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.autocorrect = false,
    this.errorBorder,
    // start for dropdown
    this.isDropdown = false,
    this.dropdownOptions,
    this.dropdownValue,
    this.dropdownDisplayFunc,
    this.onDropdownChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(
      labelText: labelTextInOutside ? null : labelText,
      labelStyle: labelTextInOutside ? null : labelTextStyle,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
          color: borderColor,
          width: borderWidth,
          style: borderStyle,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
          color: Colors.green,
          width: borderWidth,
          style: borderStyle,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
          color: focusedBorderColor,
          width: borderWidth,
          style: borderStyle,
        ),
      ),
      errorBorder: errorBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      prefixIcon: hasPrefixIcon
          ? Padding(
              padding:
                  const EdgeInsets.only(top: 15, left: 5, right: 0, bottom: 15),
              child: SizedBox(
                height: 4,
                child: Image.asset(prefixIconImagePath!),
              ),
            )
          : null,
      hintText: hintText,
      hintStyle: hintTextStyle,
      filled: filled,
      fillColor: fillColor,
      errorText: errorText,
      errorStyle: TextStyle(height: 1.w / 4),
      suffixIcon: hasSuffixIcon ? suffixIconWidget : null,
      isDense: isDense,
    );
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelTextInOutside == true && labelText != null)
            Padding(
              padding: EdgeInsets.only(bottom: 1.h),
              child: Text(
                labelText!,
                style: labelTextStyle,
              ),
            ),
          (isDropdown)
              ? DropdownButtonFormField<T>(
                  value: dropdownValue,
                  onChanged: onDropdownChanged,
                  items: [null, ...dropdownOptions!].map((T? value) {
                    return DropdownMenuItem<T>(
                      value: value,
                      child: value == null
                          ? const Text('Pilih salah satu')
                          : Text(dropdownDisplayFunc!(value) ?? ''),
                    );
                  }).toList(),
                  decoration: decoration,
                )
              : TextFormField(
                  initialValue: initialValue,
                  keyboardType: keyboardType,
                  enableInteractiveSelection: enableInteractiveSelection,
                  focusNode: focusNode,
                  textInputAction: textInputAction,
                  textCapitalization: textCapitalization,
                  autofocus: hasAutoFocus,
                  autocorrect: autocorrect,
                  readOnly: readOnly,
                  controller: controller,
                  onTap: onTap,
                  onChanged: onChanged,
                  onFieldSubmitted: onFieldSubmitted,
                  style: textFormFieldStyle,
                  maxLines: maxLines,
                  maxLength: maxLength,
                  validator: validator,
                  decoration: decoration,
                  obscureText: obscured,
                ),
        ],
      ),
    );
  }
}
