import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ChangeTabEvent>((event, emit) {
      emit(state.copyWith(navIndex: event.index));
    });

    on<ChangeTrendingPageEvent>((event, emit) {
      emit(state.copyWith(trendingPageIndex: event.pageIndex));
    });

    on<ChangePackagePageEvent>((event, emit) {
      emit(state.copyWith(packagePageIndex: event.pageIndex));
    });

    on<ChangeReviewsPageEvent>((event, emit) {
      emit(state.copyWith(reviewsPageIndex: event.pageIndex));
    });

    on<BookConsultationEvent>((event, emit) {
      emit(state.copyWith(showConsultationSuccess: true));
    });

    on<ResetConsultationSuccessEvent>((event, emit) {
      emit(state.copyWith(showConsultationSuccess: false));
    });
  }
}
