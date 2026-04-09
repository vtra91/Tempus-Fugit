import SwiftUI

@Observable class TermsVM: Identifiable {
    var termPlusDefenition: [MainBlocksM] = []
    var dataTermsEntity =  dataTerms()
    
    func getTerms() {
        for i in dataTermsEntity.tuple {
            termPlusDefenition.append(MainBlocksM(term: i.0, definition: i.1, images: i.2))
        }
    }
    
    init() {
        getTerms()
    }
}
