import 'package:flutter_bloc/flutter_bloc.dart';
import 'cost_estimator_event.dart';
import 'cost_estimator_state.dart';

class CostEstimatorBloc
    extends Bloc<CostEstimatorEvent, CostEstimatorState> {
  CostEstimatorBloc() : super(const CostEstimatorState()) {
    on<SelectBuildingTypeEvent>((event, emit) {
      emit(state.copyWith(selectedBuildingType: event.index));
    });

    on<ChangePlotAreaEvent>((event, emit) {
      emit(state.copyWith(plotArea: event.value));
    });

    on<SelectFloorEvent>((event, emit) {
      emit(state.copyWith(selectedFloor: event.index));
    });

    on<SelectFacingEvent>((event, emit) {
      emit(state.copyWith(selectedFacing: event.index));
    });

    on<SelectQualityEvent>((event, emit) {
      emit(state.copyWith(selectedQuality: event.index));
    });

    on<CalculateEstimateEvent>((event, emit) {
      // Estimation logic can be wired here in the future
    });

    on<ChangeLocationEvent>((event, emit) {
      emit(state.copyWith(location: event.location));
    });
  }
}
