import 'package:equatable/equatable.dart';
import '../entities/number.dart';
import '../repositories/content_repository.dart';

class GetNumbers extends Equatable {
  final ContentRepository contentRepository;

  const GetNumbers(this.contentRepository);

  List<Number> execute() {
    return contentRepository.getNumbers();
  }
  
  @override
  List<Object?> get props => [contentRepository];
}