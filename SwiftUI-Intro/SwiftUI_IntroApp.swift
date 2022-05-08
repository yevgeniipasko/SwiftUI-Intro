import SwiftUI

@main
struct SwiftUI_IntroApp: App {
    var body: some Scene {
        WindowGroup {
            YummlyList(viewModel: YummlyListViewModel())
            //CalculatorView(viewModel: CalculatorViewModel())
        }
    }
}
