import SwiftUI

struct NavigationExample: View {
    @State var shouldGoToTheNextScreen = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                NavigationLink(
                    "",
                    destination: ListViewExample(),
                    isActive: $shouldGoToTheNextScreen
                )
                Image(systemName: "arrow.right.circle")
                    .foregroundColor(.yellow)
                    .frame(width: 50, height: 50, alignment: .center)
                Text("Press the button to go to the next screen")
                    .font(.title)
                    .padding()
                Button("Go to the next screen") {
                    shouldGoToTheNextScreen.toggle()
                }
                Spacer()
            }
        }
    }
}

struct NavigationExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationExample()
            .previewInterfaceOrientation(.portrait)
    }
}
