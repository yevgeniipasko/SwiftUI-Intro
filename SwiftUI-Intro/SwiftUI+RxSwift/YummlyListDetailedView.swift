import SwiftUI
import Kingfisher

struct YummlyListDetailedView: View {
    @StateObject var viewModel: YummlyListDetailedViewModel

    var body: some View {
        VStack {
            KFImage.url(URL(string: viewModel.elementModel.display.images!.first!)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400, height: 250)
                .scaledToFit()
            Text(viewModel.elementModel.display.displayName!)
        }
    }
}
