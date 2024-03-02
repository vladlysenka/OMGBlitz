// Created by Vlad Lysenka 01.03.2024 

import SwiftUI


struct HScrollView: View {
    // MARK: - Binding : Связывание
    @Binding var numbers: [Int]

    
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(numbers.indices, id: \.self) { index in
                    NumberGesture(number: $numbers[index])
                }
            }
            .padding(5)
        }
        .onAppear {
            // Обновление чисел в списке, когда он становится видимым
            let randomIndex = Int.random(in: 0..<numbers.count)
            numbers[randomIndex] = Int.random(in: 0...100)
        }
    }
}
