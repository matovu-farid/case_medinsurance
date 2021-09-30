import 'dart:io';
import 'dart:typed_data';

import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:image_picker/image_picker.dart';

abstract class FormSaver<T> extends Equatable {
  void saveData(InputFormEvent event);
  void reset();
  File? _file;
  Future saveDocument(AttachDocument event) async {
    late ImageSource source;
    if (event is AttachFromCamera)
      source = ImageSource.camera;
    else
      source = ImageSource.gallery;

    var xFile = await ImagePicker()
        .pickImage(source: source, maxHeight: 1080, maxWidth: 1920);
    if (xFile != null) {
      _file = File(xFile.path);
    }
  }

  File? get file => _file;

  T fetchInfo();
}
