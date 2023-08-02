// ignore_for_file: prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:solardino/app/shared/widgets/autocomplete/autocomplete_entitie.dart';

import '../../responsive/constants.dart';

// ignore: must_be_immutable
class AutoCompleteWidget extends StatefulWidget {
  final getListaData;
  SuggestionSelectionCallback? onSelect;
  dynamic validator;

  TextEditingController controller = TextEditingController();

  AutoCompleteWidget({
    Key? key,
    required this.getListaData,
    this.validator,
    required this.controller,
    this.onSelect,
  }) : super(key: key);

  @override
  State<AutoCompleteWidget> createState() => _AutoCompleteWidgetState();
}

class _AutoCompleteWidgetState extends State<AutoCompleteWidget> {
  var _value = 'clique para selecionar...';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Container(
              //    child: TypeAheadField<AutoCompleteEntitie?>(
              child: TypeAheadFormField<AutoCompleteEntitie?>(
                  hideSuggestionsOnKeyboardHide: false,
                  textFieldConfiguration: TextFieldConfiguration(
                      decoration: InputDecoration(
                          fillColor: Colors.red,
                          hintText: _value,
                          hintStyle: Constants.textToFormFields),
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
                            'Nenhuma busca',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                  onSuggestionSelected: (AutoCompleteEntitie? suggestion) {
                    final data = suggestion!;
                    widget.onSelect!(suggestion);
                    print(suggestion.toString());

                    // ScaffoldMessenger.of(context)
                    //   ..removeCurrentSnackBar()
                    //   ..showSnackBar(SnackBar(
                    //     content: Text('Selected: ${data.item.toString()}'),
                    //   ));

                    setState(() {
                      widget.controller.text = '';
                      _value = data.item.toString();
                    });
                  },
                  onSaved: (value) => _value = _value,
                  validator: widget.validator),
            ),
            //
          ],
        ),
      ],
    );
  }
}
