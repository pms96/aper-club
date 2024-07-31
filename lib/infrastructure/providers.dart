import 'package:provider/provider.dart';
import 'package:myapp/application/usecases/auth_usecase_impl.dart';
import 'package:myapp/domain/usecases/auth_usecase.dart';

final providers = [
  Provider<AuthUseCase>(create: (_) => AuthUseCaseImpl()),
];
