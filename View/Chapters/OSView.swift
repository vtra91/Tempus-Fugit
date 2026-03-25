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
                        TextBlock(term: "Операционные системы", explanation: " - это предмет который ну короче эээ и вот и э")
                        TextBlock(term: "Григорий распутин", explanation: " - это lb,bk blbjn lehfr ghtlehjr")
                        TextBlock(term: "Кефир", explanation: " - это предмет который пить вкусно можно надо вот ")
                }
                .animation(.bouncy)

            }
        }
    }
}

struct TextBlock: View {
    @State var flag = false
    var term: String
    var explanation: String
    var body: some View {
            RoundedRectangle(cornerRadius: 18)
            .fill(flag ? .green : .black)
                .frame(width: 365, height: flag ? 155:50)
                .padding()
                .shadow(color: flag ? .green : .white, radius: 5)
                .overlay() {
                    ZStack {
                        RoundedRectangle(cornerRadius: 18)
                            .fill(flag ? Color("TextBlock") : .gray)
                            .frame(width: 345, height: flag ? 135 : 40)
                            .padding()
                            .animation(.bouncy, value: flag)
                        VStack {
                            HStack {
                                Image(systemName: "arrowtriangle.right.fill")
                                    .foregroundStyle(.white)
                                    .rotationEffect(Angle(degrees: flag ? 90 : 0))
                                HStack {
                                    Text(term).bold()           .foregroundStyle(.white)
                                    + Text(explanation) .foregroundStyle(flag ? .white : .clear)
                                }
                                .offset(y: flag ? 0 : 10 )
                                Spacer()
                            }
                            .padding(.leading, 35)
                            .padding(.trailing, 15)



                        }
                        
                        
                    }                            .animation(.bouncy, value: flag)

                    
                }
                .animation(.bouncy, value: flag)

                .onTapGesture {
                    flag.toggle()
                }


    }
}

struct AlertBlock: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

#Preview {
    OSView()
}
