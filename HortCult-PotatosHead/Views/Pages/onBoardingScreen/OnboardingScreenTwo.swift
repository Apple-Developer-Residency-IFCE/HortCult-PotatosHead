import SwiftUI

struct OnboardingScreenTwo: View {
    @State private var isNextScreenActive = false
    @State private var jumpToInitalScreen = false
    @EnvironmentObject var defaults: Defaults
    var hortCultMain: HortCult_PotatosHeadApp?
    var body: some View {
        OnboardingScreen(header: "hortFruitLight",
                         centerImage: "onboardingtwolight",
                         primaryText: "Acompanhe a sua horta",
                         secondaryText: "Tenha uma visão geral do desenvolvimento das duas plantações",
                         actionMainButton: {isNextScreenActive = true},
                         mainButtonType: .two,
                         hidenSecondaryButton: false,
                         actionSecondaryButton: {
            jumpToInitalScreen = true
            HortCult_PotatosHeadApp.isFirstLogin = false
        })
        .background(
            NavigationLink(destination: OnboardingScreenThree(defaults: _defaults), isActive: $isNextScreenActive) { EmptyView()}
        )
        .background(
            NavigationLink(destination: MainView(defaults: _defaults), isActive: $jumpToInitalScreen) { EmptyView()}
        )
        .navigationBarHidden(true)
    }
}

struct OnboardingScreenTwo_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenTwo()
            .environmentObject(Defaults())
    }
}
