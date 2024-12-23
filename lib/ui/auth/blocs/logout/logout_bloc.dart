import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/data_source/auth_remote_data_source.dart';
import '../../../../data/models/response/auth_response_model.dart';

part 'logout_bloc.freezed.dart';
part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDataSource dataSource;
  LogoutBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Logout>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.logout();

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
