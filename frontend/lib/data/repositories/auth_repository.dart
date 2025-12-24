import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/auth_response_model.dart';
import '../models/user_model.dart';

part 'auth_repository.g.dart';

@RestApi()
abstract class AuthRepository {
  factory AuthRepository(Dio dio, {String baseUrl}) = _AuthRepository;

  @POST('/auth/login')
  Future<AuthResponseModel> login(@Body() LoginRequest request);

  @POST('/auth/register')
  Future<AuthResponseModel> register(@Body() RegisterRequest request);

  @GET('/auth/me')
  Future<UserModel> getCurrentUser();

  @POST('/auth/logout')
  Future<void> logout();
}
