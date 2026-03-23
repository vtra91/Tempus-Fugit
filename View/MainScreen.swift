import SwiftUI
import CoreData
import SwiftUIIntrospect

struct MainScreen: View {
    let catchphrases = [
            // Из литературы
            "Быть или не быть — вот в чём вопрос",
            "А судьи кто",
            "Счастливые часов не наблюдают",
            "Мы в ответе за тех, кого приручили",
            "Все счастливые семьи похожи друг на друга, каждая несчастливая семья несчастлива по-своему",
            "Человек — это звучит гордо",
            "Красота спасёт мир",
            "Любви все возрасты покорны",
            "Чем меньше женщину мы любим, тем легче нравимся мы ей",
            "А Васька слушает да ест",
            
            // Из кино
            "Я буду звонить тебе каждый день, а может быть, и ночью",
            "Наша служба и опасна, и трудна, и на первый взгляд как будто не видна",
            "Штирлиц, а вас я попрошу остаться",
            "Кто не работает, тот ест",
            "Деньги — это зло, но без них никак",
            "Я не волшебник, я только учусь",
            "Восток — дело тонкое",
            "С легким паром",
            "Жить хорошо, а хорошо жить — еще лучше",
            
            // Известные цитаты
            "Знание — сила",
            "Пришёл, увидел, победил",
            "Время — деньги",
            "Кто владеет информацией, тот владеет миром",
            "Движение — это жизнь",
            "После нас хоть потоп",
            "Цель оправдывает средства",
            "Человек человеку волк",
            "Хлеба и зрелищ",
            "Платон мне друг, но истина дороже",
            
            // Русские пословицы и поговорки
            "Без труда не выловишь и рыбку из пруда",
            "Век живи — век учись",
            "Глаза боятся, а руки делают",
            "Делу время, потехе час",
            "Как аукнется, так и откликнется",
            "Лучше синица в руках, чем журавль в небе",
            "Москва не сразу строилась",
            "На безрыбье и рак рыба",
            "Один в поле не воин",
            "Поспешишь — людей насмешишь",
            
            // Современные мемы и крылатые выражения
            "Жиза",
            "Кринж",
            "Рофл",
            "Краш",
            "Хайп",
            "Чекай",
            "Зашквар",
            "Токсичный",
            "Изи",
            "Пруф"
        ]
    let popularActors = [
        "Леонардо ДиКаприо",
        "Том Хэнкс",
        "Брэд Питт",
        "Джонни Депп",
        "Роберт Дауни-младший",
        "Киану Ривз",
        "Мэтт Дэймон",
        "Уилл Смит",
        "Дензел Вашингтон",
        "Хоакин Феникс",
        "Райан Гослинг",
        "Крис Хемсворт",
        "Роберт Паттинсон",
        "Том Харди",
        "Кристиан Бэйл",
        "Хью Джекман",
        "Джейк Джилленхол",
        "Брэдли Купер",
        "Адам Сэндлер",
        "Джордж Клуни"
    ]
    let chapters = [
        "БД",
        "ТИПС",
        "УПП",
        "ООП",
        "ОАП",
        "ИСС",
        "ИСТ",
        "ТИ",
        "ИТ",
        "ОС"
    ]

    var body: some View {
        NavigationStack {
        ZStack {
            Color("MainColors")
                .ignoresSafeArea()
            VStack {
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
                

                ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach(0..<10) { i in
                        NavigationLink(value: chapters[i]) {
                            ChapterBlock(chapterLink: chapters[i])
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

