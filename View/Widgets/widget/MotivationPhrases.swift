import Foundation

struct Motivation {
    var days: Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let currDate = Date()
        let diploma = dateFormatter.date(from: "18.05.2027")
        let date = Calendar.current.dateComponents([.day], from: currDate, to: diploma!).day ?? 0
        return date
    }
    
    var coolThings: [String] {  [
        "До диплома \(days) дней. Это как пробежать марафон \(days / 42) раз — финиш уже близко! 🏃",
        "До диплома \(days) дней. Это как выпить \(days / 2) чашек кофе — энергия на максимум! ☕",
        "До диплома \(days) дней. Это как накормить \(days * 180) ёжиков по очереди. Круто!",
    ]
    }
    var icon: [String] {
        [
            "😶‍🌫️",
            "😳",
            "🤯",
            "🥶",
            "🥸",
            "🏀",
            "😱",
            "😃",
            "🥹",
            "🙃",
            "🙂",
            "🤨",
            "🧐",
            "🤩",
            "🫠",
            "🙄",
            "🫨",
            "😲",
            "🫩",
            "😵‍💫",
            "🤮",
            "🤠",
            "🤏",
            "💋",
            "🫦",
            "🦷",
            "👁️",
            "🧌",
            "💅",
            "🌂",
            "🐸",
            "🐽",
        ]
    }
}

