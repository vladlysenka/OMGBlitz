// Created by Vlad Lysenka 01.03.2024 

import SwiftUI


struct NumberGesture: View {
    // MARK: - State : Cостояние
    @State private var scale: CGFloat = 1.0
    @State private var isPressed = false
    
    
    // MARK: - Binding : Связывание
    @Binding var number: Int

    
    // MARK: - Body
    var body: some View {
        Text("\(number)")
            .font(.system(size: 15, weight: .heavy, design: .rounded))
            .gesture(gesture)
            .frame(width: 50, height: 50)
            .background(.gray, in: .rect(cornerRadius: 12).stroke(lineWidth: 2))
            .scaleEffect(scale)
            .padding(5)
    }
    
    
    // MARK: - Gesture
    var gesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                withAnimation {
                    self.isPressed = true
                    self.scale = 0.8
                }
            }
            .onEnded { _ in
                withAnimation {
                    self.isPressed = false
                    self.scale = 1.0
                }
            }
    }
}


#Preview {
    @State var number: Int = 1
    return NumberGesture(number: $number)
}

