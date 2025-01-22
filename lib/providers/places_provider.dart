import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/models/places_model.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super([]);

  void addNewPlace(Place newPlace) {
    state = [newPlace, ...state];
  }

//remove place function
  int removePlace(Place placeToDelete) {
    final index = state.indexWhere((item) {
      return placeToDelete.placeID == item.placeID;
    });
    if (index != -1) {
      state = List.from(state)..removeAt(index);
      return 1;
    }
    return 0;
  }

// edit place function
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>((ref) {
  return UserPlacesNotifier();
});
