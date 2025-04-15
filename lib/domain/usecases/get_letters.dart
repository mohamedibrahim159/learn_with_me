import 'package:equatable/equatable.dart';
import '../entities/letter.dart';
import '../repositories/content_repository.dart';

class GetLetters extends Equatable {
  final ContentRepository contentRepository;

  const GetLetters(this.contentRepository);

  List<Letter> execute() {
    return contentRepository.getLetters();
  }

  @override
  List<Object?> get props => [contentRepository];
}