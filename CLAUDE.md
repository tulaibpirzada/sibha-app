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
SibhaApp/
├── SibhaApp.swift       # @main app entry point
├── ContentView.swift    # Root view
└── Assets.xcassets/     # App icon, accent color, image assets
```

## Build & Run

Open `SibhaApp.xcodeproj` in Xcode, select a simulator or device, and press `Cmd+R`.

- **Bundle ID:** `com.tulaibpirzada.sibha-app`
- **Deployment target:** iOS 17.0
- **Supported devices:** iPhone and iPad
