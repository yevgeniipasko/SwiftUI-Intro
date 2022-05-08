import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .leading).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

struct ButtonAndAnimation: View {
    @State private var showInformationLabel = false

    var body: some View {
        VStack {
            Button("Present rectangle") {
                withAnimation { showInformationLabel.toggle() }
            }
            if showInformationLabel {
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 40, height: 40, alignment: .center)
                    .transition(.moveAndFade)
            }
        }
    }
}

struct ButtonAndAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAndAnimation()
    }
}
