//
//  CatsDataSource.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

import Foundation

protocol CatsDataSource {
  func fetchCats(limit: Int?) async throws -> [Cat]
}
