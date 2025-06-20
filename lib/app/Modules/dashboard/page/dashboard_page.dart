import 'package:coin_control/app/Modules/dashboard/controller/dashboard_controller.dart';
import 'package:coin_control/app/Modules/dashboard/stores/dashboard_store.dart';
import 'package:coin_control/app/shared/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DashboardPage extends StatelessWidget {
  final DashboardController controller = Modular.get<DashboardController>();

  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoginPage = Modular.to.path == '/login';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Controle Mensal'),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Modular.to.pushReplacementNamed('/select-theme');
                },
                tooltip: 'Configurações',
              ),
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  Modular.to.navigate('/');
                },
              ),
            ],
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return Column(
            children: [
              // Cards para Total de Renda e Despesa
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    _buildCard(title: 'Total de Renda', value: controller.dashboardStore.totalRenda, color: Colors.transparent),
                    _buildCard(title: 'Total de Despesa', value: controller.dashboardStore.totalDespesa, color: Colors.transparent),
                    _buildCard(title: 'Total Disponível', value: controller.dashboardStore.totalDisponivel, color: Colors.transparent),
                  ],
                ),
              ),

              // Carrossel de Meses
              _buildMesCarrossel(controller.dashboardStore),

              // Abas para Despesa e Receita
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(tabs: [
                        Tab(text: 'Despesas'),
                        Tab(text: 'Receitas'),
                      ]),
                      Expanded(
                        child: TabBarView(
                          children: [
                            _buildTransacaoList(controller.dashboardStore, true), // Lista de despesas
                            _buildTransacaoList(controller.dashboardStore, false), // Lista de receitas
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: isLoginPage
          ? null
          : Observer(builder: (context) {
              return BottomNavigationBar(
                landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
                elevation: 10,
                iconSize: 30,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Theme.of(context).primaryColor),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 24),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: const Icon(Icons.monetization_on, color: Colors.white, size: 24),
                    ),
                    label: '',
                  ),
                ],
                onTap: (index) {
                  if (index == 0) {
                    Modular.to.pushReplacementNamed('/');
                  }
                  if (index == 1) {
                    Modular.to.pushReplacementNamed(despesasRoute);
                  }
                  if (index == 2) {
                    Modular.to.pushReplacementNamed(receitasRoute);
                  }
                },
              );
            }),
    );
  }

  // Card Widget
  Widget _buildCard({required String title, required double value, required Color color}) {
    return Expanded(
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(height: 8),
              Text(
                'R\$ ${value.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Carrossel de Meses
  Widget _buildMesCarrossel(DashboardStore store) {
    List<String> meses = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: meses.map((mes) {
          return GestureDetector(
            onTap: () => controller.selecionarMes(mes),
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: store.mesSelecionado == mes ? Colors.blue : Colors.grey,
              ),
              child: Text(mes, style: const TextStyle(color: Colors.white)),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Lista de transações
  Widget _buildTransacaoList(DashboardStore store, bool isDespesa) {
    return Observer(
      builder: (_) {
        final transacoes = controller.dashboardStore.transacoes.where((t) {
          return t.isDespesa == isDespesa && t.mes == controller.dashboardStore.mesSelecionado;
        }).toList();

        if (transacoes.isEmpty) {
          return Center(
            child: Text(
              isDespesa ? 'Nenhuma despesa encontrada' : 'Nenhuma receita encontrada',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          itemCount: transacoes.length,
          itemBuilder: (context, index) {
            final transacao = transacoes[index];
            return ListTile(
              title: Text(transacao.nome),
              subtitle: Text(transacao.mes),
              trailing: Text(
                '${transacao.isDespesa ? '-' : '+'} R\$ ${transacao.valor.toStringAsFixed(2)}',
                style: TextStyle(
                  color: transacao.isDespesa ? Colors.red : Colors.green,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
