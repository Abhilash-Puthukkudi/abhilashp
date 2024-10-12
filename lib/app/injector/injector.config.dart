// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:machine_test/src/application/auth/auth_bloc.dart' as _i48;
import 'package:machine_test/src/application/home/home_bloc.dart' as _i265;
import 'package:machine_test/src/domain/auth/i_auth_respository.dart' as _i426;
import 'package:machine_test/src/domain/core/internet_service/i_base_client.dart'
    as _i997;
import 'package:machine_test/src/domain/core/preference/preference.dart'
    as _i28;
import 'package:machine_test/src/domain/home/i_home_repository.dart' as _i325;
import 'package:machine_test/src/infrastructure/auth/auth_repository.dart'
    as _i738;
import 'package:machine_test/src/infrastructure/core/internet_helper.dart'
    as _i1018;
import 'package:machine_test/src/infrastructure/core/preference_helper.dart'
    as _i45;
import 'package:machine_test/src/infrastructure/core/third_party_injectable_module.dart'
    as _i386;
import 'package:machine_test/src/infrastructure/home/home_repository.dart'
    as _i149;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyInjectableModule = _$ThirdPartyInjectableModule();
    gh.lazySingleton<_i519.Client>(() => thirdPartyInjectableModule.client);
    gh.lazySingleton<_i45.PreferenceHelper>(
        () => thirdPartyInjectableModule.preferenceHelper);
    gh.lazySingleton<_i28.PreferenceContracts>(() => _i45.PreferenceHelper());
    gh.lazySingleton<_i997.IBaseClient>(
        () => _i1018.InternetHelper(gh<_i519.Client>()));
    gh.lazySingleton<_i426.IAuthRespository>(
        () => _i738.AuthRepository(gh<_i997.IBaseClient>()));
    gh.lazySingleton<_i325.IHomeRepository>(
        () => _i149.HomeRepository(gh<_i997.IBaseClient>()));
    gh.factory<_i265.HomeBloc>(
        () => _i265.HomeBloc(gh<_i325.IHomeRepository>()));
    gh.factory<_i48.AuthBloc>(
        () => _i48.AuthBloc(gh<_i426.IAuthRespository>()));
    return this;
  }
}

class _$ThirdPartyInjectableModule extends _i386.ThirdPartyInjectableModule {}
