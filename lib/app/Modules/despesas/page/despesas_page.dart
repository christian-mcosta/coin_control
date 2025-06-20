import 'package:coin_control/app/Modules/despesas/controller/despesas_controller.dart';
import 'package:coin_control/app/Modules/despesas/stores/despesas_store.dart';
import 'package:coin_control/app/app_controller.dart';
import 'package:coin_control/app/shared/stores/base_store.dart';
import 'package:coin_control/app/shared/themes/fonts.dart';
import 'package:coin_control/app/shared/themes/page_theme_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:uuid/uuid.dart';

class DespesasPage extends StatefulWidget {
  const DespesasPage({super.key});

  @override
  _DespesasPageState createState() => _DespesasPageState();
}

class _DespesasPageState extends State<DespesasPage> with PageThemeControl {
  final DespesasController despesasController = Modular.get<DespesasController>();
  final AppController appController = Modular.get<AppController>();

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController valorController = TextEditingController();
  final TextEditingController parcelasController = TextEditingController();

  bool isDespesaFixa = false;
  String? mesVencimento;

  @override
  void initState() {
    super.initState();
    _loadDespesas();
  }

  Future<void> _loadDespesas() async {
    await despesasController.getAll();
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

  bool _validateForm() {
    return nomeController.text.isNotEmpty && valorController.text.isNotEmpty && mesVencimento != null;
  }

  void _handleAddDespesa() async {
    if (_validateForm()) {
      final despesa = DespesasStore(
        base: BaseStore(
          id: const Uuid().v4(),
          dataHoraCriado: DateTime.now(),
        ),
        nome: nomeController.text,
        valor: double.tryParse(toNumericString(valorController.text, allowPeriod: false)) != null ? double.parse(toNumericString(valorController.text, allowPeriod: false)) / 100 : 0.0,
        mesVencimento: mesVencimento!,
        despesaFixa: isDespesaFixa,
        quantidadeParcelas: isDespesaFixa ? int.parse(parcelasController.text) : null,
      );
      await despesasController.insert(despesa);
      _clearForm();
    } else {
      _showErrorDialog();
    }
  }

  void _clearForm() {
    nomeController.clear();
    valorController.clear();
    parcelasController.clear();
    setState(() {
      isDespesaFixa = false;
      mesVencimento = null;
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

  void _onValueChanged(String value) {
    final numericValue = toNumericString(value, allowPeriod: false);

    if (numericValue.isEmpty) {
      setState(() {
        valorController.text = '';
        valorController.selection = const TextSelection.collapsed(offset: 0);
      });
      return;
    }

    if (numericValue.length < 3) {
      setState(() {
        valorController.text = 'R\$ $numericValue';
        valorController.selection = TextSelection.collapsed(offset: valorController.text.length);
      });
      return;
    }

    final doubleValue = double.parse(numericValue) / 100;
    final formattedValue = 'R\$ ${doubleValue.toStringAsFixed(2).replaceAll('.', ',').replaceAllMapped(
          RegExp(r"(?<=\d)(?=(\d{3})+(\,))"),
          (match) => '.',
        )}';
    setState(() {
      valorController.text = formattedValue;
      valorController.selection = TextSelection.collapsed(offset: formattedValue.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cadastro de Despesas'),
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
                  'Despesa Fixa:',
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  activeColor: theme.colorScheme.onPrimary,
                  value: isDespesaFixa,
                  onChanged: (value) {
                    setState(() {
                      isDespesaFixa = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
              onSaved: (value) {
                if (value != null) {
                  despesasController.despesasStore.setNome(value);
                }
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: valorController,
              decoration: const InputDecoration(
                labelText: 'Valor',
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: _onValueChanged,
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
                  value: mesVencimento,
                  hint: Text(mesVencimento ?? 'Selecione o Mês de Vencimento'),
                  style: TextStyle(
                    color: isDespesaFixa ? Theme.of(context).disabledColor : Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                  items: meses.map((mes) {
                    return DropdownMenuItem<String>(
                      value: mes,
                      child: Text(mes),
                    );
                  }).toList(),
                  onChanged: isDespesaFixa
                      ? null
                      : (String? newValue) {
                          setState(() {
                            mesVencimento = newValue;
                          });
                        },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    enabled: !isDespesaFixa,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: theme.colorScheme.surface,
                );
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: parcelasController,
              decoration: InputDecoration(
                labelText: 'Quantidade de parcelas',
                border: const OutlineInputBorder(),
                enabled: isDespesaFixa,
              ),
              keyboardType: TextInputType.number,
              enabled: isDespesaFixa,
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
                ),
              ),
              onPressed: _handleAddDespesa,
              child: const Text(
                'Adicionar Despesa',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Observer(
              builder: (_) {
                if (despesasController.despesas.isEmpty) {
                  return const Center(child: Text('Nenhuma despesa cadastrada.'));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: despesasController.despesas.length,
                  itemBuilder: (context, index) {
                    final despesa = despesasController.despesas[index];
                    return ListTile(
                      title: Text(despesa.nome ?? 'Indefinido'),
                      subtitle: Text('Valor: ${despesa.valor?.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          await despesasController.delete(despesa.base!.id);
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('Valor inválido', style: TextStyle(color: Colors.red)),
        content: const Text('Por favor, insira um valor numérico válido.', style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Modular.to.pop(context),
            child: const Text('OK', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
