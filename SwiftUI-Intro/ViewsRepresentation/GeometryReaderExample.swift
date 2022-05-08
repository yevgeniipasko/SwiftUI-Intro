import SwiftUI

struct GeometryReaderExample: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Rectangle()
                        .frame(width: 300, height: 300, alignment: .center)
                        .foregroundColor(.orange)
                }
            }
            .position(
                x: geometry.frame(in: .local).midX,
                y: 150 // The half of the rectangle
            )
        }
    }
}

struct GeometryReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderExample()
    }
}
