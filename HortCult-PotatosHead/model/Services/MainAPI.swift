//
//  MainAPI.swift
//  HortCult-PotatosHead
//
//  Created by João Vitor Alves Holanda on 04/07/23.
//

import Foundation

struct Weather: Codable {
    var results: [WeatherEntry]
}

struct WeatherEntry: Codable, Identifiable {
    let id = UUID()
    var name: String
    var url: String
}

class Api {
    func getData(completation: @escaping([WeatherEntry]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { return }
        
        URLSession.shared.dataTask(with: url) {(data, reponse, error) in
            guard let data = data else { return }
            
            let WeatherList = try! JSONDecoder().decode(Weather.self, from: data)
            
            DispatchQueue.main.async {
                completation(WeatherList.results)
            }
            
        }.resume()
    }
}
