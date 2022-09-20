import 'package:cubit_example/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cubit example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Counter value : ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state is CounterValueChange) {
                    return Text(
                      state.counter.toString(),
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else if (state is CounterInitial) {
                    return Text(
                      state.counter.toString(),
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else {
                    return const Text('faild');
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _floatingWidget(context),
    );
  }

  Widget _floatingWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            context.read<CounterCubit>().countericrement();
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(
          height: 20,
        ),
        FloatingActionButton(
          onPressed: () {
            context.read<CounterCubit>().counterreset();
          },
          child: const Icon(Icons.exposure_zero),
        ),
        const SizedBox(
          height: 20,
        ),
        FloatingActionButton(
          onPressed: () {
            context.read<CounterCubit>().counterdecrement();
          },
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
