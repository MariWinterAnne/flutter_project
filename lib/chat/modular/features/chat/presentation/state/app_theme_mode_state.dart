import 'package:equatable/equatable.dart';

class AppThemeModeState extends Equatable {
  final bool isDark;

  const AppThemeModeState({required this.isDark});

  factory AppThemeModeState.initial() {
    return const AppThemeModeState(isDark: false);
  }

  AppThemeModeState copyWith({bool? isDark}) {
    return AppThemeModeState(isDark: isDark ?? this.isDark);
  }

  @override
  List<Object?> get props => [
        isDark,
      ];
}
