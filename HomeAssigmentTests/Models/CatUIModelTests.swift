//
//  CatUIModelTests.swift
//  HomeAssigmentTests
//
//  Created by Cesar Brenes on 15/5/25.
//

import XCTest
@testable import HomeAssignment

final class CatUIModelTests: XCTestCase {
  
  func testFieldsWithTags() {
    let cat = Cat(
      id: "abc123",
      tags: ["cute", "sleepy"],
      owner: "Alice",
      createdAt: Date(),
      updatedAt: Date()
    )
    let model = CatUIModel(cat: cat)
    
    XCTAssertFalse(model.isTagsEmpty)
    XCTAssertTrue(model.idField.contains(cat.id))
    XCTAssertEqual(model.idField, "ID: abc123")
    XCTAssertEqual(model.ownerField, "Owner: Alice")
    XCTAssertTrue(model.createdAtFormatted.contains("Created at:"))
    XCTAssertTrue(model.updatedAtFormatted.contains("Updated at:"))
    XCTAssertEqual(model.tagsAsString, "Tags: cute, sleepy")
    XCTAssertEqual(model.imageURL?.absoluteString, "https://cataas.com/cat/\(cat.id)")
  }
  
  func testFieldsWithEmptyTags() {
    let cat = Cat(
      id: "xyz456",
      tags: [],
      owner: "Bob",
      createdAt: Date(),
      updatedAt: Date()
    )
    let model = CatUIModel(cat: cat)
    
    XCTAssertTrue(model.isTagsEmpty)
    XCTAssertEqual(model.tagsAsString, "Tags: ")
  }
}
