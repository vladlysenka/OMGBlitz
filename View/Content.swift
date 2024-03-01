// Created by Vlad Lysenka 01.03.2024

import SwiftUI


struct Content: View {
    
    @State private var store = Store()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(store.lists.indices, id: \.self) { index in
                    HScrollView(numbers: $store.lists[index])
                }
            }
            .onAppear {
                store.generateRandomLists()
                store.startUpdatingNumbers()
            }
        }
    }
}




#Preview {
    Content()
}
