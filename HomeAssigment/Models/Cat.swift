//
//  Cat.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

import Foundation

struct Cat: Decodable, Identifiable {
  let id: String
  let tags: [String]
  let owner: String
  let createdAt: Date
  let updatedAt: Date
  
  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case tags, owner, createdAt, updatedAt
  }
}
