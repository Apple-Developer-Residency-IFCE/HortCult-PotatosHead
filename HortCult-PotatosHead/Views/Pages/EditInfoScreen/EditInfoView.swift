import SwiftUI

struct EditInfoView: View {
    @ObservedObject var plantViewModel = PlantViewModel()
    var plant:Plant
    var listImageData: [Data] = []
    @State var state: [CardViewModel] = []
    init(plantViewModel: PlantViewModel = PlantViewModel(), plant: Plant) {
        self.plantViewModel = plantViewModel
        self.plant = plant
        listImageData = plantViewModel.getPlantImagesData(plant: plant)
    }
    var body: some View {
        VStack{
            AddInfoScreen(nameText: plant.name!,
                          descriptionText: plant.information!,
                          category: Category.init(rawValue: plant.category!),
                          frequency: Frequency.init(rawValue: plant.watering_frequency!) ,
                          isDisabled: false,
                          selectedPhotosData: listImageData, noticationList: $state, plant: plant, plantViewModel: plantViewModel, isEdit: true )
        }
    }
}
