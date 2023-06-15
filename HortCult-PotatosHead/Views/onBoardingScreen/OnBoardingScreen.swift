
import SwiftUI
import CoreData

struct OnBoardingScreen: View {
    @State private var isFirstLogin = false
    @State private var isNextScreenActive = false
    @ObservedObject var defaults: Defaults
    
    func firstLogin() {
        UserDefaults.standard.set(true, forKey: "isFirstLogin")
        self.isFirstLogin = true
    }
    
    var body: some View {
        if !self.isFirstLogin  {
            
            NavigationView {
                OnboardingScreen(header:"hortFruitLight",
                                 primaryText: "Boas vindas!",
                                 secondaryText: "Com o HortCult, você pode acompanhar a sua horta doméstica de forma simples e fácil",
                                 actionMainButton: {isNextScreenActive = true},
                                 mainButtonType: .one,
                                 hidenSecondaryButton: true)
                
                
                
                .background(NavigationLink(destination: OnboardingScreenTwo(defaults: defaults), isActive: $isNextScreenActive) { EmptyView()})
                
            }.navigationBarHidden(true)
            
        } else {
            Button("Concluir Primeiro") {
                print("Cebolinhas")
                print(self.isFirstLogin)
            }
            OnboardingScreenTwo(defaults: defaults)
        }
    }
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreen(defaults: Defaults())
    }
}
