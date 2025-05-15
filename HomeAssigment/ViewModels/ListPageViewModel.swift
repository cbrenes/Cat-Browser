//
//  ListPageViewModel.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

import Foundation

@MainActor
class ListPageViewModel: ObservableObject {
  
  enum ListPageViewState {
    case idle
    case loading
    case success([Cat])
    case failure(AppError)
  }
  
  @Published var viewState: ListPageViewState = .idle
  
  private let dataSource: CatsDataSource
  private let dataSourceLimitCount = 10
  
  init(dataSource: CatsDataSource) {
    self.dataSource = dataSource
  }
  
  func loadDataSource() async {
    if case .loading = viewState { return }
    viewState = .loading
    do {
      let cats = try await dataSource.fetchCats(limit: dataSourceLimitCount)
      viewState = .success(cats)
    } catch let error as URLError {
      handleErrors(error: error)
    } catch {
      viewState = .failure(.unknown)
    }
  }
  
  private func handleErrors(error: URLError) {
    switch error.code {
    case .notConnectedToInternet:
      viewState = .failure(.noInternet)
    case .badServerResponse:
      viewState = .failure(.server)
    default:
      viewState = .failure(.unknown)
    }
  }
}
