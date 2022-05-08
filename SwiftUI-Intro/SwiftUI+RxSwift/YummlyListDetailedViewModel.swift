import Foundation

class YummlyListDetailedViewModel: ObservableObject {
    @Published var elementModel: YummlyListFeedElementModel
    
    init(model: YummlyListFeedElementModel) {
        self.elementModel = model
    }
}
