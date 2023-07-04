import SwiftUI

struct Navigation: View {
    @Environment(\.presentationMode) var presentationMode

    
//    var header: some View {
//        ZStack{
//
//
//            HStack{
//                Button(action: {
//                    self.presentationMode.wrappedValue.dismiss()
//                } ) {
//                    Image("leftArrow")
//                }
//                .padding(.leading, 12)
//                Spacer()
//            }
//        }
//    }
    
    var body: some View {
        VStack {
            
            CustomNavBar(hiddenDismissButton: false)
            
            Image("pana")
                .resizable()
                .frame(width: 200, height: 200)
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
//        .navigationBarItems(leading: header)
    }
}


struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}

