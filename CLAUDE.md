# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

`sibha-app` is a SwiftUI iOS app — a tasbeeh (سبحة) / Islamic prayer counter.

## Tech Stack

- **Language:** Swift
- **UI Framework:** SwiftUI
- **Dependency Management:** Swift Package Manager
- **Build:** Xcode (open `SibhaApp.xcodeproj`)

## Project Structure

```
SibhaApp/                        # iOS companion app (minimal)
├── SibhaApp.swift
├── ContentView.swift
└── Assets.xcassets/

SibhaAppWatch/                   # watchOS app (primary product)
├── SibhaAppWatch.swift          # @main
├── WatchContentView.swift       # NavigationStack root → SessionPickerView
├── Models/
│   ├── Dhikr.swift              # arabic, transliteration, target count
│   └── DhikrSession.swift       # ordered list of Dhikr + static presets
├── ViewModels/
│   └── CounterViewModel.swift   # count state, haptics, auto-advance (@Observable)
├── Views/
│   ├── SessionPickerView.swift  # list of presets, navigates to CounterView
│   ├── CounterView.swift        # active counter — Double Tap + full-screen tap
│   └── CompletionView.swift     # shown on session complete
└── Assets.xcassets/
```

### Watch App Navigation Flow
`SessionPickerView` → (select session) → `CounterView` → (all dhikr done) → `CompletionView` (overlay) → dismiss back to picker

### Key Patterns
- **Double Tap input**: `.handGestureShortcut(.primaryAction)` on the counter `Button` (watchOS 10+)
- **Haptics**: `WKInterfaceDevice.current().play(.click)` per tap, `.success` on dhikr/session complete
- **Auto-advance**: 0.8s delay after target reached, then moves to next dhikr in sequence
- **`@Observable`** used for `CounterViewModel` (Swift 5.9 / watchOS 10+)

## Targets

| Target | Bundle ID | Min OS |
|---|---|---|
| SibhaApp (iPhone only) | `com.tulaibpirzada.sibha` | iOS 17.0 |
| SibhaAppWatch (watchOS) | `com.tulaibpirzada.sibha.watchkitapp` | watchOS 10.0 |

The Watch app is embedded in the iOS app via the "Embed Watch Content" build phase.

## Build & Run

Open `SibhaApp.xcodeproj` in Xcode, select a simulator or device, and press `Cmd+R`.
