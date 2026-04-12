import SwiftUI
import CoreData
import SwiftUIIntrospect

struct MainScreen: View {
    @StateObject var vm = MainScreenVM()

    @State var pickedVUZI = "ВСЕ"
    var greeting: String {
        let time = DateFormatter()
        time.dateFormat = "HH:mm"
        let curr = Calendar.current.dateComponents([.hour, .minute], from: Date())
        switch curr.hour {
        case 6,7,8,9,10,11,12: return "Доброго утречка"
        case 13,14,15,16,17,18: return "Доброго дня"
        case 19,20,21,22,23: return "Добрый вечер"
        case 0,1,2,3,4,5: return "Доброй ночи"
        default: return "Доброго времени суток"
        }
    }
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
            Color("MainColors")
                .ignoresSafeArea()
            VStack {

                HStack {
                  Text("\(greeting), ")
                        .foregroundStyle(.white)
                        .font(.headline)
                    +
                  Text("\nVelstadt")
                        .foregroundStyle(.white)
                        .bold()
                        .font(.title)
                  Spacer()
                    Menu {
                        ForEach(vm.listOfVUZI) { option in
                            Button {
                                pickedVUZI = option.name
                            } label: {
                                HStack {
                                    Text(option.name).bold()
                                    Image(option.name)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: option.name == "ВСЕ" ? 15: 30)
                                    Spacer()
                                    if pickedVUZI == option.name {
                                        Image(systemName: "checkmark")
                                            .foregroundStyle(.blue)
                                    }
                                }
                            }
                        }
                    } label: {
                        HStack(spacing: 8) {
                            Text(pickedVUZI).foregroundStyle(.white).bold()
                            Image(pickedVUZI)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                        }
                        .padding(8)
                        .frame(maxWidth: 200)
                        .background {
                            RoundedRectangle(cornerRadius: 16).fill(.black)
                        }
                    }
                    .menuStyle(.borderlessButton)
                    .menuIndicator(.hidden)

                }
                .padding()
                
                Button(
                    action: {
                        
                    },
                    label: {
                        ZStack() {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(#colorLiteral(red: 0.118035827, green: 0.006031205873, blue: 0.0009314952345, alpha: 1)))
                                .frame(width: .infinity, height: 100)
                                .padding()

                                ZStack {
                                    VStack {
                                        
                                        Text("Итоговый тест")
                                            .font(.system(size: 28, design: .monospaced))
                                            .foregroundStyle(.white)
                                            .bold()
                                        Text("90 вопросов, 1.5 часа")
                                            .font(.system(size: 16))
                                            .foregroundStyle(.white)
                                            .bold()
                                    }
                                    .shadow(color:.orange, radius: 3)

                                    Circle()
                                        .fill(Color(#colorLiteral(red: 1, green: 0.1803079459, blue: 0.08132103552, alpha: 1)))
                                        .frame(width: 50, height: 50)
                                        .blur(radius: 10, opaque: false)
                                        .offset(x: -145, y:10)
                                    Ellipse()
                                        .fill(Color(#colorLiteral(red: 1, green: 0.7880430491, blue: 0.5573760829, alpha: 1)))
                                        .frame(width: 35, height:  20)
                                        .blur(radius:4, opaque: false)
                                      .offset(x: -145, y:25)
                                    Ellipse()
                                        .fill(Color(#colorLiteral(red: 1, green: 0.7293782458, blue: 0.09560707161, alpha: 1)))
                                        .frame(width: 35, height:  20)
                                        .blur(radius:5, opaque: false)
                                      .offset(x: -145, y:15)
                                    
                                    Circle()
                                        .fill(Color(#colorLiteral(red: 1, green: 0.1803079459, blue: 0.08132103552, alpha: 1)))
                                        .frame(width: 50, height: 50)
                                        .blur(radius: 10, opaque: false)
                                        .offset(x: 145, y:10)
                                    Ellipse()
                                        .fill(Color(#colorLiteral(red: 1, green: 0.7880430491, blue: 0.5573760829, alpha: 1)))
                                        .frame(width: 35, height:  20)
                                        .blur(radius:4, opaque: false)
                                      .offset(x: 145, y:25)
                                    Ellipse()
                                        .fill(Color(#colorLiteral(red: 1, green: 0.7293782458, blue: 0.09560707161, alpha: 1)))
                                        .frame(width: 35, height:  20)
                                        .blur(radius:5, opaque: false)
                                      .offset(x: 145, y:15)

                            }
                        }

                        
                    }
                )
                
                
                DisclosureGroup ("Главы") {
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        ForEach(0..<10) { i in
                            NavigationLink(value: vm.chapters[i]) {
                                ChapterBlock(chapterLink: vm.chapters[i])
                            }
                            
                        }
                    }
                }
                DisclosureGroup ("Тесты") {
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        ForEach(0..<10) { chapterName in
                            NavigationLink(value: vm.chapters[chapterName]) {
                                ChapterBlock(chapterLink: vm.chapters[chapterName])
                            }
                            
                        }
                    }
                }

            }
        }
        .navigationDestination(for: String.self) { name in
            switch name {
            case "БД": DBView()
            case "ТИПС":TIPSView()
            case "УПП":UPPView()
            case "ООП":OOPView()
            case "ОАП":OAPView()
            case "ИСС": ISSView()
            case "ИСТ":ISTView()
            case "ТИ": TIView()
            case "ИТ":ITView()
            case "ОС":OSView()
            default: ISSView()
                
            }
        }
        }

        .introspect(.navigationStack, on: .iOS(.v26, .v18)) {
            $0.viewControllers.forEach { controller in
                controller.view.backgroundColor = .clear
            }
        }
        }
    }
    //ISSView()

struct ChapterBlock: View {
    var chapterLink: String
    var chapterName: String {
        switch chapterLink {
        case "БД": "БАЗЫ ДАННЫХ"
        case "ТИПС": "ТЕОРИЯ ИНФОРМАЦИОННЫХ ПРОЦЕССОВ И СИСТЕМ"
        case "УПП": "УПРАВЛЕНИЕ ПРОГРАММНЫМИ ПРОЕКТАМИ"
        case "ООП": "ОБЪЕКТНО-ОРИЕНТИРОВАННОЕ ПРОГРАММИРОВАНИЕ"
        case "ОАП": "ОСНОВЫ АЛГОРИТМИЗАЦИИ И ПРОГРАММИРОВАНИЯ"
        case "ИСС": "ИНФОКОММУНИКАЦИОННЫЕ СИСТЕМЫ И СЕТИ"
        case "ИСТ": "ИНТЕЛЛЕКТУАЛЬНЫЕ СИСТЕМЫ И ТЕХНОЛОГИИ"
        case "ТИ": "ТЕОРИЯ ИНФОРМАЦИИ"
        case "ИТ": "ИНФОРМАЦИОННЫЕ ТЕХНОЛОГИИ"
        case "ОС": "ОПЕРАЦИОННЫЕ СИСТЕМЫ"
        default: "МАТЕМАТИКА ВИЛЕНКИН ЖОХОВ ЧЕСНОКОВ"
            
        }
    }
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(.green)
                .frame(width: 350,height: 64)
                .overlay() {
                    Text(chapterName)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.black)
                }
        }
    }
}

#Preview {
    MainScreen()
}



/*
VStack {
    Text("\"\(catchphrases.randomElement()!) \"")
        .font(.system(size: 26, weight: .bold))
        .foregroundStyle(.white)
        .multilineTextAlignment(.center)
    RoundedRectangle(cornerRadius: 25)
        .fill(.white)
        .frame(width: 150, height: 2)
    Text("\(popularActors.randomElement()!)")
        .font(.system(size: 20, weight: .bold))
        .foregroundStyle(.white)
        .multilineTextAlignment(.center)
}.padding()
    */
