import SwiftUI
import Foundation


struct TermBlock: View {
    @State var isOpened = false
    var imageList: [String]?
    var term: String
    var explanation: String
    var addLineCount: Double { explanation.reduce(0) {$0 + ($1 == "\n" ? 1 : 0)} } //Количество переносов текста на новую строку, вычисляется для корректного расчёта длины TermBlock
    var termLength: Int {
        let temp =  term.count
        return temp < 10 ? 25 : temp //Если у определения слишком короткое название, то искусственно увеличиваем его для корректного отображения TermBlock

    }
    var expLength: Int {
        explanation.count
    }
    var sumLength: CGFloat {
        CGFloat(termLength+expLength)
    }
    var height: CGFloat { // Если у термина название слишком большое и переходит на новую строку, то увеличиваем размер блока
        if isOpened {
            let k = (100.0 - (0.03 * Double(sumLength))) / 100.0 //Коэффициент k отражает, на какое число увеличивается длина блока пропорционально длине текста (необходимо для балансировки пустого места в TermBlock)
            return (CGFloat(sumLength) * k) + (addLineCount * 15.0) // Высота раскрытого TermBlock = (Количество символов в определении * Коэффициент регулировки) + (Количество переносов в строке * 15)
        } else {
            return termLength < 35 ? 70 : 70 + (20 * CGFloat(termLength) / 30.0)
        }
    }

    init(isOpened: Bool = false, imageList: [String]?, term: String, explanation: String) {
        self.isOpened = isOpened
        self.imageList = imageList
        self.term = term
        self.explanation = explanation
    }

    var body: some View {

                ZStack {
                    DisclosureGroup(term, isExpanded: $isOpened) {
                        Text(explanation)
                            .foregroundStyle(.white).bold()
                           
                        ForEach(imageList ?? [], id: \.self) {i in
                                Image(i)
                        }
                        
                       
                    }
                    .tint(.white)
                    .padding(.leading, 35)
                    .padding(.trailing, 15)
                    .padding(.vertical, 12)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isOpened.toggle()
                        }

                    }
                    .background() {
                        RoundedRectangle(cornerRadius: 18)
                            .fill(isOpened ? .green : .black)
                            .shadow(color: isOpened ? .green : .white, radius: 5)
                            .padding(.horizontal, 8)

                    }
                    .foregroundStyle(.white)
                    // .disclosureGroupStyle(customArrow())
                    
                    
                }
    }
}
