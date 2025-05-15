//
//  APICatService.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

import Foundation

struct APICatService: CatsDataSource {
  
  func fetchCats(limit: Int?) async throws -> [Cat] {
    let apiURL = Environment.API.baseURL + Environment.API.catsPath
    guard let url = URL(string: apiURL) else {
      throw URLError(.badURL)
    }
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
      throw URLError(.badServerResponse)
    }
    
    let cats = try CustomJSONDecoder.decoder.decode([Cat].self, from: data)
    if let limit = limit {
      return Array(cats.prefix(limit))
    }
    return cats
  }
}
