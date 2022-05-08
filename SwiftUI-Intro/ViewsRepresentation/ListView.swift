import SwiftUI

struct Position: Identifiable {
    let id: Int
    let name: String
}

struct ListViewExample: View {
    let positions = [
        Position(id: 1, name: "First"),
        Position(id: 2, name: "Second"),
        Position(id: 3, name: "Third")
    ]
    
    var body: some View {
        HStack {
            List(positions, rowContent: { position in
                Text(position.name)
            }).listStyle(PlainListStyle())
            
            List(positions, rowContent: { position in
                Text(position.name)
            }).listStyle(InsetListStyle())
            
            List(positions, rowContent: { position in
                Text(position.name)
            }).listStyle(GroupedListStyle())
//
//            List(positions, rowContent: { position in
//                Text(position.name)
//            }).listStyle(InsetGroupedListStyle())
//
//            List(positions, rowContent: { position in
//                Text(position.name)
//            }).listStyle(SidebarListStyle())
        }
        .font(.largeTitle) // <1>
        .background(Color.pink)
    }
}

struct ListViewExample_Previews: PreviewProvider {
    static var previews: some View {
        ListViewExample()
    }
}
