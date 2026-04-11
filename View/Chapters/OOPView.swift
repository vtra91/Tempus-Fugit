import SwiftUI

struct OOPView: View {
    var body: some View {
        ZStack {

            Color(#colorLiteral(red: 0.0836489899, green: 0.0115817513, blue: 0.004329816208, alpha: 1))
                .ignoresSafeArea()
            Circle()
                .fill(Color(#colorLiteral(red: 1, green: 0.1803079459, blue: 0.08132103552, alpha: 1)))
                .blur(radius: 60, opaque: false)
                .offset(y:200)
            Ellipse()
                .fill(Color(#colorLiteral(red: 1, green: 0.7293782458, blue: 0.09560707161, alpha: 1)))
                .frame(width: 220, height:  150)
                .blur(radius:20, opaque: false)
                .offset(y:320)
            Ellipse()
                .fill(Color(#colorLiteral(red: 1, green: 0.7293782458, blue: 0.09560707161, alpha: 1)))
                .frame(width: 250, height:  170)
                .blur(radius: 40, opaque: false)
                .offset(y:250)
            
            VStack {
                Text("БУ")
                    .foregroundStyle(.white)
                Text("ГА")
                    .foregroundStyle(.white)
                Text("ГА")
                    .foregroundStyle(.white)

            }                    .font(.custom("Comic Sans MS", size: 60))
                .offset(y: -200)

            
        }
    }
}

#Preview {
    OOPView()
}
