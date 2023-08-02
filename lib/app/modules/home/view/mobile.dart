import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<void> saveAndLaunchFIle(List<int> bytes, String fileName) async {
  final path = Platform.isAndroid
      ? (await getExternalStorageDirectory())?.path
      : (await getApplicationSupportDirectory()).path;
  final file = File('$path/$fileName');
  await file.writeAsBytes(bytes, flush: true);
  OpenFile.open('$path/$fileName');
}

// Directory directory = Platform.isAndroid
//     ? await getExternalStorageDirectory() //FOR ANDROID
//     : await getApplicationSupportDirectory(); //FOR iOS