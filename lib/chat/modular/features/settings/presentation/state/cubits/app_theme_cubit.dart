import 'package:bloc/bloc.dart';
import '../../../domain/theme_repository.dart';
import '../app_theme_mode_state.dart';

class AppThemeCubit extends Cubit<AppThemeModeState> {
  final ThemeRepository repository;
  static const _isDark = 'isDark';

  AppThemeCubit({required this.repository})
      : super(AppThemeModeState.initial()) {
    _setTheme();
  }

  void updateAppTheme(bool isDark) {
    repository.savePrefs(_isDark, isDark);
    _setTheme();
  }

  void _setTheme() {
    repository.getPrefs(_isDark).asStream().listen((theme) {
      emit(AppThemeModeState(isDark: theme));
    });
  }
}
