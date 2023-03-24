## March
Выполнены все части ТЗ, включая "необязательные".

 - Архитектура: **MVVM+Coordinator**
 - Координация: **FlowStacks**
 - Сетево слой: **Moya**
 - Локализация: **SwiftGen**
 - Хранение чувствительной информации локально: **KeychainSwift**
 - Загрузка изображений по URL: **KingFisher**
 - Декодер: **JSONDecoder**
 - Верстка: **SwiftUI**
 - Binding: **Combine**
 - Concurrency: **async/await**
 - Зависимости: **CocoaPods, SPM**
 
**Требования:**
 - iOS 14.0+
 - XCode 12.0+
 - Swift 5.x

 **Особенности задания:**
 -  UI на странице Paga1 обновляется одновременно после получения данных из 2 API, но! изображения загружаются после передачи данных на UI слой, асинхронно. Это намеренное решение, т.к. пользователь сможет уже взаимодействовать с данными, не дожидаюсь загрузки изображений. При необходимости, обновление UI можно сделать синхронно, после загрузки как данных, так и изображений.


![](https://github.com/AntonZyabkin/March/blob/main/media/March_.gif)
