import SwiftUI

struct EditInfoView: View {
//    @State var nameText: String = "Tomatinho"
//    @State var descriptionText: String = "O tomate é um fruto rico em vitamina C, vitamina A, vitamina K e licopeno, que é um potente antioxidante, ajudando a manter a saúde da pele, fortalecer o sistema imunológico e evitar doenças cardiovasculares, como infarto e aterosclerose."
//    @State var category: Category
//    @State var frequency: Frequency
//    @State var isDisabled: Bool = false
    @ObservedObject var plantViewModel = PlantViewModel() // Use @StateObject instead of @ObservedObject in a non-View struct
    var plant:Plant
    
    var body: some View {
        VStack{
            AddInfoScreen(nameText: plant.name!,
                          descriptionText: plant.information!,
                          category: Category.init(rawValue: plant.category!),
                          frequency: Frequency.init(rawValue: plant.watering_frequency!) ,
                          isDisabled: false,
                          plant: plant, plantViewModel: plantViewModel, isEdit: true)
        }
            // .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
    }
}

//struct AddInfoScreenMock_Previews: PreviewProvider {
//    static var previews: some View {
//        EditInfoView(category: .legumes, frequency: .daily)
//    }
//}


