import 'package:coin_control/app/Modules/receitas/controller/receitas_controller.dart';
import 'package:coin_control/app/app_controller.dart';
import 'package:coin_control/app/shared/stores/base_store.dart';
import 'package:coin_control/app/shared/themes/fonts.dart';
import 'package:coin_control/app/shared/themes/page_theme_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uuid/uuid.dart';

class ReceitasPage extends StatefulWidget {
  const ReceitasPage({super.key});

  @override
  _ReceitasPageState createState() => _ReceitasPageState();
}

class _ReceitasPageState extends State<ReceitasPage> with PageThemeControl {
  final ReceitasController receitasController = Modular.get<ReceitasController>();
  final AppController appController = Modular.get<AppController>();

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController valorController = TextEditingController();

  bool isReceitaFixa = false;
  String? mesRecebimento;

  @override
  void initState() {
    super.initState();
    _loadDespesas();
  }

  Future<void> _loadDespesas() async {
    await receitasController.getAll();
  }

  Future<List<String>> _getMeses() async {
    return [
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro',
    ];
  }

  void _handleAddDespesa() async {
    if (_validateForm()) {
      final receita = receitasController.createReceitaStore(
        base: BaseStore(
          id: const Uuid().v4(),
          dataHoraCriado: DateTime.now(),
        ),
        nome: nomeController.text,
        valor: double.parse(valorController.text),
        mesRecebimento: mesRecebimento!,
        receitaFixa: isReceitaFixa,
      );
      await receitasController.insert(receita);
      _clearForm();
    } else {
      _showErrorDialog();
    }
  }

  bool _validateForm() {
    return nomeController.text.isNotEmpty && valorController.text.isNotEmpty && double.tryParse(valorController.text) != null && mesRecebimento != null;
  }

  void _clearForm() {
    nomeController.clear();
    valorController.clear();
    setState(() {
      isReceitaFixa = false;
      mesRecebimento = null;
    });
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Dados inválidos'),
        content: const Text('Por favor, preencha todos os campos corretamente.'),
        actions: [
          TextButton(
            onPressed: () => Modular.to.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cadastro de Receitas'),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Modular.to.navigate('/dashboard');
            }),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Receita Fixa:',
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  activeColor: Theme.of(context).primaryColorDark,
                  value: isReceitaFixa,
                  onChanged: (value) {
                    setState(() {
                      isReceitaFixa = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: valorController,
              decoration: const InputDecoration(
                labelText: 'Valor',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (double.tryParse(value) == null && value.isNotEmpty) {
                  valorController.clear();
                  _showInvalidValueDialog();
                }
              },
            ),
            const SizedBox(height: 10),
            FutureBuilder<List<String>>(
              future: _getMeses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erro: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return const Text('Nenhum dado disponível');
                }

                final meses = snapshot.data!;
                return DropdownButtonFormField<String>(
                  isExpanded: true,
                  menuMaxHeight: 200,
                  value: mesRecebimento,
                  hint: Text(mesRecebimento ?? 'Selecione o Mês de Recebimento'),
                  style: TextStyle(
                    color: isReceitaFixa
                        ? Theme.of(context).disabledColor
                        : Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                  items: meses.map((mes) {
                    return DropdownMenuItem<String>(
                      value: mes,
                      child: Text(mes),
                    );
                  }).toList(),
                  onChanged: isReceitaFixa
                      ? null
                      : (String? newValue) {
                    setState(() {
                      mesRecebimento = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    enabled: !isReceitaFixa,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: theme.colorScheme.surface,
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: POPPINS_FONT,
                  )),
              onPressed: _handleAddDespesa,
              child: const Text(
                'Adicionar Receita',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Observer(
              builder: (_) {
                if (receitasController.receitas.isEmpty) {
                  return const Center(child: Text('Nenhuma despesa cadastrada.'));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: receitasController.receitas.length,
                  itemBuilder: (context, index) {
                    final receita = receitasController.receitas[index];
                    return ListTile(
                      title: Text(receita.nome ?? 'Indefinido'),
                      subtitle: Text('Valor: ${receita.valor.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await receitasController.delete(receita.base.id);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showInvalidValueDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Valor inválido'),
        content: const Text('Por favor, insira um valor numérico válido.'),
        actions: [
          TextButton(
            onPressed: () => Modular.to.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
