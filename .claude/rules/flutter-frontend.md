---
paths: frontend/lib/**/*.dart
---

# Flutter Frontend Coding Rules

## Project Structure
```
lib/
├── core/           # Cross-cutting concerns
├── data/           # Data layer (models, repositories)
├── features/       # Feature modules
├── routes/         # Navigation
└── shared/         # Shared widgets
```

## Naming Conventions
- **Files:** `snake_case.dart`
- **Classes:** `PascalCase`
- **Variables/Functions:** `camelCase`
- **Constants:** `camelCase` or `UPPER_CASE`
- **Private:** Prefix with `_`

## State Management (Riverpod)
- Use `StateNotifier` for complex state
- Use `Provider` for simple values
- Keep providers at feature level
- Handle all states: initial, loading, loaded, error

```dart
// State definition
@freezed
class MyState with _$MyState {
  const factory MyState.initial() = _Initial;
  const factory MyState.loading() = _Loading;
  const factory MyState.loaded(Data data) = _Loaded;
  const factory MyState.error(String message) = _Error;
}

// State notifier
class MyNotifier extends StateNotifier<MyState> {
  MyNotifier(this._repo) : super(const MyState.initial());

  Future<void> load() async {
    state = const MyState.loading();
    try {
      final data = await _repo.fetch();
      state = MyState.loaded(data);
    } catch (e) {
      state = MyState.error(e.toString());
    }
  }
}
```

## Models (Freezed)
- Use Freezed for all data models
- Add custom methods with `const Model._();`
- Use `@JsonKey(name: 'field_name')` for API mapping

```dart
@freezed
class MyModel with _$MyModel {
  const MyModel._();

  const factory MyModel({
    required String id,
    @JsonKey(name: 'first_name') required String firstName,
    @Default('active') String status,
  }) = _MyModel;

  factory MyModel.fromJson(Map<String, dynamic> json) =>
      _$MyModelFromJson(json);

  // Custom method
  bool get isActive => status == 'active';
}
```

## API Repositories (Dio)
- Use Dio directly (NOT Retrofit)
- Handle errors properly
- Return typed models

```dart
class MyRepository {
  final Dio _dio;

  MyRepository(this._dio);

  Future<List<MyModel>> getAll() async {
    try {
      final response = await _dio.get('/endpoint');
      final List<dynamic> data = response.data['data'];
      return data.map((json) => MyModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException e) {
    if (e.response?.data != null) {
      return e.response!.data['error'] ?? 'Error occurred';
    }
    return e.message ?? 'Network error';
  }
}
```

## Widget Rules
1. Use `const` constructors where possible
2. Keep widgets small and focused
3. Extract complex widgets to separate files
4. Use `ConsumerWidget` for Riverpod

```dart
class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myProvider);

    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const CircularProgressIndicator(),
      loaded: (data) => MyContent(data: data),
      error: (msg) => ErrorWidget(message: msg),
    );
  }
}
```

## Navigation (go_router)
- Define routes in `app_router.dart`
- Use path parameters for IDs
- Handle authentication redirects

## Error Handling
- Show user-friendly messages
- Log errors for debugging
- Provide retry options
- Handle network errors gracefully

## Performance
- Use `const` widgets
- Implement pagination for lists
- Lazy load heavy content
- Use `ListView.builder` for lists
