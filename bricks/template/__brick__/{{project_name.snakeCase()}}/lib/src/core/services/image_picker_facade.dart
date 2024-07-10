import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../exceptions/app_error_extension.dart';
import '../exceptions/app_exception.dart';

part 'image_picker_facade.g.dart';

enum PickSource {
  camera,
  gallery,
}

@Riverpod(keepAlive: true)
ImagePickerFacade imagePickerFacade(ImagePickerFacadeRef ref) {
  return ImagePickerFacade(
    imagePicker: ImagePicker(),
  );
}

class ImagePickerFacade {
  ImagePickerFacade({required this.imagePicker});

  final ImagePicker imagePicker;

  Future<XFile> pickImage({
    required PickSource pickSource,
    double? maxHeight,
    double? maxWidth,
  }) async {
    return localErrorHandler(
      () async {
        final pickedFile = await imagePicker.pickImage(
          source: pickSource == PickSource.camera ? ImageSource.camera : ImageSource.gallery,
          maxHeight: maxHeight,
          maxWidth: maxWidth,
        );
        if (pickedFile != null) {
          return pickedFile;
        } else {
          throw const LocalAppException(
            type: CacheExceptionType.cancelled,
            message: 'No image or video was picked',
          );
        }
      },
    );
  }

  Future<IList<XFile>> pickMultiImage({
    double? maxHeight,
    double? maxWidth,
  }) async {
    return localErrorHandler(
      () async {
        final pickedFile = await imagePicker.pickMultiImage(
          maxHeight: maxHeight,
          maxWidth: maxWidth,
        );
        if (pickedFile.isNotEmpty) {
          return pickedFile.toIList();
        } else {
          throw const LocalAppException(
            type: CacheExceptionType.cancelled,
            message: 'No image or video was picked',
          );
        }
      },
    );
  }
}

Future<T> localErrorHandler<T>(
  Future<T> Function() body, {
  Object Function(Object e)? errorMutator,
}) async {
  try {
    return await body.call();
  } catch (e, st) {
    final mutatedError = errorMutator?.call(e) ?? e;
    final error = mutatedError.localErrorToLocalException();
    throw Error.throwWithStackTrace(error, st);
  }
}
