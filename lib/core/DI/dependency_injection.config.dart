// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/home/data/data_sources/home_api_dao.dart' as _i4;
import '../../features/home/data/data_sources/home_dao.dart' as _i3;
import '../../features/home/data/repositories/home_repo_impl.dart' as _i6;
import '../../features/home/domain/repositories/home_repository.dart' as _i5;
import '../../features/home/domain/use_cases/Posts_usecase.dart' as _i11;
import '../../features/home/domain/use_cases/user_usecase.dart' as _i12;
import '../../features/home/presentation/manager/home_cubit.dart' as _i14;
import '../../features/post_details/data/data_sources/post_details_api.dart'
    as _i8;
import '../../features/post_details/data/data_sources/post_details_dao.dart'
    as _i7;
import '../../features/post_details/data/repositories/post_details_repo_impl.dart'
    as _i10;
import '../../features/post_details/domain/repositories/post_details_repo.dart'
    as _i9;
import '../../features/post_details/domain/use_cases/comments_usecase.dart'
    as _i13;
import '../../features/post_details/presentation/manager/post_details_cubit.dart'
    as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.HomeDao>(
      _i4.HomeApiDao(),
      instanceName: 'api',
    );
    gh.factory<_i5.HomeRepo>(
        () => _i6.HomeRepoImpl(gh<_i3.HomeDao>(instanceName: 'api')));
    gh.singleton<_i7.PostDetailsDao>(
      _i8.PostDetailsApiDaoImpl(),
      instanceName: 'api',
    );
    gh.factory<_i9.PostDetailsRepo>(() =>
        _i10.PostDetailsRepoImpl(gh<_i7.PostDetailsDao>(instanceName: 'api')));
    gh.factory<_i11.PostsUseCase>(() => _i11.PostsUseCase(gh<_i5.HomeRepo>()));
    gh.factory<_i12.UserUseCase>(() => _i12.UserUseCase(gh<_i5.HomeRepo>()));
    gh.factory<_i13.CommentsUseCase>(
        () => _i13.CommentsUseCase(gh<_i9.PostDetailsRepo>()));
    gh.factory<_i14.HomeCubit>(() => _i14.HomeCubit(
          gh<_i11.PostsUseCase>(),
          gh<_i12.UserUseCase>(),
        ));
    gh.factory<_i15.PostDetailsCubit>(
        () => _i15.PostDetailsCubit(gh<_i13.CommentsUseCase>()));
    return this;
  }
}
