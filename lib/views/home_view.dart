import 'package:escribo_test/views/widgets/buttons/calculate_button.dart';
import 'package:escribo_test/views/widgets/fields/get_int_text_field.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final _resultList = [];
  late int positiveIntNumber;
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Escribo Test',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        centerTitle: true,
        elevation: 5.0,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _showResultContainer(),
              const SizedBox(height: 16.0),
              Text(
                'Digite um inteiro positivo:',
                style: Theme.of(context).textTheme.titleSmall!.merge(TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold)),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: GetIntTextField(
                    onSaved: (value) => positiveIntNumber = int.parse(value!),
                  ),
                ),
              ),
              CalculateButton(
                formKey: _formKey,
                onPressed: calculateResult,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _showResultContainer() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .35,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            offset: const Offset(0, 1),
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Inteiros divisíveis por 3 ou 5:',
            style: Theme.of(context).textTheme.titleMedium!.merge(TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondaryContainer)),
          ),
          const SizedBox(height: 8.0),
          Scrollbar(
            controller: _scrollController,
            thickness: 5,
            thumbVisibility: true,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Text(
                  _resultList.isEmpty
                      ? '0'
                      : _resultList.toString().replaceAll('[]', ''),
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyLarge!.merge(TextStyle(
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer))),
            ),
          ),
          const SizedBox(height: 32),
          Text('Somatório dos valores:',
              style: Theme.of(context).textTheme.titleMedium!.merge(TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondaryContainer))),
          const SizedBox(height: 8.0),
          Text(sum.toString(),
              style: Theme.of(context).textTheme.bodyLarge!.merge(TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer)))
        ],
      ),
    );
  }

  //Funcão para calcular o somatório de todos os valores inteiros divisíveis por 3 ou 5 que sejam inferiores ao positiveIntNumber
  void calculateResult() {
    _resultList.clear();
    sum = 0;
    for (var i = 1; i < positiveIntNumber; i++) {
      if (i % 3 == 0 || i % 5 == 0) {
        _resultList.add(i);
        sum += i;
      }
    }
    setState(() {});
  }
}
