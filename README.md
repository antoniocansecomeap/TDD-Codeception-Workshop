# TDD Workshop mit Codeception

Dieses Repository enthält das Starter-Projekt für den TDD Workshop mit Codeception.

## Gitpod Quickstart

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/antoniocansecomeap/TDD-Codeception-Workshop)

## Lokale Installation

1. Repository klonen:
```bash
git clone https://github.com/antoniocansecomeap/TDD-Codeception-Workshop.git
cd tdd-workshop
```
2. Abhängigkeiten installieren:
```bash
composer install
```

3. Codeception initialisieren:
```bash
vendor/bin/codecept build
```

## Tests ausführen

Alle Tests ausführen:
```bash
composer test
```

Nur Unit Tests ausführen:
```bash
composer test:unit
```

Tests mit Coverage-Report ausführen:
```bash
composer test:coverage
```

## Projekt-Struktur

```
├── src/                  # Quellcode
├── tests/               # Tests
│   ├── Unit/           # Unit Tests
│   ├── Functional/     # Functional Tests
│   └── Acceptance/     # Acceptance Tests
├── .gitpod.yml         # Gitpod Konfiguration
├── .gitpod.Dockerfile  # Gitpod Docker-Konfiguration
├── composer.json       # Composer Konfiguration
└── codeception.yml     # Codeception Konfiguration
```

## Übungen

Das Repository enthält Starter-Code für die folgenden Übungen:

1. Calculator (src/Calculator.php)
2. StringManipulator (src/StringManipulator.php)
3. OrderProcessor (src/OrderProcessor.php)

Jede Übung hat entsprechende Test-Dateien im tests/Unit Verzeichnis.

## VS Code Extensions

Die folgenden Extensions werden automatisch in Gitpod installiert:

- PHP Intelephense
- PHP Debug
- PHP Namespace Resolver

## Hilfreiche Befehle

Neuen Test erstellen:
```bash
vendor/bin/codecept generate:test unit ClassName
```

Neue Testklasse für Cest Tests erstellen:
```bash
vendor/bin/codecept generate:cest unit ClassName
```