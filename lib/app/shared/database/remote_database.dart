import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteDatabase {
  final SupabaseClient _client;

  RemoteDatabase(this._client);

  SupabaseClient get client => _client;

  // Método para executar uma consulta direta ao banco de dados
  Future<List<Map<String, dynamic>>> query(String tableName) async {
    try {
      final response = await _client.from(tableName).select().order('id');

      return List<Map<String, dynamic>>.from(response);
    } on PostgrestException catch (error, StackTrace) {
      throw Exception('Erro ao executar consulta:  ${error.code}, ${error.message}, $StackTrace');
    }
  }

  // Método para executar uma consulta por id ao banco de dados
  Future<Map<String, dynamic>?> queryById(String tableName, {required String id}) async {
    try {
      final response = await _client.from(tableName).select().eq('id', id).single();
      return Map<String, dynamic>.from(response);
    } on PostgrestException catch (error, StackTrace) {
      throw Exception('Erro ao executar consulta por id:  ${error.code}, ${error.message}, $StackTrace');
    }
  }
  // Método para inserir dados

  Future<void> insert(String tableName, Map<String, dynamic> data) async {
    try {
      await _client.from(tableName).insert(data);
    } on PostgrestException catch (error, StackTrace) {
      throw Exception('Erro ao inserir dados:  ${error.code}, ${error.message}, $StackTrace');
    }
  }

  // Método para modificar dados
  Future<void> update(String tableName, Map<String, dynamic> data) async {
    try {
      await _client.from(tableName).update(data);
    } on PostgrestException catch (error, StackTrace) {
      throw Exception('Erro ao atualizar dados:  ${error.code}, ${error.message}, $StackTrace');
    }
  }

  // Método para deletar dados
  Future<void> delete(String tableName, {required String id}) async {
    try {
      await _client.from(tableName).update({'data_hora_deletado': DateTime.now().toIso8601String()}).eq('id', id);
    } on PostgrestException catch (error, StackTrace) {
      throw Exception('Erro ao deletar dados:  ${error.code}, ${error.message}, $StackTrace');
    }
  }

}