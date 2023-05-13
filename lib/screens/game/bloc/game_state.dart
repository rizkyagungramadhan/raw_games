part of 'game_bloc.dart';

class GameState extends Equatable {
  final bool isLoading;
  final GameDetailResponse? item;
  final dynamic error;
  final List<GameScreenshotResponse>? screenshots;
  final int? screenshotPage;
  final bool isLastScreenshotPage;
  final dynamic getScreenshotError;

  const GameState({
    this.isLoading = true,
    this.item,
    this.error,
    this.screenshots,
    this.screenshotPage,
    this.isLastScreenshotPage = false,
    this.getScreenshotError,
  });

  GameState copyWith({
    bool? isLoading,
    GameDetailResponse? item,
    dynamic error,
    List<GameScreenshotResponse>? screenshots,
    int? screenshotPage,
    bool? isLastScreenshotPage,
    dynamic getScreenshotError,
  }) {
    return GameState(
      isLoading: isLoading ?? this.isLoading,
      item: item ?? this.item,
      error: error,
      screenshots: screenshots,
      screenshotPage: screenshotPage ?? this.screenshotPage,
      isLastScreenshotPage: isLastScreenshotPage ?? this.isLastScreenshotPage,
      getScreenshotError: getScreenshotError,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        item,
        error,
        screenshots,
        screenshotPage,
        isLastScreenshotPage,
        getScreenshotError,
      ];
}
