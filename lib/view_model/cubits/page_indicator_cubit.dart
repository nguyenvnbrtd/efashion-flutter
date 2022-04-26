import 'package:bloc/bloc.dart';

class PageIndicatorCubit extends Cubit<int> {
  /// {@macro counter_cubit}
  PageIndicatorCubit() : super(0);

  void routeTo (index) => emit(index);
}