import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int navIndex;
  final int trendingPageIndex;
  final int packagePageIndex;
  final int reviewsPageIndex;
  final bool showConsultationSuccess;

  const HomeState({
    this.navIndex = 0,
    this.trendingPageIndex = 0,
    this.packagePageIndex = 0,
    this.reviewsPageIndex = 0,
    this.showConsultationSuccess = false,
  });

  HomeState copyWith({
    int? navIndex,
    int? trendingPageIndex,
    int? packagePageIndex,
    int? reviewsPageIndex,
    bool? showConsultationSuccess,
  }) {
    return HomeState(
      navIndex: navIndex ?? this.navIndex,
      trendingPageIndex: trendingPageIndex ?? this.trendingPageIndex,
      packagePageIndex: packagePageIndex ?? this.packagePageIndex,
      reviewsPageIndex: reviewsPageIndex ?? this.reviewsPageIndex,
      showConsultationSuccess: showConsultationSuccess ?? this.showConsultationSuccess,
    );
  }

  @override
  List<Object?> get props => [
        navIndex,
        trendingPageIndex,
        packagePageIndex,
        reviewsPageIndex,
        showConsultationSuccess,
      ];
}
