import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:solardino/app/shared/responsive/constants.dart';

import '../autocomplete/autocomplete_entitie.dart';

class CustomTextField extends StatefulWidget {
  // CustomTextField(
  //     {required this.hint,
  //     this.prefix,
  //     this.getListaData,
  //     this.suffix,
  //     this.obscure = false,
  //     this.textInputType,
  //     this.onChanged,
  //     this.dica,
  //     this.enabled,
  //     this.controller});

  // final TextEditingController? controller;

  // final String? hint;
  // dynamic getListaData;
  // final Widget? prefix;
  // final Widget? suffix;
  // String? dica;
  // final bool obscure;
  // final TextInputType? textInputType;
  // final Function(String)? onChanged;
  // final bool? enabled;

  dynamic getListaData;
  final ScrollController? scrollController;

  String? dica;
  final String? label;
  final String? hintText;
  ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextStyle? styleDisable;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final bool? autofocus;
  final bool? readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final bool? obscureText;
  final bool? autocorrect;
  final bool? autovalidate;
  final bool? maxLengthEnforced;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final int? maxLength;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double? cursorWidth;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets? scrollPadding;
  final bool? enableInteractiveSelection;
  final InputCounterWidgetBuilder? buildCounter;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? icon;
  final SuggestionSelectionCallback onSuggestionSelected;
  CustomTextField({
    Key? key,
    this.scrollController,
    this.getListaData,
    this.dica,
    this.label,
    this.hintText,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.styleDisable,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.obscureText = false,
    this.autocorrect = true,
    this.autovalidate = false,
    this.maxLengthEnforced = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.buildCounter,
    this.prefixIcon,
    this.suffixIcon,
    this.icon,
    required this.onSuggestionSelected,
  }) : super(
          key: key,
        );

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  var focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(
    //     shape: BoxShape.rectangle,
    //     color: Colors.grey[200],
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   padding: prefix != null ? null : const EdgeInsets.only(left: 16),
    //   child: TextField(
    //     controller: controller,
    //     obscureText: obscure,
    //     keyboardType: textInputType,
    //     onChanged: onChanged,
    //     enabled: enabled,
    //     decoration: InputDecoration(
    //       hintText: hint,
    //       border: InputBorder.none,
    //       prefixIcon: prefix,
    //       suffixIcon: suffix,
    //     ),
    //     textAlignVertical: TextAlignVertical.center,
    //   ),
    // );

    return Container(
        child: TypeAheadField<AutoCompleteEntitie?>(
            scrollController: widget.scrollController,
            hideSuggestionsOnKeyboardHide: false,
            textFieldConfiguration: TextFieldConfiguration(
                style: TextStyle(fontWeight: FontWeight.bold),
                onTap: () {
                  widget.onTap!();
                  print('TESTE');
                },
                onChanged: (a) {},
                focusNode: focusNode,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 1.0),
                  fillColor: Colors.red,
                  hintText: 'Adicione itens para usina',
                  hintStyle: Constants.textToFormFields.copyWith(fontSize: 12),
                ),
                controller: widget.controller),
            suggestionsBoxDecoration: SuggestionsBoxDecoration(
                color: Colors.white,
                elevation: 0,
                //  color: Colors.white,
                shape: Border.all(width: 0, color: Colors.black)),
            suggestionsCallback: widget.getListaData,
            itemBuilder: (context, AutoCompleteEntitie? suggestion) {
              final data = suggestion!;

              return ListTile(
                  title: Text(
                data.item.toString(),
              ));
            },
            noItemsFoundBuilder: (context) => Container(
                  height: 100,
                  child: const Center(
                    child: Text(
                      'Nenhuma busca.',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
            onSuggestionSelected: widget.onSuggestionSelected));
  }
}
