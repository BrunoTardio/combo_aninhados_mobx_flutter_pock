import 'package:combo_aninhados_mobx/repositories/cities_repositor.dart';
import 'package:combo_aninhados_mobx/repositories/states_repository.dart';
import 'package:combos/combos.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import 'models/city_model.dart';
import 'models/state_model.dart';
part'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;
abstract class _HomeControllerBase with Store{

  var citiesRepository = CitiesRepository();
  GlobalKey<ListComboState> cityKey = GlobalKey<ListComboState>();


  @observable
  List<StateModel> states;

  @observable
  StateModel stateSelected;

  @action
  void selectState(StateModel stateSelected){
    this.stateSelected = stateSelected;
  }

  @action
  void findStates(){
    this.states = StateRepository().findAllStates();
  }

  @observable
  CityModel citySelected;

  @observable
  bool loadingCities = false;

  @action
  void selectCity(CityModel city) {
    this.citySelected = city;
  }

  @action
  Future<void> findCities() async {
    loadingCities = true;
    await Future.delayed(Duration(seconds: 3));
    this.citySelected = null;
    var cities = await citiesRepository.getCitiesByState(stateSelected.id);
    loadingCities = false;
    this.cityKey.currentState.updatePopupContent(cities);

  }


}
