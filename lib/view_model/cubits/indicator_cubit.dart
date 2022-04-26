import 'package:bloc/bloc.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [CounterState] as its state.
/// {@endtemplate}

class IndicatorCubit extends Cubit<int> {
  /// {@macro counter_cubit}
  IndicatorCubit() : super(0);

  void scrollToRight () => emit(state + 1) ;
  void scrollToLeft () => emit(state - 1);
}