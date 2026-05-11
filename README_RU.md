# Trust Wallet Reborn

**Клон интерфейса** мобильного приложения [Trust Wallet](https://trustwallet.com/), написанный на **Flutter**. Проект ориентирован на разбор сценариев UI, навигации и локальной архитектуры. Это **не** официальное приложение Trust Wallet и **не** связано с компанией Trust Wallet.

[English version →](./README.md)

## Возможности

- Главный экран кошелька с акцентом на токены
- Экран приветствия / онбординга
- Создание нового кошелька и восстановление
- Ввод PIN (BLoC и отдельные виджеты)
- Выбор сети и токенов
- Интерфейс на английском и русском (`easy_localization`)
- Тема Material Design 3 и общий UI kit

## Технологии

| Область   | Выбор                                           |
|----------|--------------------------------------------------|
| Фреймворк | Flutter (Dart SDK `^3.7.2`)                     |
| Состояние | `flutter_bloc` / `bloc`                         |
| DI       | `get_it`                                         |
| HTTP     | `dio`                                            |
| Хранилище | `shared_preferences`                            |
| Локализация | `easy_localization`                          |
| UI       | `flutter_svg`, `stylish_bottom_bar`, `pinput` и др. |

## Требования

- Установленный [Flutter](https://docs.flutter.dev/get-started/install) (stable), совместимый с ограничением SDK проекта
- Android Studio / Xcode (или SDK) для эмуляторов
- При необходимости — физическое устройство с отладкой по USB

## Быстрый старт

```bash
git clone <url-репозитория>
cd trust_wallet_reborn
flutter pub get
flutter run
```

### Запуск на конкретном устройстве

```bash
flutter devices
flutter run -d <id_устройства>
```

### Анализ и тесты

```bash
flutter analyze
flutter test
```

## Структура проекта (кратко)

```
lib/
  main.dart              # Точка входа, инициализация локализации
  di.dart                # Регистрации GetIt (BLoC)
  models/                # Например, перечисления токенов
  screens/               # Экраны: кошелёк, PIN, восстановление и т.д.
  uikit/                 # Общая тема и виджеты
assets/
  translations/          # en.json, ru.json
  coins/, svg/, other/   # Изображения и векторы
```

## Локализация

Языки задаются в `main.dart` (`en`, `ru`). Файлы переводов — в `assets/translations/`.

## Отказ от ответственности

**Trust Wallet** — товарный знак правообладателей. Репозиторий предназначен для обучения. Не используйте его для реальных средств, если не понимаете риски безопасности собственной реализации.