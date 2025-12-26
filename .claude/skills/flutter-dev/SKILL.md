---
name: flutter-dev
description: Build Flutter features for MERIDIEN frontend. Use when creating screens, widgets, providers, or API integrations. Includes patterns for Riverpod, Freezed, and Dio.
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
---

# MERIDIEN Flutter Development Skill

## What This Skill Does

Helps you build Flutter UI components following MERIDIEN's patterns:
- Feature-first architecture
- Riverpod state management
- Freezed data models
- Dio API integration

## When to Use

Use this skill when:
- Creating new screens
- Building UI components
- Implementing state management
- Integrating with backend APIs

## Project Structure

```
frontend/lib/
├── core/
│   ├── constants/
│   │   └── app_colors.dart      # Color palette
│   ├── theme/
│   │   └── app_theme.dart       # Material theme
│   └── utils/
├── data/
│   ├── models/                   # Freezed data models
│   │   ├── auth_model.dart
│   │   ├── customer_model.dart
│   │   ├── product_model.dart
│   │   └── order_model.dart
│   └── repositories/             # Dio API clients
│       ├── auth_repository.dart
│       ├── customer_repository.dart
│       ├── product_repository.dart
│       └── order_repository.dart
├── features/
│   └── {feature}/
│       ├── models/               # State models
│       ├── providers/            # Riverpod providers
│       ├── screens/              # UI screens
│       └── widgets/              # Feature widgets
├── routes/
│   └── app_router.dart          # go_router config
└── shared/
    └── widgets/                  # Shared widgets
```

## Creating a New Feature

### Step 1: Create Data Model
`lib/data/models/{entity}_model.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_model.freezed.dart';
part 'entity_model.g.dart';

@freezed
class EntityModel with _$EntityModel {
  const EntityModel._();  // Add if you need custom methods

  const factory EntityModel({
    required String id,
    @JsonKey(name: 'tenant_id') required String tenantId,
    required String name,
    String? description,
    @Default('active') String status,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _EntityModel;

  factory EntityModel.fromJson(Map<String, dynamic> json) =>
      _$EntityModelFromJson(json);

  // Custom method example
  bool get isActive => status == 'active';
}

// Request models
@freezed
class CreateEntityRequest with _$CreateEntityRequest {
  const factory CreateEntityRequest({
    required String name,
    String? description,
  }) = _CreateEntityRequest;

  factory CreateEntityRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateEntityRequestFromJson(json);
}
```

### Step 2: Create Repository
`lib/data/repositories/{entity}_repository.dart`

```dart
import 'package:dio/dio.dart';
import '../models/entity_model.dart';

class EntityRepository {
  final Dio _dio;

  EntityRepository(this._dio);

  Future<List<EntityModel>> getEntities({
    int page = 1,
    int perPage = 20,
    String? search,
    String? status,
  }) async {
    try {
      final response = await _dio.get('/entities', queryParameters: {
        'page': page,
        'per_page': perPage,
        if (search != null && search.isNotEmpty) 'search': search,
        if (status != null) 'status': status,
      });

      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => EntityModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<EntityModel> getEntity(String id) async {
    try {
      final response = await _dio.get('/entities/$id');
      return EntityModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<EntityModel> createEntity(CreateEntityRequest request) async {
    try {
      final response = await _dio.post('/entities', data: request.toJson());
      return EntityModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<EntityModel> updateEntity(String id, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put('/entities/$id', data: data);
      return EntityModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> deleteEntity(String id) async {
    try {
      await _dio.delete('/entities/$id');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException e) {
    if (e.response?.data != null && e.response!.data is Map) {
      return e.response!.data['error'] ??
             e.response!.data['message'] ??
             'An error occurred';
    }
    if (e.type == DioExceptionType.connectionTimeout) {
      return 'Connection timeout';
    }
    if (e.type == DioExceptionType.connectionError) {
      return 'No internet connection';
    }
    return e.message ?? 'An unexpected error occurred';
  }
}
```

### Step 3: Create State Model
`lib/features/{feature}/models/{entity}_state.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/entity_model.dart';

part 'entity_state.freezed.dart';

@freezed
class EntityListState with _$EntityListState {
  const factory EntityListState.initial() = _Initial;
  const factory EntityListState.loading() = _Loading;
  const factory EntityListState.loaded({
    required List<EntityModel> entities,
    @Default(1) int currentPage,
    @Default(false) bool hasMore,
  }) = _Loaded;
  const factory EntityListState.error(String message) = _Error;
}

@freezed
class EntityDetailState with _$EntityDetailState {
  const factory EntityDetailState.initial() = _DetailInitial;
  const factory EntityDetailState.loading() = _DetailLoading;
  const factory EntityDetailState.loaded(EntityModel entity) = _DetailLoaded;
  const factory EntityDetailState.error(String message) = _DetailError;
}
```

### Step 4: Create Provider
`lib/features/{feature}/providers/{entity}_provider.dart`

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/repositories/entity_repository.dart';
import '../models/entity_state.dart';

// Repository provider
final entityRepositoryProvider = Provider<EntityRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return EntityRepository(dio);
});

// List state notifier
class EntityListNotifier extends StateNotifier<EntityListState> {
  final EntityRepository _repository;

  EntityListNotifier(this._repository) : super(const EntityListState.initial());

  Future<void> loadEntities({String? search, String? status}) async {
    state = const EntityListState.loading();
    try {
      final entities = await _repository.getEntities(
        search: search,
        status: status,
      );
      state = EntityListState.loaded(entities: entities);
    } catch (e) {
      state = EntityListState.error(e.toString());
    }
  }

  Future<void> refresh() async {
    await loadEntities();
  }

  Future<void> deleteEntity(String id) async {
    try {
      await _repository.deleteEntity(id);
      await refresh();
    } catch (e) {
      // Handle error - optionally emit error state
    }
  }
}

final entityListProvider =
    StateNotifierProvider<EntityListNotifier, EntityListState>((ref) {
  final repository = ref.watch(entityRepositoryProvider);
  return EntityListNotifier(repository);
});

// Detail state notifier
class EntityDetailNotifier extends StateNotifier<EntityDetailState> {
  final EntityRepository _repository;

  EntityDetailNotifier(this._repository) : super(const EntityDetailState.initial());

  Future<void> loadEntity(String id) async {
    state = const EntityDetailState.loading();
    try {
      final entity = await _repository.getEntity(id);
      state = EntityDetailState.loaded(entity);
    } catch (e) {
      state = EntityDetailState.error(e.toString());
    }
  }
}

final entityDetailProvider =
    StateNotifierProvider<EntityDetailNotifier, EntityDetailState>((ref) {
  final repository = ref.watch(entityRepositoryProvider);
  return EntityDetailNotifier(repository);
});
```

### Step 5: Create Screen
`lib/features/{feature}/screens/{entity}_list_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/entity_provider.dart';
import '../widgets/entity_card.dart';

class EntityListScreen extends ConsumerStatefulWidget {
  const EntityListScreen({super.key});

  @override
  ConsumerState<EntityListScreen> createState() => _EntityListScreenState();
}

class _EntityListScreenState extends ConsumerState<EntityListScreen> {
  @override
  void initState() {
    super.initState();
    // Load data on init
    Future.microtask(() {
      ref.read(entityListProvider.notifier).loadEntities();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(entityListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Entities'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(entityListProvider.notifier).refresh(),
          ),
        ],
      ),
      body: state.when(
        initial: () => const Center(child: Text('Loading...')),
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: (entities, _, __) {
          if (entities.isEmpty) {
            return const Center(child: Text('No entities found'));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(entityListProvider.notifier).refresh(),
            child: ListView.builder(
              itemCount: entities.length,
              itemBuilder: (context, index) => EntityCard(
                entity: entities[index],
                onTap: () => _navigateToDetail(entities[index].id),
              ),
            ),
          );
        },
        error: (message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $message'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(entityListProvider.notifier).loadEntities(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToCreate(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _navigateToDetail(String id) {
    // Use go_router or Navigator
  }

  void _navigateToCreate() {
    // Navigate to create screen
  }
}
```

### Step 6: Add Route
`lib/routes/app_router.dart`

```dart
GoRoute(
  path: '/entities',
  builder: (context, state) => const EntityListScreen(),
),
GoRoute(
  path: '/entities/:id',
  builder: (context, state) {
    final id = state.pathParameters['id']!;
    return EntityDetailScreen(id: id);
  },
),
```

## Generate Code

After creating Freezed models, run:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Color Constants

Use `lib/core/constants/app_colors.dart` for status colors:

```dart
static Color getStatusColor(String status) {
  switch (status) {
    case 'active': return Colors.green;
    case 'inactive': return Colors.grey;
    case 'pending': return Colors.amber;
    default: return Colors.grey;
  }
}
```

## Reference Files

- Existing model: `lib/data/models/customer_model.dart`
- Existing repository: `lib/data/repositories/customer_repository.dart`
- Existing provider: `lib/features/customers/providers/customer_provider.dart`
- Existing screen: `lib/features/customers/screens/customer_list_screen.dart`
