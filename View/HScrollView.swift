// Created by Vlad Lysenka 01.03.2024 

import SwiftUI


struct HScrollView: View {
    
    @Binding var numbers: [Int]
    
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
