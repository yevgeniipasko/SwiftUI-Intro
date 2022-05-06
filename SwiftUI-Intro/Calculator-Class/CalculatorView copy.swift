import SwiftUI

struct CalculatorView: View {

    @State var viewModel: CalculatorViewModel
    
    var body: some View {
            VStack {
                VStack {
                    HStack {
                        Text(viewModel.bindingString)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding([.all], 8)
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
                .background(.white)
                VStack {
                    Spacer()
                    VStack(alignment: .center) {
                        ForEach(viewModel.items, id: \.self) { row in
                            HStack(alignment: .top, spacing: 5) {
                                ForEach(row, id: \.self) { column in
                                    Button(action: {
                                        viewModel.buttonPressed(with: column)
                                    }, label: {
                                        Text(column)
                                        .font(.system(size: 25))
                                        .frame(
                                            idealWidth: 100,
                                            maxWidth: .infinity,
                                            idealHeight: 100,
                                            maxHeight: .infinity,
                                            alignment: .center
                                        )
                                        .foregroundColor(.gray)
                                    })
                                }
                            }
                        }
                    }
                }
                .background(Color.black)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    idealHeight: 414,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
            }
            .background(Color.black)
        }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CalculatorViewModel()
        CalculatorView(viewModel: viewModel)
    }
}
