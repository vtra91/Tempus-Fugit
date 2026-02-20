import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {

        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                ForEach(0..<20) { i in
                    Circle()
                        .fill(.red)
                }
            }
        }
        }
    }


#Preview {
    ContentView()
}

