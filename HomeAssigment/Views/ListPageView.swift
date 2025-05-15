//
//  ListPageView.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

import SwiftUI

struct ListPageView: View {
  
  @ObservedObject var viewModel: ListPageViewModel
  
  var body: some View {
    NavigationStack {
      Group {
        switch viewModel.viewState {
        case .loading, .idle:
          LoadingPlaceholderView(message: .localized(LocalizedStrings.ListPageView.placeholderLoading))
        case .success(let cats):
          loadedView(cats: cats)
        case .failure(let error):
          errorView(error: error)
        }
      } //: Group
      .navigationTitle(LocalizedStringKey(LocalizedStrings.ListPageView.title))
      .task {
        await viewModel.loadDataSource()
      }
    } //: NavigationStack
  }
  
  private func loadedView(cats: [Cat]) -> some View {
    List(cats) { cat in
      NavigationLink {
        DetailPageView(cat: CatUIModel(cat: cat))
      } label: {
        CatRowView(cat: CatUIModel(cat: cat))
      }
    } //: List
  }
  
  private func errorView(error: AppError) -> some View {
    VStack(spacing: 12) {
      Text(error.message)
        .font(.headline)
      Button(LocalizedStringKey(LocalizedStrings.ListPageView.retryButtonTitle)) {
        Task {
          await viewModel.loadDataSource()
        }
      }
      .buttonStyle(.borderedProminent)
    } //: VStack
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

#Preview("With Content") {
  ListPageView(viewModel: ListPageViewModel(dataSource: JsonCatService()))
}

#Preview("Internet error") {
  let mock = MockCatsDataSource()
  mock.shouldFail = true
  mock.error = URLError(.notConnectedToInternet)
  let viewModel = ListPageViewModel(dataSource: mock)
  return ListPageView(viewModel: viewModel)
}

#Preview("Server error") {
  let mock = MockCatsDataSource()
  mock.shouldFail = true
  mock.error = URLError(.badServerResponse)
  let viewModel = ListPageViewModel(dataSource: mock)
  return ListPageView(viewModel: viewModel)
}

#Preview("Unknown error") {
  let mock = MockCatsDataSource()
  mock.shouldFail = true
  mock.error = NSError(domain: "Test", code: -999, userInfo: nil)
  let viewModel = ListPageViewModel(dataSource: mock)
  return ListPageView(viewModel: viewModel)
}
