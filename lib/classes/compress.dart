
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
class Compressor{
   Future<Uint8List?> testCompressFile(File file) async {
     
    var result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      
      
      quality: 90,
     
    );
    return result;
  }
}