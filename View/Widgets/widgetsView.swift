import WidgetKit
import SwiftUI

struct widgetsView: View {
    
    var entry: widgetProvider.Entry
    var days: Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let currDate = Date()
        let diploma = dateFormatter.date(from: "18.05.2027")
        let date = Calendar.current.dateComponents([.day], from: currDate, to: diploma!).day ?? 0
        return date
    }
    var body: some View {
        VStack(alignment: .center){
            HStack{
                Text("Дней до диплома: \(days)")
            }
            .font(.title3)
            .bold()
            .padding(.bottom, 8)
            
            Text(entry.diploma)
                .font(.headline)

            
            Spacer()
            Text("\(entry.icon)")


        }
        .foregroundStyle(.white)

        
        .containerBackground(for: .widget){
            /* FIRE
            Color(#colorLiteral(red: 0.0836489899, green: 0.0115817513, blue: 0.004329816208, alpha: 1))
            Circle()
                .fill(Color(#colorLiteral(red: 1, green: 0.1803079459, blue: 0.08132103552, alpha: 1)))
                .blur(radius: 40, opaque: false)
                .offset(y:0)
            Ellipse()
                .fill(Color(#colorLiteral(red: 1, green: 0.7293782458, blue: 0.09560707161, alpha: 1)))
                .frame(width: 100, height:  60)
                .blur(radius:15, opaque: false)
                .offset(y:55)
            Ellipse()
                .fill(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
                .frame(width: 100, height:  60)
                .blur(radius:20, opaque: false)
                .offset(y:30)
             */
            /* GREEN
            Color(#colorLiteral(red: 0.0836489899, green: 0.0115817513, blue: 0.004329816208, alpha: 1))
            Circle()
                .fill(Color(#colorLiteral(red: 0.2457480216, green: 1, blue: 0, alpha: 1)))
                .blur(radius: 40, opaque: false)
                .offset(y:0)
            Ellipse()
                .fill(Color(#colorLiteral(red: 0.8854321515, green: 0.8880783275, blue: 0.8907039141, alpha: 1)))
                .frame(width: 100, height:  60)
                .blur(radius:15, opaque: false)
                .offset(y:55)
            Ellipse()
                .fill(Color(#colorLiteral(red: 0.6614063839, green: 0.8907039141, blue: 0.6050225735, alpha: 1)))
                .frame(width: 100, height:  60)
                .blur(radius:20, opaque: false)
                .offset(y:30)
             */
            Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            Circle()
                .fill(Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
                .blur(radius: 40, opaque: false)
                .offset(y:0)
            Ellipse()
                .fill(Color(#colorLiteral(red: 0.9733727531, green: 1, blue: 0.9502570766, alpha: 1)))
                .frame(width: 100, height:  60)
                .blur(radius:18, opaque: false)
                .offset(y:55)
            Ellipse()
                .fill(Color(#colorLiteral(red: 0.7209852012, green: 0.6759210631, blue: 1, alpha: 1)))
                .frame(width: 100, height:  60)
                .blur(radius:30, opaque: false)
                .offset(y:20)
        }
    }
}

#Preview(as: .systemMedium) {
    Widget_Extension()
} timeline: {
    widgetEntry(date: .now, diploma: "324 - Это как накормить 35345 ёжиков по очереди. Круто!", icon: "🧌")
}
 
