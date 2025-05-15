//
//  JsonCatService.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

import Foundation

struct JsonCatService: CatsDataSource {
  
  let fileName: String
  
  init(fileName: String = "catData") {
    self.fileName = fileName
  }
  
  func fetchCats(limit: Int?) async throws -> [Cat] {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
      throw URLError(.fileDoesNotExist)
    }
    let data = try Data(contentsOf: url)
    let cats = try CustomJSONDecoder.decoder.decode([Cat].self, from: data)
    if let limit = limit {
      let safeLimit = max(limit, 0)
      return Array(cats.prefix(safeLimit))
    } else {
      return cats
    }
  }
}
