import SwiftUI

struct EditInfoView: View {
//    @State var nameText: String = "Tomatinho"
//    @State var descriptionText: String = "O tomate é um fruto rico em vitamina C, vitamina A, vitamina K e licopeno, que é um potente antioxidante, ajudando a manter a saúde da pele, fortalecer o sistema imunológico e evitar doenças cardiovasculares, como infarto e aterosclerose."
//    @State var category: Category
//    @State var frequency: Frequency
//    @State var isDisabled: Bool = false
    @ObservedObject var plantViewModel = PlantViewModel() // Use @StateObject instead of @ObservedObject in a non-View struct
    var plant:Plant
    var listImageData: [Data] = []
    init(plantViewModel: PlantViewModel = PlantViewModel(), plant: Plant) {
        self.plantViewModel = plantViewModel
        self.plant = plant
        listImageData = plantViewModel.getPlantImagesData(plant: plant)
    }
    var body: some View {
            AddInfoScreen(nameText: plant.name!,
                          descriptionText: plant.information!,
                          category: Category.init(rawValue: plant.category!),
                          frequency: Frequency.init(rawValue: plant.watering_frequency!) ,
                          isDisabled: false,
                          selectedPhotosData: listImageData, plant: plant, plantViewModel: plantViewModel, isEdit: true )
    }
}

//struct AddInfoScreenMock_Previews: PreviewProvider {
//    static var previews: some View {
//        EditInfoView(category: .legumes, frequency: .daily)
//    }
//}


