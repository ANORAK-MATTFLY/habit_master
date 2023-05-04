import 'package:habit_master/features/auth/infrastructure/repository/user_repository.dart';

class IdentityFacadeService {
  const IdentityFacadeService({
    required this.userRepository,
  });

  final UserRepository userRepository;
}
