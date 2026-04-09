import WidgetKit
import SwiftUI

struct widgetsView: View {
    
    var entry: widgetProvider.Entry
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: entry.icon)
                Text("Осталось днёв:")
            }
            .font(.title3)
            .bold()
            .padding(.bottom, 8)
            
            Text(entry.diploma)
                .font(.caption)
            
            Spacer()
            
            HStack{
                Spacer()
                Text("\(entry.icon)")
                    .font(.caption2)
                
            }
        }
        .foregroundStyle(.white)
        
        .containerBackground(for: .widget){
            Color.cyan
        }
    }
}
