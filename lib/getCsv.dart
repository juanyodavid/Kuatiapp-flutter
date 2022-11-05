import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_application_1/home_page.dart';

getCsv() async {
  if (await Permission.storage.request().isGranted) {
    String filename = "Evento" + DateTime.now().toString();
    String dir = (await getExternalStorageDirectory())!.path + "/$filename.csv";
    String file = "$dir";
    print("en el csv: ");
    print(animales);

    File f = new File(file);
    String csv = const ListToCsvConverter().convert(animales);
    f.writeAsString(csv);
  } else {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
  }
}
