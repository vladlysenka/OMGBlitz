// Created by Vlad Lysenka 01.03.2024

import SwiftUI


struct Content: View {
    // MARK: - State : Cостояние
    @State private var lists = [[Int]]()
    
    
    // MARK: - Functions : Функции
    // Генерация случайных списков
    func generateRandomLists() {
        // Генерируем случайное количество списков от 100 до 200
        let numberOfLists = Int.random(in: 100...200)
        // Создаем указанное количество списков
        for _ in 0..<numberOfLists {
            // Генерируем случайное количество случайных чисел от 10 до 20 для каждого списка
            let randomNumbers = (0..<Int.random(in: 10...20)).map { _ in
                Int.random(in: 0...100) // Генерируем случайное число от 0 до 100
            }
            // Добавляем сгенерированный список в общий список списков
            self.lists.append(randomNumbers)
        }
    }
    
    // Начать обновление чисел в списках
    func startUpdatingNumbers() {
        // Запускаем таймер, который будет вызываться каждую секунду
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            // Перебираем все списки
            for i in 0..<self.lists.count {
                // Выбираем случайный индекс в текущем списке
                if let randomIndex = self.lists[i].indices.randomElement() {
                    // Обновляем число по случайному индексу в текущем списке
                    self.lists[i][randomIndex] = Int.random(in: 0...100)
                }
            }
        }
    }
    
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(lists.indices, id: \.self) { index in
                    HScrollView(numbers: self.$lists[index])
                }
            }
            .onAppear {
                generateRandomLists()
                startUpdatingNumbers()
            }
        }
    }
}



#Preview {
    Content()
}
