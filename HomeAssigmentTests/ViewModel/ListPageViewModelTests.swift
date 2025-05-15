//
//  ListPageViewModelTests.swift
//  HomeAssigmentTests
//
//  Created by Cesar Brenes on 15/5/25.
//

import XCTest
@testable import HomeAssignment

@MainActor
final class ListPageViewModelTests: XCTestCase {
    
  func testLoadDataSourceSuccess() async {
    let mock = MockCatsDataSource()
    mock.mockCats = [Cat(id: "1", tags: ["a"], owner: "Ana", createdAt: .now, updatedAt: .now)]
    let viewModel = ListPageViewModel(dataSource: mock)
    
    await viewModel.loadDataSource()
    
    if case .success(let cats) = viewModel.viewState {
      XCTAssertEqual(cats.count, 1)
      XCTAssertEqual(cats.first?.id, "1")
    } else {
      XCTFail("Expected success state")
    }
  }
  
  func testLoadDataSourceNoInternetError() async {
    let mock = MockCatsDataSource()
    mock.shouldFail = true
    mock.error = URLError(.notConnectedToInternet)
    let viewModel = ListPageViewModel(dataSource: mock)
    
    await viewModel.loadDataSource()
    
    if case .failure(let error) = viewModel.viewState {
      XCTAssertEqual(error, .noInternet)
    } else {
      XCTFail("Expected failure with .noInternet")
    }
  }
  
  func testLoadDataSourceServerError() async {
    let mock = MockCatsDataSource()
    mock.shouldFail = true
    mock.error = URLError(.badServerResponse)
    let viewModel = ListPageViewModel(dataSource: mock)
    
    await viewModel.loadDataSource()
    
    if case .failure(let error) = viewModel.viewState {
      XCTAssertEqual(error, .server)
    } else {
      XCTFail("Expected failure with .server")
    }
  }
  
  func testLoadDataSourceUnknownError() async {
    let mock = MockCatsDataSource()
    mock.shouldFail = true
    mock.error = NSError(domain: "Test", code: -999, userInfo: nil)
    let viewModel = ListPageViewModel(dataSource: mock)
    
    await viewModel.loadDataSource()
    
    if case .failure(let error) = viewModel.viewState {
      XCTAssertEqual(error, .unknown)
    } else {
      XCTFail("Expected failure with .unknown")
    }
  }
  
  func testDoesNotStartWhenAlreadyLoading() async {
    let mock = MockCatsDataSource()
    let viewModel = ListPageViewModel(dataSource: mock)
    viewModel.viewState = .loading
    
    await viewModel.loadDataSource()
    
    switch viewModel.viewState {
    case .loading:
      XCTAssertTrue(true)
    default:
      XCTFail("Expected viewState to remain .loading")
    }
  }
}
