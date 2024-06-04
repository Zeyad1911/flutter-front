import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tech_home_page_state.dart';

class TechHomePageCubit extends Cubit<TechHomePageState> {
  TechHomePageCubit() : super(TechHomePageInitial());
}
