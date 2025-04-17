import '../../domain/entities/empty_entity.dart';
import '../../domain/repositories/empty_repository.dart';
import '../datasources/empty_datasource.dart';
import '../models/empty_model.dart';

class EmptyRepositoryImpl implements EmptyRepository {
  final EmptyDataSource dataSource;

  EmptyRepositoryImpl({required this.dataSource});

  @override
  Future<EmptyEntity> getEmptyEntity() async {
    final emptyModel = await dataSource.getEmptyData();
    return emptyModel.toEntity();
  }
}