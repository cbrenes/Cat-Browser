//
//  DetailPageView.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

import SwiftUI

struct DetailPageView: View {
  
  let cat: CatUIModel
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      CatRowView(cat: cat)
      if let imageURL = cat.imageURL {
        imageView(imageURL: imageURL)
      } else {
        placeholderImage
      }
      Spacer()
    } //: VStack
    .navigationTitle(LocalizedStringKey(LocalizedStrings.DetailPageView.title))
  }
  
  private func imageView(imageURL: URL) -> some View {
    AsyncImage(
      url: imageURL,
      transaction: Transaction(animation: .easeInOut)
    ) { phase in
      switch phase {
      case .empty:
        LoadingPlaceholderView(message: .localized(LocalizedStrings.DetailPageView.imageLoadingText))
      case .success(let image):
        image
          .resizable()
          .scaledToFit()
          .padding(.all, 16)
      case .failure:
        placeholderImage
      @unknown default:
        EmptyView()
      }
    }
  }
  
  private var placeholderImage: some View {
    VStack {
      Image(systemName: "photo.badge.exclamationmark.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100)
        .foregroundColor(.gray)
      Text(LocalizedStringKey(LocalizedStrings.DetailPageView.loadFailed))
        .foregroundColor(.secondary)
    }
    .frame(maxWidth: .infinity)
  }
}

#Preview {
  NavigationView {
    DetailPageView(cat: CatUIModel(cat: .init(id: "abcdre", tags: ["test1", "test2"], owner: "Raquel", createdAt: Date(), updatedAt: Date())))
  }
}
