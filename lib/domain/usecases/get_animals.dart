import 'package:equatable/equatable.dart';
import '../entities/animal.dart';
import '../repositories/content_repository.dart';

class GetAnimals extends Equatable {
  final ContentRepository contentRepository;

  const GetAnimals(this.contentRepository);

  Future<List<Animal>> execute() async {
    return await contentRepository.getAnimals();
  }

  @override
  List<Object?> get props => [contentRepository];
}