import SwiftUI

struct ViewTesteNav: View {
    var body: some View {
        NavigationView {
            NavigationView {
                NavigationLink(destination: Navigation()) {
                    Text("Teste a Navigation")
                }
            }
        }
    }
}

struct ViewTesteNav_Previews: PreviewProvider {
    static var previews: some View {
        ViewTesteNav()
    }
}
