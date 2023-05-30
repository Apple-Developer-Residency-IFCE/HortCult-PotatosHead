
import SwiftUI
import CoreData

struct ContentView: View {
    @State private var isFirstLogin = false
    var managerVegetables: VegetableManeger = VegetableManeger()
    var itens: FetchedResults<Cebolitos>
    
    itens.forEach{ cebol in
        
    }
    var body: some View {
        if !self.isFirstLogin  {
            Button("Concluir Primeiro Login") {
                UserDefaults.standard.set(true, forKey: "isFirstLogin")
                self.isFirstLogin = true
                
            }
            FirstLogin().onAppear(){
                self.isFirstLogin = UserDefaults.standard.bool(forKey: "isFirstLogin")
            }
        } else {
            Button("Concluir Primeiro") {
                print("Cebolinhas")
                print(self.isFirstLogin)
            }
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
