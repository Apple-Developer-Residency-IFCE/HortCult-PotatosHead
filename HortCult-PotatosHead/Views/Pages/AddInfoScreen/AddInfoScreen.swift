
import SwiftUI

struct AddInfoScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var imageViewModel: ImageViewModel
    @EnvironmentObject var notificationViewModel: NotificationViewModel
    @State private var isSelectedTab = 0
    @State private var isNextScreenActive = false
    @State var nameText: String = ""
    @State var descriptionText: String = ""
    @State var category: Category?
    @State var frequency: Frequency?
    @State var isDisabled: Bool = false
    @State var selectedPhotosData: [Data] = []
    @EnvironmentObject var defaults: Defaults
    var plant: Plant?
    @ObservedObject var plantViewModel: PlantViewModel
    @State var isEdit: Bool = false
    @State private var presentAlert = false
    @State private var addAlert = false
    @State private var editAlert = false
    //
    
    var body: some View {

            ZStack{
                VStack{
                    CustomNavBar(hiddenDismissButton: false)
                    
                    ScrollView{
                        
                        HStack {
                            Text(isEdit ? "Editar Informações" : "Adicionar Vegetal")
                                .font(.custom("Satoshi-Bold", size: 28))
                                .foregroundColor(Color("MainColor"))
                            Spacer()
                        }
                        .padding()
                        TextScreen(text: $nameText, description: $descriptionText, isEdit: false)
                            .padding(.bottom, 20)
                        CategoryDropDownView(selectedOption: $category)
                            .padding(.bottom, 20)
                        FrequencyDropDownView(selectedOption: $frequency)
                            .padding(.bottom, 20)
                        ImagePickerComponentView(selectedPhotosData: $selectedPhotosData)
                            .padding(.bottom, 110)
                        
                        
                    }
                    
                }.edgesIgnoringSafeArea(.all)
                
                VStack{
                    Spacer()
                    if (!isEdit){
                        if (!((frequency != nil) && (category != nil) && !nameText.isEmpty && !descriptionText.isEmpty)){
                            AddButton(isDisabled: true){}
                        } else {
                            AddButton(isDisabled: false) {
                                guard let frequencia = frequency?.rawValue else {return}
                                guard let categoria = category?.rawValue else {return}
                                guard let neewPlant  = plantViewModel.createPlant(name: nameText, category: categoria , information: descriptionText, watering_frequency: frequencia) else{return}
                                selectedPhotosData.forEach { Data in
                                    guard let newImage = imageViewModel.createImage(plantImage: Data) else {return}
                                    plantViewModel.addImageToPlant(plant: neewPlant, plantImage: newImage)
                                
                                }
                                addAlert = true
                                guard let newNotification = notificationViewModel.createNotification(next_time_to_alert: notificationViewModel.calculateNextWatering(wateringFrequency: frequency!), time_to_alert: "", type_to_alert: NotificationType.watering.rawValue) else {return}
                                plantViewModel.addNotificationToPlant(plant: neewPlant, notification: newNotification)
                                
                                
                            }
                            
                        }
                    } else {
                        if (!((frequency != nil) && (category != nil) && !nameText.isEmpty && !descriptionText.isEmpty)){
                            EditButton(isDisabled: true){}
                        }
                        else {
                            EditButton(isDisabled: false){
                                if(!isEdit){
                                    guard let frequencia = frequency?.rawValue else {return}
                                    guard let categoria = category?.rawValue else {return}
                                    guard plantViewModel.createPlant(name: nameText, category: categoria , information: descriptionText, watering_frequency: frequencia) != nil else {return}
                                    self.presentationMode.wrappedValue.dismiss()
                                } else {
                                    
                                    guard let frequencia = frequency?.rawValue else {return}
                                    guard let categoria = category?.rawValue else {return}
                                    guard let plant = plant else {return}
                                    
                                    plantViewModel.updatePlant(plant: plant, name: nameText, category: categoria , information: descriptionText, watering_frequency: frequencia)
                                    
                                    plant.plant_hortcult_images?.allObjects.forEach({ image in
                                        plantViewModel.removeImageToPlant(plant: plant, plantImage: (image as! Hortcult_Images))
                                    })
                                    
                                    selectedPhotosData.forEach { Data in
                                        guard let newImage = imageViewModel.createImage(plantImage: Data) else {return}
                                        plantViewModel.addImageToPlant(plant: plant, plantImage: newImage)
                                    }
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }
                    }
                }
                if presentAlert {
                    Color.black.opacity(0.1)
                        .edgesIgnoringSafeArea(.all)
                        .zIndex(0)
                }
                
                if addAlert {
                    AlertCustomView(alerta: .add)
                        .zIndex(1)
                        .onAppear{
                            presentAlert = true
                        }
                }
                
            }
            .padding(.bottom, 60)
            
        
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        
        
    }
}

struct AddInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddInfoScreen(plantViewModel: PlantViewModel(), isEdit: false)
            .environmentObject(Defaults())
    }
}

