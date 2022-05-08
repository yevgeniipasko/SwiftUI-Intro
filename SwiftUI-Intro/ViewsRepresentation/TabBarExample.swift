import SwiftUI

struct TabBarExample: View {
    @State var shouldGoToTheNextScreen = false
    
    var body: some View {
        TabView {
            Rectangle()
                .foregroundColor(.green)
                .tabItem {
                    Label("Grren tab", systemImage: "circle.grid.cross.fill")
                }
                .ignoresSafeArea(.container, edges: .top)
            Rectangle()
                .foregroundColor(.yellow)
                .tabItem {
                    Label(
                        "Yellow tab",
                        systemImage: "r1.rectangle.roundedbottom.fill"
                    )
                }
                .ignoresSafeArea(.container, edges: .top)
            Rectangle()
                .foregroundColor(.red)
                .tabItem {
                    Label("Red tab", systemImage: "r.circle")
                }
                .ignoresSafeArea(.container, edges: .top)
        }
    }
}

struct TabBarExample_Previews: PreviewProvider {
    static var previews: some View {
        TabBarExample()
            .previewInterfaceOrientation(.portrait)
    }
}
