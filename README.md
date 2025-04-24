# vehicle_management_app

## 📱 Features

- 📲 **Phone Number Login with OTP Verification**
- 🔐 **JWT Authentication with Token Refresh**
- 📊 **Profit & Loss Dashboard (Today, Yesterday, Monthly)**
- 🧠 **State Management using Bloc**
- 📦 **Caching using SharedPreferences**
- 📴 **Offline support with cached data**
- 🔄 **Pull-to-Refresh support**
- 🌙 **Dark Mode UI**
- ❌ Graceful handling of loading, empty, and error states

---

## 🧰 Technologies Used

| Tech | Description |
|------|-------------|
| **Flutter** | Cross-platform UI toolkit |
| **Bloc** | State management |
| **Dio** | HTTP client for API integration |
| **flutter_secure_storage** | Secure storage for JWT tokens |
| **shared_preferences** | Caching PnL data for offline support |
| **jwt_decoder** | Decode and validate JWT tokens |

---

## 🗂️ Project Structure

```bash
lib/
├── blocs/              # Bloc & State Management
├── models/             # Data models
├── screens/            # UI screens
├── services/           # API service classes
├── utils/              # Helpers (base url, colours, functions)
├── widgets/            # Reusable UI components
