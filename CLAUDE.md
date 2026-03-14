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
SibhaApp/              # iOS app target
├── SibhaApp.swift       # @main entry point
├── ContentView.swift    # Root view
└── Assets.xcassets/

SibhaAppWatch/         # watchOS app target
├── SibhaAppWatch.swift  # @main entry point
├── WatchContentView.swift
└── Assets.xcassets/
```

## Targets

| Target | Bundle ID | Min OS |
|---|---|---|
| SibhaApp (iPhone only) | `com.tulaibpirzada.sibha` | iOS 17.0 |
| SibhaAppWatch (watchOS) | `com.tulaibpirzada.sibha.watchkitapp` | watchOS 10.0 |

The Watch app is embedded in the iOS app via the "Embed Watch Content" build phase.

## Build & Run

Open `SibhaApp.xcodeproj` in Xcode, select a simulator or device, and press `Cmd+R`.
