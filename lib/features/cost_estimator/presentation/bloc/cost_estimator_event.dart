import 'package:equatable/equatable.dart';

abstract class CostEstimatorEvent extends Equatable {
  const CostEstimatorEvent();

  @override
  List<Object?> get props => [];
}

class SelectBuildingTypeEvent extends CostEstimatorEvent {
  final int index;
  const SelectBuildingTypeEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class ChangePlotAreaEvent extends CostEstimatorEvent {
  final double value;
  const ChangePlotAreaEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class SelectFloorEvent extends CostEstimatorEvent {
  final int index;
  const SelectFloorEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class SelectFacingEvent extends CostEstimatorEvent {
  final int index;
  const SelectFacingEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class SelectQualityEvent extends CostEstimatorEvent {
  final int index;
  const SelectQualityEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class CalculateEstimateEvent extends CostEstimatorEvent {
  const CalculateEstimateEvent();
}

class ChangeLocationEvent extends CostEstimatorEvent {
  final String location;
  const ChangeLocationEvent(this.location);

  @override
  List<Object?> get props => [location];
}
