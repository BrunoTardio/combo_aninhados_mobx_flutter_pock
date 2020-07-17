
import 'package:combo_aninhados_mobx/models/state_model.dart';

class StateRepository {

  List<StateModel> findAllStates() {
    return [
      StateModel(id: 'SP', name: 'São Paulo'),
      StateModel(id: 'MG', name: 'Minas Gerais'),
    ];
  }
}