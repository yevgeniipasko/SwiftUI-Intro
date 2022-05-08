import SwiftUI

struct TextViewSwiftUIToUIKitExample: View {
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 50, alignment: .center)
    }
}

let hostingView = UIHostingController(rootView: TextViewSwiftUIToUIKitExample())
