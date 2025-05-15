//
//  CatTests.swift
//  HomeAssigmentTests
//
//  Created by Cesar Brenes on 15/5/25.
//

import XCTest
@testable import HomeAssignment

final class CatTests: XCTestCase {
  
  let json = """
    [
       {
          "_id":"rV1MVEh0Af2Bm4O0",
          "tags":[
             "kitten",
             "several",
             "gif"
          ],
          "owner":"null",
          "createdAt":"Sun May 01 2022 20:57:11 GMT+0000 (Coordinated Universal Time)",
          "updatedAt":"Tue Oct 11 2022 07:52:32 GMT+0000 (Coordinated Universal Time)"
       }
    ]
    """
  
  func testCatJSONDecoding() throws {
    guard let jsonData = json.data(using: .utf8) else {
      XCTFail("invalid json")
      return
    }
    
    guard  let timeZone = TimeZone(secondsFromGMT: 0) else {
      XCTFail("The time zone is invalid")
      return
    }
    
    let cats = try CustomJSONDecoder.decoder.decode([Cat].self, from: jsonData)
    let calendar = Calendar(identifier: .gregorian)
    let components = calendar.dateComponents(in: timeZone, from: cats[0].createdAt)
    
    XCTAssertEqual(cats.count, 1)
    XCTAssertEqual(cats.first?.id, "rV1MVEh0Af2Bm4O0")
    XCTAssertEqual(cats.first?.tags, ["kitten", "several", "gif"])
    XCTAssertEqual(components.year, 2022)
    XCTAssertEqual(components.month, 5)
    XCTAssertEqual(components.day, 1)
    XCTAssertEqual(components.hour, 20)
    XCTAssertEqual(components.minute, 57)
    XCTAssertEqual(components.second, 11)
  }
  
}
