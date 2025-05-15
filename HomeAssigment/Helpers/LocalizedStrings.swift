//
//  Untitled.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

enum LocalizedStrings {
  
  enum AppError {
    static let noInternet = "appError.noInternet"
    static let server = "appError.server"
    static let unknown = "appError.unknown"
  }
  
  enum ListPageView {
    static let title = "listPageView.title"
    static let placeholderLoading = "listPageView.placeholderLoading"
    static let retryButtonTitle = "listPageView.retryButtonTitle"
  }
  
  enum DetailPageView {
    static let title = "detailPageViewTitle"
    static let loadFailed = "detailPageViewFailed"
    static let imageLoadingText = "detailPageViewImageLoading"
  }
  
  enum CatUIModel {
    static let idField = "catUIModel.idField"
    static let ownerField = "catUIModel.ownerField"
    static let createdAtField = "catUIModel.createdAtField"
    static let updatedAtField = "catUIModel.updatedAtField"
    static let tagsField = "catUIModel.tagsField"
  }
}
