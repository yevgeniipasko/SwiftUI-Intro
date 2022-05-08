import SwiftUI

struct ViewCombination: View {
    @State private var username: String = ""
    @State private var value: Float = 0

    var isEditing: Bool = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 4) {
                // Text exapmle
                ZStack {
                    VStack(spacing: 4) {
                        Text("Crestron 1")
                        Text("Crestron 2")
                    }
                    .padding() // this padding
                }
                .scaledToFit()
                .background(Color.blue)
                .padding(.top)
                
                // TextField example
                VStack(spacing: 4) {
                    TextField(
                        "TextField placeholder",
                        text: $username
                    )
                        .onSubmit {
                            print("Submited")
                        }
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .border(.secondary)
                }

                // Shapes exmple
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .center, spacing: 4) {
                        Rectangle()
                            .size(.init(width: 50, height: 50))
                            .foregroundColor(.blue)
                        Rectangle()
                            .size(.init(width: 50, height: 50))
                            .foregroundColor(.yellow)
                        Rectangle()
                            .size(.init(width: 50, height: 50))
                            .foregroundColor(.white)
                        Rectangle()
                            .size(.init(width: 50, height: 50))
                            .foregroundColor(.indigo)
                    }
                    .scaledToFit()
                    Ellipse()
                        .size(.init(width: 80, height: 50))
                        .foregroundColor(.red)
                }
                .frame(height: 104)
                .background(.green)
                Text("\(value)")
                Slider(
                    value: $value,
                    in: 0...100,
                    step: 5
                ) {
                    Text("Speed")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("100")
                }
                Spacer()
            }
            .navigationTitle("View examples")
        }
    }
}

struct ViewCombination_Previews: PreviewProvider {
    static var previews: some View {
        ViewCombination()
    }
}
