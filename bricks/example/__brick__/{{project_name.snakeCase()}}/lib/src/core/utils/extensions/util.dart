import 'dart:io';

import 'package:image_picker/image_picker.dart';

extension FileX on XFile {
  File toFile() => File(path);
}
