import SwiftUI

struct EditInfoView: View {
    var plant:Plant
    var listImageData: [Data] = []
    @State var state: [CardViewModel] = []
    init( plant: Plant) {
        self.plant = plant
        listImageData = PlantViewModel.instance.getPlantImagesData(plant: plant)
    }
    var body: some View {
        VStack{
            AddInfoScreen(nameText: plant.name!,
                          descriptionText: plant.information!,
                          category: Category.init(rawValue: plant.category!),
                          frequency: Frequency.init(rawValue: plant.watering_frequency!) ,
                          isDisabled: false,
                          selectedPhotosData: listImageData, noticationList: $state, plant: plant, isEdit: true )
        }
    }
}
