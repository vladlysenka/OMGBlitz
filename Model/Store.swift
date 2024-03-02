// Created by Vlad Lysenka 01.03.2024 

import SwiftUI
import Observation


@Observable class Store {
    // MARK: - Properties : Свойства
    var lists = [[Int]]()
    
    private var timer: Timer?

    
    // MARK: - Functions : Функции
    /// Генерирует случайные списки чисел и присваивает их переменной lists.
    /// Генерация происходит только один раз при инициализации, если переменная lists пуста.
    func generateRandomLists() {
        guard lists.isEmpty else { return } // Генерировать списки только один раз при инициализации
        
        let numberOfLists = Int.random(in: 100...200) // Генерация случайного количества списков от 100 до 200
        var newLists = [[Int]]()
        
        // Создание списков
        for _ in 0..<numberOfLists {
            let randomNumbersCount = Int.random(in: 10...20) // Генерация случайного количества случайных чисел от 10 до 20 для каждого списка
            let randomNumbers = (0..<randomNumbersCount).map { _ in
                Int.random(in: 0...100) // Генерация случайного числа от 0 до 100
            }
            newLists.append(randomNumbers)
        }
        
        // Присваивание сгенерированных списков переменной lists
        self.lists = newLists
    }

    /// Начинает обновление чисел в списках через каждую секунду.
    /// Обновление происходит путем выбора случайного индекса в каждом списке и присваивания ему нового случайного числа.
    func startUpdatingNumbers() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            // Перебор всех списков
            for i in 0..<self.lists.count {
                // Выбор случайного индекса в текущем списке
                if let randomIndex = self.lists[i].indices.randomElement() {
                    // Обновление числа по случайному индексу в текущем списке
                    self.lists[i][randomIndex] = Int.random(in: 0...100)
                }
            }
        }
    }
}
