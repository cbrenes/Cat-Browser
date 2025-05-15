//
//  CatUIModel.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

import Foundation

struct CatUIModel {
  private let cat: Cat
  
  init(cat: Cat) {
    self.cat = cat
  }
  
  var isTagsEmpty: Bool {
    return cat.tags.isEmpty
  }
  
  var idField: String {
    "\(String.localized(LocalizedStrings.CatUIModel.idField)) \(cat.id)"
  }
  
  var ownerField: String {
    "\(String.localized(LocalizedStrings.CatUIModel.ownerField)) \(cat.owner)"
  }
  
  var createdAtFormatted: String {
    "\(String.localized(LocalizedStrings.CatUIModel.createdAtField))\n\(format(date: cat.createdAt))"
  }
  
  var updatedAtFormatted: String {
    "\(String.localized(LocalizedStrings.CatUIModel.updatedAtField))\n\(format(date: cat.updatedAt))"
  }
  
  var tagsAsString: String {
    "\(String.localized(LocalizedStrings.CatUIModel.tagsField)) \(cat.tags.joined(separator: ", "))"
  }
  
  var imageURL: URL? {
    URL(string: "https://cataas.com/cat/\(cat.id)")
  }
  
  private func format(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter.string(from: date)
  }
}

