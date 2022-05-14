# ming

Application for abandoned pets.

## Getting Started

### Directory structure

- ui
  - screens
    - screen view for applications (e.g. setting, login, etc)
  - components
    - reusable components for all screens
- blocs
  - Check [bloc pattern](https://bloclibrary.dev/#/coreconcepts)
  - Level of "business model"
  - multiple blocs and their states, events
  - Rules
    - Single bloc file will contains bloc and its corresponding state, event.
- models
  - "Interface" of repositories and services
- entities
  - data entity
- adapters
  - "Implementation" of each models
- di
  - Dependency injection roots (repositories and blocs)

### String resource management

- check https://pub.dev/packages/intl
- check https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl
- u can easily extract string resource to .arb file using vscode action.
  - https://twitter.com/localizely/status/1255175275454881793

### [bloc pattern](https://bloclibrary.dev/#/coreconcepts)

### [Auth plan](docs/auth/auth_plan.md)

## Testing

### Integration_test

#### Firebase Emulation

- Firebase auth emulation test sequence.
  - firebase emulator를 시작한다.
  `firebase emulators:start --import="./integration_test/resources/emulator_dump"`
  - test를 진행한다.
- 새로운 emulation setting을 만들고 싶을 때
  - firebase emulator를 export option으로 시작한다.
  `firebase emulators:start --export-on-exit="./integration_test/resources/emulator_dump"`
