// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/modules/home/store/home_store.dart';

import '../responsive/constants.dart';

import 'package:solardino/app/shared/credentials/token.dart';
import '../api/api.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class UploadWidget extends StatefulWidget {
  UploadWidget({super.key, this.onPressed, this.label, this.loading, this.id});

  final VoidCallback? onPressed;
  String? label;
  dynamic id;
  TextEditingController? idHidden;
  bool? loading;
  bool? loadingDelete;
  List<Map<String, String>>? r;

  Future uploadSelectedFile(objFile, idFile, tipo) async {
    //---Create http package multipart request object
    final request = http.MultipartRequest(
      "POST",
      Uri.parse('${Api().url}files'),
    );
    //-----add other fields if needed
    request.fields["categoria"] = idFile;

    request.fields["tipo"] = tipo;
    Map<String, String> headers = {"Authorization": "Bearer ${Token().token}"};
    request.headers.addAll(headers);
    //-----add selected file with request
    // ignore: unnecessary_new
    request.files.add(new http.MultipartFile(
        "file", objFile.readStream, objFile.size,
        filename: objFile.name));

    try {
      //-------Send request
      var resp = await request.send();
      //------Read response
      String result = await resp.stream.bytesToString();

      if (resp.statusCode != 200) {
        return null;
      }

      //-------Your response

      r = [
        {"arquivo": objFile.name},
        {"id": result}
      ];

      // id = result.toString();

      return r;
    } on Exception {
      return null;
//      _UploadWidgetState().setName(r);
    } catch (error) {
      return null;
    }
  }

  @override
  _UploadWidgetState createState() => _UploadWidgetState();
}

// ignore: deprecated_member_use
class _UploadWidgetState extends ModularState<UploadWidget, HomeStore> {
  @override
  void initState() {
    super.initState();
  }

  Future deleteFile() async {
    var idfile = widget.id;
    final url = Uri.parse('${Api().url}files/$idfile');
    final response = await http.delete(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token().token}',
    });

    if (response.statusCode == 200) {
      setState(() {
        widget.label = '';
      });
    } else {
      throw Exception();
    }
  }

  setName(dynamic r) {
    setState(() {
      widget.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Stack(
        children: [
          Row(
            children: [
              //  Text(widget.label.toString()),
              Text(
                widget.label.toString().length > 30
                    ? '${widget.label.toString().substring(0, 30)}...'
                    : widget.label.toString(),
              ),

              if (widget.label != '' &&
                  widget.label != 'Erro ao enviar arquivo!')
                widget.loadingDelete == true
                    ? Container(
                        margin: const EdgeInsets.only(left: 17, top: 2),
                        width: 15,
                        height: 15,
                        child: const CircularProgressIndicator(
                          color: Constants.corPrimaria,
                          strokeWidth: 1.3,
                        ))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            widget.loadingDelete = true;
                          });
                          deleteFile();
                        },
                        color: Constants.corPrimaria,
                        icon: const Icon(
                          Icons.delete_forever,
                          size: 25,
                        ),
                      ),

              const Spacer(),
              widget.loading == true
                  ? Container(
                      margin: const EdgeInsets.only(right: 10, top: 14),
                      width: 15,
                      height: 15,
                      child: const CircularProgressIndicator(
                        color: Constants.corPrimaria,
                        strokeWidth: 1.3,
                      ))
                  : IconButton(
                      onPressed: widget.onPressed,
                      icon: const Icon(
                        Icons.upload_rounded,
                        color: Constants.corPrimaria,
                        size: 30.0,
                      ))
            ],
          ),
          Stack(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Expanded(
                    child: Divider(
                  height: 2,
                  thickness: 1,
                  color: Colors.black38,
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
