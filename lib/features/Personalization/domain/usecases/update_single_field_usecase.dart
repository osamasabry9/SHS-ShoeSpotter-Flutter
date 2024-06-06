import '../repositories/personalization_repository.dart';

class UpdateSingleFieldUseCase {
  final PersonalizationRepository repository;

  UpdateSingleFieldUseCase({required this.repository});

  Future<void> call(Map<String, dynamic> jsonField) async {
    return await repository.updateSingleField(jsonField);
  }
}