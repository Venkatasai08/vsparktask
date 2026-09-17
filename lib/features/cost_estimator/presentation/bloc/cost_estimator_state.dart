import 'package:equatable/equatable.dart';

class CostEstimatorState extends Equatable {
  final int selectedBuildingType; // 0=Home,1=Apartment,2=Villa,3=Commercial
  final double plotArea;          // 250 – 4000 sq.ft
  final int selectedFloor;        // 0=G,1=G+1,2=G+2,3=G+3
  final int selectedFacing;       // 0=North,1=South,2=East,3=West
  final int selectedQuality;      // 0=Standard,1=Classic,2=Premium
  final String location;

  const CostEstimatorState({
    this.selectedBuildingType = 0,
    this.plotArea = 250,
    this.selectedFloor = 0,
    this.selectedFacing = 0,
    this.selectedQuality = 0,
    this.location = '',
  });

  CostEstimatorState copyWith({
    int? selectedBuildingType,
    double? plotArea,
    int? selectedFloor,
    int? selectedFacing,
    int? selectedQuality,
    String? location,
  }) {
    return CostEstimatorState(
      selectedBuildingType:
          selectedBuildingType ?? this.selectedBuildingType,
      plotArea: plotArea ?? this.plotArea,
      selectedFloor: selectedFloor ?? this.selectedFloor,
      selectedFacing: selectedFacing ?? this.selectedFacing,
      selectedQuality: selectedQuality ?? this.selectedQuality,
      location: location ?? this.location,
    );
  }

  @override
  List<Object?> get props => [
        selectedBuildingType,
        plotArea,
        selectedFloor,
        selectedFacing,
        selectedQuality,
        location,
      ];
}
