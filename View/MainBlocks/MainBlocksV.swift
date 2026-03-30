//
//  MainBlocksV.swift
//  Tempus Fugit
//
//  Created by Сергей Мельников on 27.03.2026.
//

import SwiftUI

struct TermBlock: View {
    @State var isOpened = false
    var term: String
    var explanation: String
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
            let k = (100.0 - (0.03 * Double(sumLength))) / 100.0 //TODO: написать человеческое объяснение данной лепнины
            return CGFloat(sumLength) * k
        } else {
            return termLength < 40 ? 70 : 25 * CGFloat(termLength) / 10.0
        }
    }
    var body: some View {
        RoundedRectangle(cornerRadius: 18)
            .fill(isOpened ? .green : .black)
            .padding(8)
            .frame(width: .infinity, height: height)
            .scaledToFit()
            .shadow(color: isOpened ? .green : .white, radius: 5)
            .overlay() {
                ZStack {
                    VStack {
                        HStack {
                            Image(systemName: "arrowtriangle.right.fill")
                            
                                .foregroundStyle(.white)
                                .rotationEffect(Angle(degrees: isOpened ? 90 : 0))
                            HStack {
                                withAnimation(.bouncy) {
                                    Text(term).bold()
                                        .foregroundStyle(.white)
                                    +
                                    Text("\n\(explanation) \(termLength + expLength)")
                                        .foregroundStyle(isOpened ? .white : .clear) //TODO: исправить некорректное отображение больших терминов
                                }
                            }
                            .offset(y:isOpened ? 0 : 21)


                            Spacer()
                        }
                        .padding(.leading, 35)
                        .padding(.trailing, 15)

                    }
                }
                //.animation(.bouncy, value: isOpened)
            }
            .animation(.bouncy, value: isOpened)
        
            .onTapGesture {
                withAnimation(.bouncy) {
                    isOpened.toggle()
                }
            }
    }
}


