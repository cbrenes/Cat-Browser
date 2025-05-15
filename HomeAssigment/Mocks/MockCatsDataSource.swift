//
//  MockCatsDataSource.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

import Foundation

class MockCatsDataSource: CatsDataSource {
  var shouldFail: Bool = false
  var error: Error = URLError(.notConnectedToInternet)
  var mockCats: [Cat] = []
  
  func fetchCats(limit: Int?) async throws -> [Cat] {
    if shouldFail {
      throw error
    } else if let limit = limit {
      return Array(mockCats.prefix(limit))
    } else {
      return mockCats
    }
  }
}
