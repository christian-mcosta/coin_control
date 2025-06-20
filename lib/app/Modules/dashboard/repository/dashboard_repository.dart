import 'package:coin_control/app/Modules/dashboard/dtos/dashboard_dto.dart';
import 'package:coin_control/app/Modules/dashboard/repository/dashboard_repository_interface.dart';
import 'package:coin_control/app/shared/database/remote_database.dart';
import 'package:coin_control/app/shared/dtos/base_dto.dart';
import 'package:coin_control/app/shared/repository/base_repository.dart';

class DashboardRepository extends BaseRepository<DashboardDto> implements IDashboardRepository {
  final RemoteDatabase _remoteDatabase;

  DashboardRepository(this._remoteDatabase) : super(_remoteDatabase);

  @override
  String get table => 'despesas';

  @override
  Future<List<DashboardDto>> getTransacoes(String mesSelecionado) async {
    if (mesSelecionado.isEmpty) {
      throw Exception('O mês selecionado não pode ser nulo');
    }

    final despesas = (await _remoteDatabase.client.from('despesas').select().eq('mes_vencimento', mesSelecionado)) ?? [];

    final receitas = (await _remoteDatabase.client.from('receitas').select().eq('mes_recebimento', mesSelecionado)) ?? [];

    print('Despesas retornadas: ${despesas.length}');
    print('Receitas retornadas: ${receitas.length}');

    final List<DashboardDto> transacoes = [
      ...despesas.map((map) => fromMap(map, true)),
      ...receitas.map((map) => fromMap(map, false)),
    ];

    return transacoes;
  }

  @override
  DashboardDto fromMap(Map<String, dynamic> map, bool isDespesa) {
    return DashboardDto(
      baseDto: BaseDto.fromMap(map),
      nome: map['nome'] ?? '',
      mes: map['mes_vencimento'] ?? map['mes_recebimento'] ?? '',
      valor: map['valor'] ?? 0.0,
      isDespesa: isDespesa,
    );
  }
}
