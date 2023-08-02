import 'dart:io';

import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solardino/app/shared/credentials/token.dart';
import 'package:solardino/app/shared/upload/upload.dart';
import 'package:solardino/app/shared/upload/upload_widget.dart';
import '../api/api.dart';
import '../responsive/constants.dart';
import '../widgets/autocomplete/autocomplete_service.dart';
import '../widgets/autocomplete/autocomplete_widget.dart';
import '../dialog/dialogClass.dart' as solardinoDialog;
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

class DialogClass extends StatefulWidget {
  String? dialogType;
  dynamic listItensAdd;
  dynamic message;

  DialogClass({Key? key, this.dialogType, this.listItensAdd, this.message})
      : super(key: key);

  @override
  State<DialogClass> createState() => _DialogClassState();
}

class _DialogClassState extends State<DialogClass> {
  dynamic? objFile;
  late bool loading = false;
  var nameFile = '';
  var idFile;

  fileSelect(tipo) async {
    setState(() {
      nameFile = '';
    });
    var result = await FilePicker.platform.pickFiles(
      withReadStream: true,
    );
    if (result != null) {
      String timestamp = DateTime.now().millisecondsSinceEpoch.toString() +
          result.files.single.toString();

      var content = Utf8Encoder().convert(timestamp.toString());
      var md5 = crypto.md5;
      var digest = md5.convert(content);

      setState(() {
        objFile = result.files.single;
        idFile = hex.encode(digest.bytes);
        loading = true;
      });
    }

    UploadWidget().uploadSelectedFile(objFile, idFile, tipo).then((value) {
      setState(() {
        nameFile =
            value == null ? 'Erro ao enviar arquivo!' : value[0]["arquivo"];
        loading = false;
      });
    });
  }

  Widget dialogContent(BuildContext context, dialogType, message) {
    return SingleChildScrollView(
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(
                  top: 4.0,
                ),
                margin: EdgeInsets.only(top: 1.0, right: 8.0),
                child: retornaWidget(context, dialogType, message)),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Positioned(
                right: 0.0,
                child: Container(
                  child: Container(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 10, top: 0),
                      child: Icon(Icons.close, size: 15, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column formUpload(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
            child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: SvgPicture.asset(
            'lib/app/shared/assets/images/logodino.svg',
            height: 25,
          ),
        ) //
            ),
        SizedBox(height: 3.0),
        InkWell(
          child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          // AutoCompleteWidget(
                          //   getListaData:
                          //       AutoCompleteService.getTipoDeInversor,
                          // ),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_box_rounded,
                                color: Constants.corPrimaria,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          'Potência do inversor',
                          textAlign: TextAlign.left,
                          style: Constants.textToFormFieldsINPUT,
                        ),
                      ),
                      TextFormField(
                        onChanged: (value) => {},

                        onTap: () {},
                        //autofocus: true,
                        style: Constants.textToFormFields,
                        // controller: controller.codigoInputController,
                        onFieldSubmitted: (v) {},
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(top: 30),
                        child: const Text(
                          'Datasheet',
                          textAlign: TextAlign.left,
                          style: Constants.textToFormFieldsINPUT,
                        ),
                      ),
                      UploadWidget(
                        label: nameFile,
                        id: idFile,
                        loading: loading,
                        onPressed: () {
                          fileSelect('datasheet');
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        child: Container(
                            padding: EdgeInsets.only(left: 100, right: 100),
                            child: Text('Avançar')),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Constants.corPrimaria,
                            textStyle: Constants.textToFormFieldsINPUT),
                      ),
                    ],
                  ),
                ),
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Column detailIten(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
            child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: SvgPicture.asset(
            'lib/app/shared/assets/images/logodino.svg',
            height: 25,
          ),
        ) //
            ),
        SizedBox(height: 3.0),
        InkWell(
          child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          widget.listItensAdd.item,
                          textAlign: TextAlign.left,
                          style: Constants.textToFormFieldsINPUT,
                        ),
                      ),
                      Image.network(
                          'http://192.168.15.75:8091/api/files/KLAUSAMESMATOP')
                    ],
                  ),
                ),
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Column exceptionLoadError(BuildContext context, message) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 3.0),
        InkWell(
          child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Oops! Deu algo errado!',
                        style: Constants.textCardTitle
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Center(
                          child: SvgPicture.asset(
                            'lib/app/shared/assets/images/undraw_cancel_re_pkdm.svg',
                            height: 180,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
                        child: SingleChildScrollView(
                          child: Text(
                            '${message}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        width: 320,
                        child: ElevatedButton(
                          child: Text('Fechar e Tentar Novamente'),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Modular.to.pushNamed('/home');
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Constants.corPrimaria,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 15),
                              textStyle: Constants.textToFormFieldsINPUT),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Modular.to.pushNamed('/home');
          },
        ),
      ],
    );
  }

  Column exceptionPostError(BuildContext context, message) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 3.0),
        InkWell(
          child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Oops! Deu algo errado com o cadastro!',
                        style: Constants.textCardTitle
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Center(
                          child: SvgPicture.asset(
                            'lib/app/shared/assets/images/undraw_cancel_re_pkdm.svg',
                            height: 150,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${message}',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        width: 320,
                        child: ElevatedButton(
                          child: Text('Fechar e Tentar Novamente'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Constants.corPrimaria,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 15),
                              textStyle: Constants.textToFormFieldsINPUT),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Column formularioInvalidoDaUsina(BuildContext context, String message) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 3.0),
        InkWell(
          child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Eita! \n Este cadastro é inválido...',
                        style: Constants.textCardTitle
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Você precisa preencher corretamente!',
                        style: Constants.textCardTitle.copyWith(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Center(
                          child: SvgPicture.asset(
                            'lib/app/shared/assets/images/pre.svg',
                            height: 150,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '$message',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        width: 320,
                        child: ElevatedButton(
                          child: Text('Fechar e Tentar Novamente'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Constants.corPrimaria,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 15),
                              textStyle: Constants.textToFormFieldsINPUT),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Column sucessPostInsert(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 3.0),
        InkWell(
          child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Uhuuuu! Usina Cadastrada!',
                        style: Constants.textCardTitle
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '',
                        style: Constants.textCardTitle.copyWith(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Center(
                          child: SvgPicture.asset(
                            'lib/app/shared/assets/images/sucess.svg',
                            height: 200,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 39,
                      ),
                      Container(
                        child: ElevatedButton(
                          child: Container(child: Text('Novo cadastro...')),
                          onPressed: () {
                            var value = 'novoCadastro';
                            Navigator.pop(context, value); //
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(185, 10),
                              primary: Constants.corPrimaria,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 15),
                              textStyle: Constants.textToFormFieldsINPUT),
                        ),
                      ),
                      SizedBox(
                        height: 39,
                      ),
                      Container(
                        child: ElevatedButton(
                          child: Container(child: Text('Voltar')),
                          onPressed: () {
                            var value = 'irParaInicio';
                            Navigator.pop(context, value); //
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(185, 10),
                              primary: Constants.corPrimaria,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 15),
                              textStyle: Constants.textToFormFieldsINPUT),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Column sucessPostUpdated(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 3.0),
        InkWell(
          child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Uhuuuu! Usina Alteradaa!',
                        style: Constants.textCardTitle
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '',
                        style: Constants.textCardTitle.copyWith(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Center(
                          child: SvgPicture.asset(
                            'lib/app/shared/assets/images/sucess.svg',
                            height: 200,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 39,
                      ),
                      Container(
                        child: ElevatedButton(
                          child: Container(child: Text('Voltar')),
                          onPressed: () {
                            var value = 'irParaInicio';
                            Navigator.pop(context, value); //
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(185, 10),
                              primary: Constants.corPrimaria,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 15),
                              textStyle: Constants.textToFormFieldsINPUT),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Column loaderWindow(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        // The loading indicator
        CircularProgressIndicator(),
        SizedBox(
          height: 15,
        ),
        // Some text
        Text('Loading...')
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.dialogType);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: solardinoDialog.Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: dialogContent(context, widget.dialogType, widget.message),
        ),
      ),
    );
  }

  retornaWidget(BuildContext context, dialogType, message) {
    if (dialogType == 'Inveror') {
      return formUpload(context);
    }
    if (dialogType == 'sucessPostUpdated') {
      return sucessPostUpdated(context);
    }

    if (dialogType == 'viewDetailIten') {
      return detailIten(context);
    }

    if (dialogType == 'exceptionPostError') {
      return exceptionPostError(context, message);
    }

    if (dialogType == 'exceptionLoadError') {
      return exceptionLoadError(context, message);
    }

    if (dialogType == 'sucessPostInsert') {
      return sucessPostInsert(context);
    }

    if (dialogType == 'loaderWindow') {
      return loaderWindow(context);
    }
    if (dialogType == 'formularioInvalidoDaUsina') {
      return formularioInvalidoDaUsina(context, message);
    }
  }
}
