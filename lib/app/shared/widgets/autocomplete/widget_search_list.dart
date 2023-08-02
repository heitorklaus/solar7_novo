import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:solardino/app/shared/responsive/constants.dart';
import 'package:solardino/app/shared/widgets/autocomplete/autocomplete_entitie.dart';
import 'package:solardino/app/shared/widgets/autocomplete/autocomplete_store.dart';

import '../forms/custom_text_field.dart';

// ignore: must_be_immutable
class WidgetSearchList extends StatefulWidget {
  ScrollController? scrollController;
  SuggestionSelectionCallback onSelect;
  ValueChanged<dynamic>? onChanged;
  final ValueChanged? onPressed;
  GestureTapCallback? onTap;
  final ValueChanged? onClickViewDetail;
  final ValueChanged? onChange;
  final controller = TextEditingController();

  final fieldKey = GlobalKey<FormFieldState>();

  dynamic lista;
  dynamic getListaFrom;
  dynamic getFromUpdate;

  static const String title = 'Autocomplete';
  WidgetSearchList(
      {super.key,
      this.scrollController,
      this.onChange,
      this.onTap,
      this.lista,
      this.onChanged,
      this.onPressed,
      this.getListaFrom,
      this.getFromUpdate,
      this.onClickViewDetail,
      required this.onSelect});

  @override
  State<WidgetSearchList> createState() => _WidgetSearchListState();
}

class _WidgetSearchListState extends State<WidgetSearchList> {
  final TextEditingController controller = TextEditingController();

  final AutocompleteStore listStore = AutocompleteStore();

  double variavel = 85;

  @override
  void initState() {
    super.initState();
    widget.getFromUpdate != null ? selecionaFrom(widget.getFromUpdate) : null;
  }

  selecionaFrom(List<dynamic>? valor) {
    for (var i = 0; i <= widget.getFromUpdate.length - 1; i++) {
      listStore.todoList
          .add(AutoCompleteEntitie(item: valor?[i].item, qtd: valor?[i].qtd));
    }

    variavel = (73 * listStore.todoList.length) + 115 / 2;
  }

  @override
  Widget build(BuildContext context) {
    //  selecionaFrom();
    return SizedBox(
      height: (variavel + listStore.todoList.length.toDouble()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Observer(
            builder: (_) {
              return Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 1.0, left: 5, right: 5),
                    child: CustomTextField(
                      keyboardType: TextInputType.number,
                      onTap: widget.onTap,
                      scrollController: widget.scrollController,
                      getListaData: widget.getListaFrom,
                      onSuggestionSelected: (a) {
                        var contain = listStore.todoList
                            .where((element) => element.item == a.item);

                        if (contain.isNotEmpty) {
                        } else {
                          widget.onSelect(a);

                          final data = a!;
                          //widget.onSuggestionSelected!(suggestion);

                          setState(() {
                            controller.text = data.item.toString();
                            listStore.setNewTodoTitle(data.item.toString());
                            listStore.setNewTodoId(data.id);
                            listStore
                                .setNewTodoValorDeCusto(data.valor_de_custo);
                          });
                          setState(() {
                            variavel += 56;
                          });
                          controller.text = '';
                          listStore.addTodo();
                          WidgetsBinding.instance
                              .addPostFrameCallback((_) => controller.clear());
                          widget.onSelect;
                        }
                      },
                    ),
                  )

                      // child: TextFormField(
                      //   controller: controller,
                      //   onChanged: listStore.setNewTodoTitle,
                      // ),
                      ),
                ],
              );
            },
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                var v = listStore.todoList.length;

                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: v,
                  itemBuilder: (_, index) {
                    final todo = listStore.todoList[index];
                    widget.lista = listStore.todoList;

                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          color: Constants.corPrimaria,
                          height: .2,
                        ),
                        Container(
                          color: (index % 2 == 0)
                              ? const Color.fromARGB(255, 247, 246, 246)
                              : const Color.fromARGB(255, 255, 255, 255),
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.only(left: 5, right: 5),
                            // onLongPress: () {
                            //   listStore.todoList.removeAt(index);
                            // },
                            title: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(left: 2),
                                    width: 50,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(0),
                                        backgroundColor: Constants.corPrimaria,
                                      ),
                                      onPressed: () {
                                        // RECEBE O VALOR DA QUANTIDADE ATUAL
                                        controller.text = listStore
                                            .todoList[index].qtd
                                            .toString();

                                        FocusNode textSecondFocusNode =
                                            FocusNode();

                                        controller.selection = TextSelection(
                                            baseOffset: 0,
                                            extentOffset:
                                                controller.text.length);

                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      textSecondFocusNode);
                                              return Center(
                                                child: Dialog(
                                                  child: SizedBox(
                                                    height: 200,
                                                    child: Column(
                                                      children: [
                                                        const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(
                                                                'Quantidade')),
                                                        SizedBox(
                                                          width: 100,
                                                          child: TextFormField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            focusNode:
                                                                textSecondFocusNode,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            controller:
                                                                controller,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 40,
                                                        ),
                                                        SizedBox(
                                                          width: 200,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(0),
                                                              backgroundColor:
                                                                  Constants
                                                                      .corPrimaria,
                                                            ),
                                                            child: const Text(
                                                                'Atualizar'),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).then((value) {
                                          setState(() {
                                            widget.onChange!(
                                                "{'${listStore.todoList[index].id}:${listStore.todoList[index].qtd}:${listStore.todoList[index].valor_de_custo}'/'${listStore.todoList[index].id}:${controller.text}:${listStore.todoList[index].valor_de_custo}'}");
                                            listStore.updateQtd(
                                                index, controller.text);
                                          });
                                        });
                                      },
                                      child: Text(listStore.todoList[index].qtd
                                              .toString()
                                          // child: TextFormField(
                                          //   keyboardType: TextInputType.number,
                                          //   initialValue: '1',
                                          //   decoration: InputDecoration(
                                          //       hintText: '1',
                                          //       contentPadding: const EdgeInsets
                                          //               .fromLTRB(5, 0, 5,
                                          //           0), // control your hints text size

                                          //       enabledBorder: OutlineInputBorder(
                                          //         borderRadius:
                                          //             BorderRadius.circular(3.0),
                                          //         borderSide: const BorderSide(
                                          //           color: Colors.black26,
                                          //           width: 1.0,
                                          //         ),
                                          //       ),
                                          //       filled: true,
                                          //       fillColor: Colors.white70),
                                          //   onChanged: (qtd) {
                                          //     // se qtd for VAZIO entao assume valor 1 ( SE APGAR O VALOR DA QTD DO INPUT ELE ASSUME 1)
                                          //     var quantidade =
                                          //         qtd == "" ? "1" : qtd.toString();
                                          //     // RETORNO A CHAMADA LA PRO COMPONENT PAI
                                          //     widget.onChanged!({index: quantidade});
                                          //     // Faz o UPDATE NA LISTA no STORE atualizando POSICAO e VALOR do INPUT
                                          //     listStore.updateQtd(index, quantidade);
                                          //   },
                                          // ),
                                          ),
                                    )),
                                SizedBox(
                                  width: 190,
                                  child: GestureDetector(
                                    onTap: () {
                                      widget.onClickViewDetail!(index);
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        todo.item.toString(),
                                        style: Constants.textUnderlineViewItens
                                            .copyWith(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 20,
                                    color: Constants.corPrimaria,
                                  ),
                                  onPressed: () {
                                    widget.onPressed!(index);
                                    setState(() {
                                      variavel -= 55;
                                    });

                                    setState(() {
                                      listStore.removeTodo(index);
                                      v--;
                                    });
                                  },
                                  // onPressed: () => widget.onPressed!(index),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: Constants.corPrimaria,
                          height: .2,
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       print(widget.listStore.todoList);
          //     },
          //     child: Text('Fim'))
        ],
      ),
    );
  }
}
