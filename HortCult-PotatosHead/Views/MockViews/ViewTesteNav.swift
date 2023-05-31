import SwiftUI

struct ViewTesteNav: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            NavigationLink(destination: Navigation()) {
                Text("Teste a Navigation")
            }
        }
    }
}

struct ViewTesteNav_Previews: PreviewProvider {
    static var previews: some View {
        ViewTesteNav()
    }
}