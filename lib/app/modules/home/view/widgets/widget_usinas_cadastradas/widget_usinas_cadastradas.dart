// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solardino/app/modules/home/store/home_store.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:solardino/app/shared/entities/usinas/usinas.dart';

import '../../../../../shared/database_settings/shared_pref_helper.dart';
import '../../../../../shared/entities/usinas/usinas_to_post.dart';
import '../../../../../shared/responsive/constants.dart';
import '../../../../../shared/responsive/responsive_layout.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class WidgetUsinasCadastradas extends StatefulWidget {
  WidgetUsinasCadastradas({Key? key, String? valor}) : super(key: key);

  var valor;

  @override
  State<WidgetUsinasCadastradas> createState() =>
      _WidgetUsinasCadastradasState();
}

class _WidgetUsinasCadastradasState
    extends ModularState<WidgetUsinasCadastradas, HomeStore> {
  @override
  GlobalKey<RefreshIndicatorState>? _refreshIndicatorKey;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        centerTitle: false,
        leadingWidth: 0, // thi
        titleSpacing: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          child: Container(
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.monitor,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 24.0,
                ),
                SizedBox(
                  width: 7,
                ),
                Text("Usinas e Produtos",
                    style: Constants.textCardTitle
                        .copyWith(color: Constants.corPrimaria, fontSize: 17)),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    if (kIsWeb) {
                      Modular.to.pushNamed('/usinas');
                    } else {
                      gotoCadastro();
                    }
                  },
                  child: Text('Novo'),
                  style: ElevatedButton.styleFrom(
                    primary: Constants.corPrimaria,
                  ),
                ),
                SizedBox(
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
            // if (ResponsiveLayout.isComputer(context))
            //   Container(
            //     color: Constants.corPrimaria,
            //     width: 50,
            //     child: Container(
            //       decoration: const BoxDecoration(
            //         color: Constants.corSecundaria,
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(6),
            //         ),
            //       ),
            //     ),
            //   ),
            Observer(builder: (BuildContext context) {
              List<UsinasToPost>? list;
              list = controller.lista?.value;

              if (list == null) {
                return const Center(child: CircularProgressIndicator());
              } else if (list.isNotEmpty) {
                return RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(
                      Duration(seconds: 1),
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
                              controller.getLista('');
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
                                        ? Color.fromARGB(255, 232, 236, 237)
                                        : Color.fromARGB(255, 248, 246, 246),
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
                                              '${list![index].alias}',
                                              style: Constants.textListItens,
                                              minFontSize: 13,
                                              maxFontSize: 13,
                                              maxLines: 4,
                                            ),
                                          ],
                                        ),
                                        if (list![index].potencia_do_sistema !=
                                            0.0)
                                          Wrap(
                                            children: [
                                              AutoSizeText(
                                                'Potência ${list![index].potencia_do_sistema}  kWp',
                                                style: Constants.textListItens,
                                                minFontSize: 13,
                                                maxFontSize: 13,
                                                maxLines: 4,
                                              ),
                                              AutoSizeText(
                                                ' / Geração ${list![index].geracao_em_kilowatts}  kWh',
                                                style: Constants.textListItens,
                                                minFontSize: 13,
                                                maxFontSize: 13,
                                                maxLines: 4,
                                              ),
                                            ],
                                          )
                                        else
                                          Wrap(
                                            children: [
                                              AutoSizeText(
                                                'Produto sem Módulos 0.0 kWp',
                                                style: Constants.textListItens,
                                                minFontSize: 13,
                                                maxFontSize: 13,
                                                maxLines: 4,
                                              ),
                                              AutoSizeText(
                                                ' / Geração 0 kWh',
                                                style: Constants.textListItens,
                                                minFontSize: 13,
                                                maxFontSize: 13,
                                                maxLines: 4,
                                              ),
                                            ],
                                          ),
                                        if (list![index]
                                                .idPlacasolar
                                                ?.potencia !=
                                            null)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${list![index].quantidadeDeModulos} Módulos de ${list![index].idPlacasolar?.potencia} Watts',
                                                style: Constants.textCardTitle
                                                    .copyWith(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Criada em ${list![index].data_hora_criacao?.dia}/${list![index].data_hora_criacao?.mes}/${list![index].data_hora_criacao?.ano} ',
                                              style: Constants.textCardTitle
                                                  .copyWith(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
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
                                        if (list![index].potencia_do_sistema !=
                                            0.0)
                                          CircleAvatar(
                                              radius: 13,
                                              child: const Icon(
                                                Icons.border_all_rounded,
                                                size: 22.0,
                                              ),
                                              backgroundColor:
                                                  Colors.transparent),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        if (list![index].potencia_do_sistema !=
                                            0.0)
                                          CircleAvatar(
                                              radius: 13,
                                              child: const Icon(
                                                Icons.bolt_sharp,
                                                size: 22.0,
                                              ),
                                              backgroundColor:
                                                  Colors.transparent)
                                        else
                                          CircleAvatar(
                                              radius: 13,
                                              child: const Icon(
                                                Icons.feed,
                                                size: 22.0,
                                              ),
                                              backgroundColor:
                                                  Colors.transparent),
                                      ],
                                    ),
                                  ),
                                  // Container(
                                  //   padding: EdgeInsets.only(
                                  //       top: 25,
                                  //       bottom: 10,
                                  //       right: 12),
                                  //   child: CircleAvatar(
                                  //       radius: 17,
                                  //       child: list[index]
                                  //                   .tipo_inversor ==
                                  //               'MICROINVERSOR'
                                  //           ? Icon(
                                  //               Icons.smart_screen,
                                  //               size: 17.0,
                                  //             )
                                  //           : Icon(
                                  //               Icons.video_label,
                                  //               size: 17.0,
                                  //             ),
                                  //       backgroundColor: Constants
                                  //           .backgroundAvatarCircle),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                      // return Stack(
                      //   children: [
                      //     Column(
                      //       mainAxisAlignment:
                      //           MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Container(
                      //           padding: EdgeInsets.only(
                      //               left: 60,
                      //               top: 25,
                      //               bottom: 10,
                      //               right: 55),
                      //           child: Column(
                      //             children: [
                      //               AutoSizeText(
                      //                 '(${list![index].potencia_do_sistema} kWp) - ${list[index].inversor} - ${list[index].modulo} - ${list[index].numero_de_modulo} (módulos)',
                      //                 style:
                      //                     Constants.textListItens,
                      //                 minFontSize: 13,
                      //                 maxFontSize: 13,
                      //                 maxLines: 4,
                      //               ),
                      //               SizedBox(
                      //                 height: 4,
                      //               ),
                      //               Row(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.start,
                      //                 children: [
                      //                   Text(
                      //                     '22/10/2022',
                      //                     style: Constants
                      //                         .textCardTitle
                      //                         .copyWith(
                      //                             fontSize: 13,
                      //                             fontWeight:
                      //                                 FontWeight
                      //                                     .bold),
                      //                   ),
                      //                   Text(
                      //                     ' - João Afonso Gomes',
                      //                     style: Constants
                      //                         .textCardTitle
                      //                         .copyWith(
                      //                             fontSize: 13,
                      //                             fontWeight:
                      //                                 FontWeight
                      //                                     .bold),
                      //                   ),
                      //                 ],
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //         Divider(
                      //           color: Colors.white,
                      //           thickness: 0.1,
                      //         ),
                      //       ],
                      //     ),
                      //     Row(
                      //       mainAxisAlignment:
                      //           MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Container(
                      //           padding: EdgeInsets.only(
                      //               left: 15,
                      //               top: 25,
                      //               bottom: 10),
                      //           child: CircleAvatar(
                      //               radius: 17,
                      //               child: list[index]
                      //                           .tipo_inversor ==
                      //                       'MICROINVERSOR'
                      //                   ? Icon(
                      //                       Icons.smart_screen,
                      //                       size: 17.0,
                      //                     )
                      //                   : Icon(
                      //                       Icons.video_label,
                      //                       size: 17.0,
                      //                     ),
                      //               backgroundColor: Constants
                      //                   .backgroundAvatarCircle),
                      //         ),
                      //         Container(
                      //           padding: EdgeInsets.only(
                      //               top: 25,
                      //               bottom: 10,
                      //               right: 12),
                      //           child: CircleAvatar(
                      //               radius: 17,
                      //               child: list[index]
                      //                           .tipo_inversor ==
                      //                       'MICROINVERSOR'
                      //                   ? Icon(
                      //                       Icons.smart_screen,
                      //                       size: 17.0,
                      //                     )
                      //                   : Icon(
                      //                       Icons.video_label,
                      //                       size: 17.0,
                      //                     ),
                      //               backgroundColor: Constants
                      //                   .backgroundAvatarCircle),
                      //         ),
                      //       ],
                      //     ),
                      //     if (index > 0)
                      //       Divider(
                      //         color: Colors.white,
                      //         thickness: 0.1,
                      //       ),
                      //   ],
                      // );
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

  gotoCadastro() {
    Modular.to.pushNamed('/usinas').then((value) {
      if (value == 'irParaInicio') {
        controller.getLista('');
      }
      if (value == 'novoCadastro') {
        controller.getLista('');
        gotoCadastro();
      }
    });
  }
}

void doNothing(BuildContext context) {}
