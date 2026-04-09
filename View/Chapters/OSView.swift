import SwiftUI

struct OSView: View {
    var body: some View {
        ZStack {
            Color("MainColors")
                .ignoresSafeArea()
            VStack {
                Text("оперсион системас")
                    .foregroundStyle(.white)
                    .padding()
                
                ScrollView {
                   
                }

            }
        }
    }
}



struct AlertBlock: View {
    var body: some View {
        Text("HI")
    }
}

#Preview {
    OSView()
}

