# 🎬 Flutter Movies App  
**Мобильное приложение на Flutter с использованием чистой архитектуры (Clean Architecture + Feature-first)**  

---

## 📸 Скриншоты  
![screenshot_1](path_to_image)
![screenshot_2](path_to_image)

---

## 📖 Описание  
**Flutter Movies App** — приложение, построенное на принципах **чистой архитектуры**, с разделением на слои `Data / Domain / Presentation`.  
## 🚀 Реализованный функционал  
✔ Получение списков разных категорий фильмов на стартовой странице                            
✔ Cubit управление состояниями                                          
✔ Разделение приложения по слоям (Clean Architecture)                                    
✔ Подключение зависимостей через GetIt                                            

---

## 🧱 Стек технологий  
- **Flutter**  
- **Dart**  
- **Bloc (Cubit)**  
- **GetIt**  
- **Dio**  
- **Clean Architecture**  

---

## 📂 Структура проекта  
lib/                                                      
├── core/                                                   
│ └── di/                                
│ └── network/                                
│ └── theme/                                
├── features/                                             
│ └── movies/                                    
│ ├── data/                                                 
│ │ ├── datasources/                                 
│ │ ├── models/                                   
│ │ └── repositories/                                   
│ ├── domain/                                   
│ │ ├── entities/                                   
│ │ ├── repositories/                                   
│ │ └── usecases/                                   
│ └── presentation/                                   
│ ├── cubits/                                   
│ └── pages/                                   
│ └── widgets/                                   
└── main.dart                                   

---

## 📌 В планах реализации  
- 🔍 **Поиск фильмов**  
- 🎥 **Страница подробной информации о фильме**  
- ⭐ **Добавление фильмов в избранное (локальное хранилище)**  
- 🌓 **Поддержка тёмной и светлой темы**  
- 🌐 **Локализация**  
- 📱 **Адаптивная верстка под планшеты**  

---

## 💻 Установка и запуск  
```bash
git clone https://github.com/VladIsLuv-N/movies_app.git
cd movies_app
flutter pub get
flutter run
