// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:login/data/data_storage/secure_storage/flutter_secure_storage_client.dart'
    as _i585;
import 'package:login/data/data_storage/shared_preferences/shared_preferences_client.dart'
    as _i402;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i585.FlutterSecureStorageClient>(
      () => _i585.FlutterSecureStorageClient(),
    );
    await gh.singletonAsync<_i402.SharedPreferencesClient>(
      () => _i402.SharedPreferencesClient.init(),
      preResolve: true,
    );
    return this;
  }
}
