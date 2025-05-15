# 🐱 Cat Browser – SwiftUI Take Home Assignment

This is a SwiftUI-based application built for the Revelo iOS take-home assignment. It displays a list of cats from a JSON source and allows navigation to a detail view that loads an image per cat.

---

## 📱 Features

* ✅ SwiftUI-only UI
* ✅ MVVM architecture
* ✅ Remote image loading with loading & error placeholders
* ✅ Support for local and remote JSON data
* ✅ Dependency Injection for data source
* ✅ Unit tests included
* ✅ Support localization(Just English for now)
* ✅ No external dependencies
* ✅ Compatible with iOS 18.4+

---

## 📸 Preview

You can find a sample video recording of the app in action:

[![Watch the video](https://img.youtube.com/vi/jaUi8OYszlo/0.jpg)](https://youtube.com/shorts/jaUi8OYszlo)


---

## 🔄 Switching Between Data Sources

The app uses dependency injection to support switching between a local JSON file and a live API.

### ✅ Local JSON (default)

```swift
ListPageView(viewModel: ListPageViewModel(dataSource: JsonCatService()))
```

### 🌐 Remote API

```swift
ListPageView(viewModel: ListPageViewModel(dataSource: APICatService()))
```

Just comment/uncomment in `HomeAssigmentApp.swift`:

```swift
@main
struct HomeAssignmentApp: App {
  var body: some Scene {
    WindowGroup {

      // ✅ Use local JSON file bundled with the app (default for testing/offline use)
      ListPageView(viewModel: ListPageViewModel(dataSource: JsonCatService()))

      // 🌐 To use remote API instead, comment out the line above and uncomment below
      // This fetches the same data from a live endpoint (Mocky)
      //ListPageView(viewModel: ListPageViewModel(dataSource: APICatService()))
    }
  }
}
```

---

## 🔗 API Endpoint

The remote JSON is hosted here(It's the same local json the app is using it):

```
https://run.mocky.io/v3/ac6a8ae4-2bed-44c8-84e2-a6b2f67b97ad
```

Cat images are loaded from:

```
https://cataas.com/cat/{_id}
```

---

## 🔮 Tests

Unit tests cover:

* Decoding behavior
* DataSource behavior
* ViewModel behavior
* Error mapping (URLError to AppError)
* UI formatting logic in `CatUIModel`


All tests use native XCTest and require no third-party tools.

---

## ⚡ Improvements (Future Work)

* ⭐ Implement an image cache system to avoid re-downloading images unnecessarily (e.g., use `NSCache` or custom in-memory/disk cache).

---

## 🚀 Requirements

* Xcode 15+
* iOS 18.4 simulator or device

---

## 👤 Author

César Brenes
[GitHub](https://github.com/cbrenes)

---
