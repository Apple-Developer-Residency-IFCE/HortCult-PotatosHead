//
//  ImagePickerComponent.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 14/06/23.
//

import SwiftUI
import PhotosUI

struct ImagePickerComponent: View {
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedPhotosData: [Data] = []
    
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing: 12){
                PhotosPicker(
                    selection: $selectedItems,
                    maxSelectionCount: 3,
                    matching: .images) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 120,height: 120)
                                .foregroundColor(Color("PhotoPickerBackground"))
                            Image("Add")
                                .resizable()
                                .frame(width: 36,height: 36)
                        }
                    }
                    .onChange(of: selectedItems) { newItems in
                        selectedPhotosData = []
                        for newItem in newItems {
                            Task {
                                if let data = try? await newItem.loadTransferable(type:Data.self) {
                                    selectedPhotosData.append(data)
                                }
                            }
                        }
                    }
                ForEach(0..<3, id: \.self) { i in
                    if selectedPhotosData.count > i{
                        let photoData = selectedPhotosData[i]
                        if let image = UIImage(data: photoData) {
                            ImageSpace(image: image)
                        }
                    } else {
                        ImageSpace()
                    }
                }
            }
        }
    }
}


struct ImagePickerComponentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Fotos")
                .font(.custom("Satoshi-Regular", size: 16))
                .foregroundColor(Color("buttonCardColor"))
                .padding(.horizontal, 20)
            
            ImagePickerComponent()
                .padding(.horizontal, 20)
        }
    }
}

struct ImagePickerComponent_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerComponentView()
    }
}
