import SwiftUI
import Kingfisher

struct YummlyList: View {
    @StateObject var viewModel: YummlyListViewModel

    var body: some View {
        NavigationView {
            List {
                Section(
                    header:
                        Text(
                            "The first section of the great yummlies"
                        )
                ) {
                    ForEach(
                        viewModel.feed,
                        id: \.display.displayName
                    ) { feedElement in
                        HStack {
                            NavigationLink(
                                destination: YummlyListDetailedView(viewModel: .init(model: feedElement))) {
                                    KFImage.url(URL(string: feedElement.display.images!.first!)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                        .scaledToFit()
                                        .cornerRadius(25)
                                    Text(feedElement.display.displayName ?? "Name")
                                }
                        }
                    }
                }
                .headerProminence(.standard)
            }
            .refreshable(action: {
                viewModel.refresh()
            })
            .listStyle(.insetGrouped)
            .navigationTitle("Yummly Feed")
            .onAppear {
                viewModel.refresh()
            }
        }
    }
}

struct YummlyList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = YummlyListViewModel()
        YummlyList(viewModel: viewModel)
    }
}
