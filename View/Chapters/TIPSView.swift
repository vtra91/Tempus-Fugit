

import SwiftUI

struct TIPSView: View {
    @State var VM = TermsVM()
    
    var body: some View {
        Button("jajajja") {

        }
        .foregroundStyle(.white)
        .background(.red)
        //MARK: ForEach требует Identifiable в случаях реальных данных из БД, а Hashable - для неизменяемых значений
        ScrollView {
            ForEach(VM.termPlusDefenition) { i in
                TermBlock(imageList: i.images, term: i.term, explanation: i.definition)
            }
        }

    }
}

#Preview {
    TIPSView()
}
