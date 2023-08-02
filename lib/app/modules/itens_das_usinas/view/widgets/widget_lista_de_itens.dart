// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solardino/app/modules/home/store/home_store.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../../shared/database_settings/shared_pref_helper.dart';
import '../../../../shared/entities/Item/itemusina.dart';
import '../../../../shared/responsive/constants.dart';
import '../../../../shared/responsive/responsive_layout.dart';
import '../../store/itensDasUsinas_store.dart';

class WidgetListaDeItens extends StatefulWidget {
  WidgetListaDeItens({Key? key, String? valor}) : super(key: key);

  var valor;

  @override
  State<WidgetListaDeItens> createState() => _WidgetListaDeItens();
}

class _WidgetListaDeItens extends State<WidgetListaDeItens> {
  @override
  GlobalKey<RefreshIndicatorState>? _refreshIndicatorKey;
  final controller = Modular.get<ItensDasUsinasStore>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        centerTitle: false,
        leadingWidth: 0, // thi
        titleSpacing: 0.0,
        backgroundColor: Constants.corPrimaria,
        elevation: 0,
        title: Container(
          child: Container(
            width: double.infinity,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.category,
                  color: Constants.corSecundaria,
                  size: 24.0,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text("Listagem dos itens",
                    style: Constants.textCardTitle.copyWith(
                        color: Constants.corSecundaria, fontSize: 17)),
                const Spacer(),
                const SizedBox(
                  width: 7,
                ),
              ],
              //leading: Icon(Icons.shopping_basket),
            ),
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            if (ResponsiveLayout.isComputer(context))
              Container(
                color: Constants.corPrimaria,
                width: 50,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Constants.corSecundaria,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                    ),
                  ),
                ),
              ),
            Observer(builder: (BuildContext context) {
              List<ItemUsina>? list;
              list = controller.listaDeItens?.value;

              if (list == null) {
                return const Center(child: CircularProgressIndicator());
              } else if (list.isNotEmpty) {
                return RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        /// adding elements in list after [1 seconds] delay
                        /// to mimic network call
                        ///
                        /// Remember: setState is necessary so that
                        /// build method will run again otherwise
                        /// list will not show all elements
                        setState(() {
                          Modular.get<HomeStore>().getLista('');
                        });

                        // showing snackbar
                      },
                    );
                  },
                  key: _refreshIndicatorKey,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey.shade50,
                    ),
                    itemCount: list.length,
                    itemBuilder: (_, index) {
                      return Slidable(
                        // Specify a key if the Slidable is dismissible.
                        key: const ValueKey(0),

                        // The start action pane is the one at the left or the top side.
                        startActionPane: ActionPane(
                          // A motion is a widget used to control how the pane animates.
                          motion: const ScrollMotion(),

                          // A pane can dismiss the Slidable.
                          dismissible: DismissiblePane(onDismissed: () {}),

                          // All actions are defined in the children parameter.
                          children: const [
                            // A SlidableAction can have an icon and/or a label.
                            SlidableAction(
                              onPressed: doNothing,
                              backgroundColor: Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                            SlidableAction(
                              onPressed: doNothing,
                              backgroundColor: Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.share,
                              label: 'Share',
                            ),
                          ],
                        ),

                        // The end action pane is the one at the right or the bottom side.
                        endActionPane: const ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              // An action can be bigger than the others.
                              flex: 2,
                              onPressed: doNothing,
                              backgroundColor: Color(0xFF7BC043),
                              foregroundColor: Colors.white,
                              icon: Icons.archive,
                              label: 'Archive',
                            ),
                            SlidableAction(
                              onPressed: doNothing,
                              backgroundColor: Color(0xFF0392CF),
                              foregroundColor: Colors.white,
                              icon: Icons.save,
                              label: 'Save',
                            ),
                          ],
                        ),

                        // The child of the Slidable is what the user sees when the
                        // component is not dragged.
                        child: InkWell(
                          onTap: () {
                            Modular.to.pushNamed('/usinas', arguments: {
                              'id': '${list![index].id}'
                            }).then((value) {
                              // store.getLista('');
                            });
                          },
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    color: (index % 2 == 0)
                                        ? const Color.fromARGB(
                                            255, 232, 236, 237)
                                        : const Color.fromARGB(
                                            255, 248, 246, 246),
                                    padding: const EdgeInsets.only(
                                        left: 45,
                                        top: 15,
                                        bottom: 15,
                                        right: 1),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            AutoSizeText(
                                              '${list![index].item}',
                                              style: Constants.textListItens,
                                              minFontSize: 13,
                                              maxFontSize: 13,
                                              maxLines: 4,
                                            ),
                                          ],
                                        ),
                                        Wrap(
                                          children: [
                                            AutoSizeText(
                                              'Potência ${list![index].distribuidora!.item}  kWp',
                                              style: Constants.textListItens,
                                              minFontSize: 13,
                                              maxFontSize: 13,
                                              maxLines: 4,
                                            ),
                                            AutoSizeText(
                                              ' / Geração ${list![index].distribuidora!.item}  kWh',
                                              style: Constants.textListItens,
                                              minFontSize: 13,
                                              maxFontSize: 13,
                                              maxLines: 4,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.grey.shade200,
                                    width: double.infinity,
                                    height: 1,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 8, bottom: 10, top: 15),
                                    child: Column(
                                      children: [
                                        const CircleAvatar(
                                            radius: 13,
                                            child: Icon(
                                              Icons.border_all_rounded,
                                              size: 22.0,
                                            ),
                                            backgroundColor:
                                                Colors.transparent),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Center(
                      child: SvgPicture.asset(
                        'lib/app/shared/assets/images/search.svg',
                        height: 120,
                      ),
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
