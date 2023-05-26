import SwiftUI

struct Navigation: View {
    // 1
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        HStack{
        Text("View Teste")
            // .navigationBarBackButtonHidden(true)
            .navigationTitle("")
            .toolbar {
//                ToolbarItem(placement: .primaryAction) {
//                    Button {
//                        presentationMode.wrappedValue.dismiss()
//                    } label: {
//                    Image("leftArrow")
//
//                    }
//                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("Topbar")
                }
                
            }
            }
    }
}

  
struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}

