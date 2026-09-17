import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class ChangeTabEvent extends HomeEvent {
  final int index;
  const ChangeTabEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class ChangeTrendingPageEvent extends HomeEvent {
  final int pageIndex;
  const ChangeTrendingPageEvent(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}

class ChangePackagePageEvent extends HomeEvent {
  final int pageIndex;
  const ChangePackagePageEvent(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}

class ChangeReviewsPageEvent extends HomeEvent {
  final int pageIndex;
  const ChangeReviewsPageEvent(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}

class BookConsultationEvent extends HomeEvent {
  const BookConsultationEvent();
}

class ResetConsultationSuccessEvent extends HomeEvent {
  const ResetConsultationSuccessEvent();
}
