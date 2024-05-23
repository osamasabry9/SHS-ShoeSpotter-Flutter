import 'package:image_picker/image_picker.dart';

import '../repositories/personalization_repository.dart';

class UploadImageUseCase {
  final PersonalizationRepository repository;

  UploadImageUseCase({required this.repository});

  Future<String> call({required String path, required XFile image}) async {
    return await repository.uploadImage(path, image);
  }
}
