import 'package:dart_mappable/dart_mappable.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class XFileToMultipartFileHook extends MappingHook {
  const XFileToMultipartFileHook();

  @override
  Object? beforeEncode(Object? value) {
    if (value is XFile) {
      return _multipartFromFile(value);
    }
    return value;
  }
}

MultipartFile _multipartFromFile(XFile file) {
  return MultipartFile.fromFileSync(
    file.path,
    filename: path.basename(file.path),
  );
}
