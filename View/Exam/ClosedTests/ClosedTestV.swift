import SwiftUI

struct ClosedTestV: View {
    var valueOfVariants = 4
    @State private var isRunning = false
        @State private var targetDate: Date?
        let duration: TimeInterval = 5400
    var body: some View {
        ZStack(alignment: .top) {
            Color("MainColors")
            VStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(#colorLiteral(red: 0.06813243777, green: 0.07932836562, blue: 0.1056924537, alpha: 1)))
                        .frame(height: 150)
                        .shadow(color: .white, radius: 1)
                    
                        .overlay {
                            Text("🔥 5")
                                .foregroundStyle(.orange)
                                .shadow(color:.orange, radius: 2)
                                .offset(y: 25)
                            
                            VStack {
                                HStack {
                                    Text("Time")
                                    Spacer()
                                    Text("Solved")
                                }
                                .foregroundStyle(.white)
                                .font(.system(size: 16))
                                HStack {
                                    if let target = targetDate {
                                                    TimelineView(.periodic(from: .now, by: 1)) { context in
                                                        let remaining = max(0, target.timeIntervalSince(context.date))
                                                        let mins = Int(remaining) / 60
                                                        let secs = Int(remaining) % 60
                                                        
                                                        Text(String(format: "%02d:%02d", mins, secs))
                                                            .foregroundStyle(.white)
                                                            .font(.system(size: 24, weight: .heavy, design: .rounded))
                                                    }
                                                } else {
                                                    Text("00:00")
                                                        .foregroundStyle(.white)
                                                        .font(.system(size: 24, weight: .heavy, design: .rounded))
                                                }
                                    Spacer()
                                    Text("28/150")
                                }
                                .foregroundStyle(.white)
                                .font(.system(size: 24, weight: .heavy, design: .rounded))
                                .onAppear() {
                                    targetDate = Date().addingTimeInterval(duration)
                                    isRunning.toggle()

                                }
                            }
                            .padding(.horizontal, 30)
                            .offset(y: 30)
                        }
                }
                .ignoresSafeArea()

                VStack(alignment: .leading) {
                    Text("Участники проекта - это:")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                        .padding(.bottom)
                    
                    ClosedQuestion()
                }
                
                .padding(.horizontal)
                Spacer()
                HStack {
                    Text("Назад")
                        .frame(width: 100, height: 70)
                        .background {
                            Color.red
                        }
                    TimelineView(.periodic(from: .now, by: 1)) { i in
                        Text("")
                            .frame(width: 100, height: 70)
                            .padding(.horizontal)
                            .background {
                                Color.gray
                            }
                        
                    }

                    
                    Text("Вперед")
                        .frame(width: 100, height: 70)
                        .background {
                            Color.green
                        }
                    
                }
                .foregroundStyle(.white).bold()
                .padding(.bottom, 50)
            }
        }
        .ignoresSafeArea()
    }
}

struct ClosedQuestion: View {
    var entities = [ "Потребители, для которых предназначался реализуемый проект",
                      "Заказчики, инвесторы, менеджер проекта и его команда",
                      "Физические и юридические лица, непосредственно задействованные в проекте или чьи интересы могут быть затронуты в ходе выполнения проекта"]
    var body: some View {
        ForEach(entities, id: \.self) { i in
            Question(variant: i)
                .padding(.bottom, 2)
        }
    }
}

struct Question: View {
    @State var tapped = false

    var variant: String
    var body: some View {
        VStack {
            Text(variant)
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .regular))
                .frame(maxWidth: .infinity)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.black.opacity(0.7) )
                        .stroke(.gray, lineWidth: tapped ? 2 : 0)

                }
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.1)) {
                tapped.toggle()
            }
        }
        .sensoryFeedback(.selection, trigger: tapped)

    }
}

#Preview {
    ClosedTestV()
}
