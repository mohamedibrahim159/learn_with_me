import 'package:equatable/equatable.dart';
import '../entities/color.dart';
import '../repositories/content_repository.dart';

class GetColors extends Equatable {
  final ContentRepository contentRepository;

  const GetColors(this.contentRepository);

  Future<List<Color>> execute() async {
    return await contentRepository.getColors();
  }

  @override
  List<Object?> get props => [contentRepository];
}