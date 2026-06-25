You are a Principal Flutter Architect and Senior Software Engineer.

Create a complete enterprise-grade Flutter application named:

SIAP (Sistem Informasi Asuransi Pertanian)

Target Platforms:
- Android
- iOS
- Web

Use the following mandatory architecture and standards.

==================================================
TECH STACK
==================================================

Flutter Stable
Dart 3+

State Management:
- flutter_bloc

Architecture:
- Clean Architecture
- Feature Modular Architecture
- SOLID Principles
- Repository Pattern

Dependency Injection:
- get_it

Networking:
- dio

Local Storage:
- shared_preferences

Routing:
- go_router

Serialization:
- freezed
- json_serializable

Utilities:
- equatable
- intl

Responsive UI:
- flutter_screenutil

==================================================
PROJECT STRUCTURE
==================================================

lib/

├── core/
│
├── config/
│
├── injection/
│
├── routes/
│
├── shared/
│
├── features/
│
│   ├── auth/
│   ├── dashboard/
│   ├── petani/
│   ├── lahan/
│   ├── asuransi/
│   ├── klaim/
│   ├── laporan/
│   └── pengguna/
│
└── main.dart

==================================================
FEATURE STRUCTURE
==================================================

features/auth/

├── data/
│   ├── datasource/
│   ├── models/
│   └── repository/
│
├── domain/
│   ├── entities/
│   ├── repository/
│   └── usecases/
│
└── presentation/
    ├── bloc/
    ├── pages/
    └── widgets/

Apply same structure to every feature module.

==================================================
CLEAN ARCHITECTURE RULES
==================================================

Domain Layer:
- Pure Dart
- No Flutter imports
- Entities
- Repository Contracts
- Use Cases

Data Layer:
- Models
- DTOs
- Data Sources
- Repository Implementations

Presentation Layer:
- Pages
- Widgets
- Bloc
- Events
- States

==================================================
CORE MODULES
==================================================

Create reusable core modules:

core/network
- dio_client.dart
- api_endpoints.dart
- dio_interceptors.dart
- network_exceptions.dart

core/storage
- shared_pref_service.dart

core/errors
- failure.dart
- exception.dart

core/utils
- validators.dart
- formatter.dart

core/theme
- light_theme.dart
- dark_theme.dart

core/constants
- app_constants.dart

==================================================
DEPENDENCY INJECTION
==================================================

Use GetIt.

Create:

injection/
└── dependency_injection.dart

Register:

- Dio
- SharedPreferences
- Repositories
- Data Sources
- Use Cases
- Blocs

Use lazySingleton where appropriate.

==================================================
NETWORKING
==================================================

Configure Dio with:

- Base URL
- Request Interceptor
- Response Interceptor
- Error Interceptor
- JWT Authentication
- Refresh Token Flow
- Request Logging

Create:

BaseApiResponse<T>

Generic Response Wrapper

Handle:

- 200
- 201
- 400
- 401
- 403
- 404
- 422
- 500

==================================================
LOCAL STORAGE
==================================================

Use Shared Preferences.

Store:

- Access Token
- Refresh Token
- User Session
- User Role
- Theme Mode

Create service layer abstraction.

==================================================
ROUTING
==================================================

Use go_router.

Create:

routes/app_router.dart

Support:

- Auth Guard
- Role Guard
- Redirect Logic

==================================================
STATE MANAGEMENT
==================================================

Use flutter_bloc.

For every feature create:

FeatureBloc
FeatureEvent
FeatureState

Implement:

- Initial
- Loading
- Success
- Error

==================================================
AUTHENTICATION MODULE
==================================================

Features:

Login
Logout
Refresh Token
Forgot Password

Role Based Access:

Admin
Operator
Verifikator
Petani

JWT Authentication

Persist session using Shared Preferences.

==================================================
DASHBOARD MODULE
==================================================

Features:

Summary Cards

Total Petani
Total Lahan
Total Polis
Total Klaim

Charts:

Monthly Registrations
Monthly Claims

Responsive Dashboard:

Desktop
Tablet
Mobile

==================================================
PETANI MODULE
==================================================

Features:

Create Petani
Update Petani
Delete Petani
Detail Petani
Search Petani
Pagination

Fields:

NIK
Nama
Alamat
No HP
Kelompok Tani

==================================================
LAHAN MODULE
==================================================

Features:

CRUD Lahan

Fields:

Kode Lahan
Nama Lahan
Luas
Lokasi
Koordinat

Map Integration Ready

==================================================
ASURANSI MODULE
==================================================

Features:

Pendaftaran Asuransi

Workflow:

Draft
Submitted
Verified
Approved
Rejected

Upload Documents

==================================================
KLAIM MODULE
==================================================

Features:

Pengajuan Klaim

Workflow:

Draft
Submitted
Survey
Approved
Rejected

Upload Bukti Kerusakan

==================================================
LAPORAN MODULE
==================================================

Features:

Filter Report

Export:

PDF
Excel

Print Support

==================================================
USER MANAGEMENT MODULE
==================================================

Features:

CRUD User

Role Assignment

Permission Management

==================================================
UI REQUIREMENTS
==================================================

Use Material 3.

Create:

Design System

Colors
Typography
Spacing
Button Styles
Input Styles

Responsive Layout:

Mobile
Tablet
Desktop

Web Layout:
- Sidebar Navigation
- Header
- Content Area

Mobile Layout:
- Drawer Navigation
- Bottom Navigation

==================================================
ERROR HANDLING
==================================================

Create centralized error handling.

Implement:

Failure
Exception
Either Result Pattern

Show:

Snackbar
Dialog
Empty State

==================================================
CODE GENERATION
==================================================

Use:

freezed
json_serializable
build_runner

Generate all DTOs and States.

==================================================
TESTING
==================================================

Prepare structure for:

Unit Test
Repository Test
Bloc Test

==================================================
OUTPUT REQUIRED
==================================================

Generate:

1. Complete folder structure
2. pubspec.yaml
3. main.dart
4. dependency_injection.dart
5. dio configuration
6. shared preference service
7. routing setup
8. authentication module
9. dashboard module
10. sample CRUD module
11. reusable widgets
12. responsive layouts
13. clean architecture implementation
14. bloc implementation
15. repository implementation
16. production-ready code

Generate code file by file with exact paths.

Do not provide explanations.

Generate actual implementation code.