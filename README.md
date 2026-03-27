# 🛍️ NykaaStyle E-Commerce App (SwiftUI)

A production-grade e-commerce iOS application built using **SwiftUI**, following modern iOS architecture patterns like **MVVM, State-Driven Navigation, and Protocol-Oriented Programming**.

---

## 🚀 Features

* 🔐 Authentication Flow (OTP-based login)
* 🏠 Home Screen with product grid (Nykaa-style UI)
* 🔎 Category filtering & sorting (price, rating)
* 🛒 Shopping Cart with persistent storage
* ❤️ Wishlist functionality
* 💳 Checkout flow (dummy payment)
* ⚡ Async/Await networking
* 🧠 Advanced State Management (`ViewState<T>`)
* 🧭 State-driven navigation (`NavigationStack`)

---

## 🏗️ Architecture

This project follows a **scalable and modular architecture**:

* **MVVM (Model-View-ViewModel)**
* **Protocol-Oriented Programming (POP)**
* **State-Driven UI (Single Source of Truth)**
* **Dependency Injection**
* **Structured Concurrency**

---

## 📁 Project Structure

```
ECommerceApp/
├── App/                # App entry, RootView, Coordinator
├── Core/               # Networking, Storage, Global State
├── Modules/            # Feature-based modules (Auth, Home, Cart, etc.)
├── Shared/             # Reusable components & models
├── Resources/          # Assets, colors, fonts
├── Tests/              # Unit & UI tests
```

---

## 🧠 State Management

Uses a generic state pattern:

```swift
enum ViewState<T> {
    case idle
    case loading
    case success(T)
    case error(String)
}
```

Ensures:

* Single source of truth
* Predictable UI
* No inconsistent states

---

## 🌐 API

* Integrated with open-source API:
  https://fakestoreapi.com/

---

## 📸 Screenshots

> (Add screenshots here — Home, Product Detail, Cart, etc.)

---

## 🧪 Testing

* Unit tests for ViewModels
* UI tests for navigation flow

---

## 🛠️ Tech Stack

* Swift 5+
* SwiftUI
* Combine / Async-Await
* URLSession
* UserDefaults (local persistence)

---

## 📌 Key Highlights

* Clean and scalable architecture
* Real-world app structure (modular)
* Interview-ready implementation
* Focus on maintainability & testability

---

## 🤝 Contribution

Feel free to fork and contribute!

---

## 👨‍💻 Author

**Your Name**
iOS Developer

---
