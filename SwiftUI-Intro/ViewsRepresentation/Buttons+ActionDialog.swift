import SwiftUI

struct ButtonAndActionSheet: View {
    @State private var showInformationLabel = false
    @State private var showActionSheet = false

    var body: some View {
        VStack(alignment: .leading) {
            Button("Present detailed info") {
                showInformationLabel.toggle()
            }
            
            if showInformationLabel {
                Text("The information was hidden under SwiftUI button")
                    .font(.largeTitle)
            }
            
            Button("Show action sheet") {
                showActionSheet.toggle()
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(
                    title: Text("Action sheet title"),
                    message: Text("Info under action"),
                    buttons: [
                        .cancel(),
                        .destructive(
                            Text("Close action destructive"),
                            action: {
                                print("Action destructive")
                            }
                        ),
                        .default(
                            Text("Some action"),
                            action: {
                                print("On default action")
                            }
                        )
                    ]
                )
            }
        }
    }
}

struct ButtonAndActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAndActionSheet()
    }
}
