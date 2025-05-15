//
//  JsonCatServiceTest.swift
//  HomeAssigmentTests
//
//  Created by Cesar Brenes on 15/5/25.
//

import XCTest
@testable import HomeAssignment

final class JsonCatServiceTest: XCTestCase {
  
  func testFetchCatsReturnsExpectedDataWithLimit() async throws {
    let service = JsonCatService(fileName: "catData")

    let cats = try await service.fetchCats(limit: 7)

    XCTAssertEqual(cats.count, 7)
    XCTAssertEqual(cats.first?.id, "rV1MVEh0Af2Bm4O0")
  }
  
  func testFetchCatsReturnsExpectedDataWithoutLimit() async throws {
    let service = JsonCatService(fileName: "catData")

    let cats = try await service.fetchCats(limit: nil)

    XCTAssertEqual(cats.count, 10)
    XCTAssertEqual(cats.first?.id, "rV1MVEh0Af2Bm4O0")
  }
  
  func testFetchCatsThrowsWhenFileIsMissing() async  {
    let service = JsonCatService(fileName: "nonexistent")
    do {
      _ = try await service.fetchCats(limit: 10)
      XCTFail("Expected to throw, but succeeded")
    } catch let error as URLError {
      XCTAssertEqual(error.code, .fileDoesNotExist)
    } catch {
      XCTFail("Unexpected error type: \(error)")
    }
  }
}
