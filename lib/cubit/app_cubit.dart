import 'package:bloc/bloc.dart';
import '../model/data_model.dart';
import '../services/data_services.dart';
import '../services/search_data_service.dart';
import 'app_cubit_state.dart';
class AppCubits extends Cubit<Cubitstate> {
  AppCubits({required this.data, required this.searchdata})
      : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getdata() async {
    try {
      emit(LoadingState());
      places = await data.getinfo();
      emit(LoadedState(places));
    } catch (e) {}
  }
  final SearchDataServices searchdata;
  var searchplaces;
  void getsearchdata(String search) async {
    try {
      emit(searchLoadingState());
      searchplaces = await searchdata.searchHotels(search);
      emit(SearchLoadedState(searchplaces));
    } catch (e) {}
  }
  detailPage(DataModel data) {
    emit(DetailState(data));
  }
  newdetailPage(DataModel newdata) {
    emit(SearchDetailState(newdata));
  }
  goHome() {
    emit(LoadedState(places));
  }
  againgoHome() {
    emit(LoadedState(places));
  }
  gosearchedresultscreen() {
    emit(SearchLoadedState(searchplaces));
  }
}
