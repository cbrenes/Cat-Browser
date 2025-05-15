//
//  CatRowView.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

import SwiftUI

struct CatRowView: View {
  let cat: CatUIModel
  
  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      Text(cat.idField)
        .font(.headline)
      if !cat.isTagsEmpty {
        Text(cat.tagsAsString)
          .font(.subheadline)
      }
      Text(cat.ownerField)
        .font(.subheadline)
      HStack(alignment: .center, spacing: 12) {
        Text(cat.createdAtFormatted)
          .multilineTextAlignment(.center)
          .font(.caption)
          .foregroundColor(.secondary)
        Spacer()
        Text(cat.updatedAtFormatted)
          .multilineTextAlignment(.center)
          .font(.caption)
          .foregroundColor(.secondary)
      } //: HStack
    } //: VStack
    .padding(.all, 16)
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}


#Preview {
  VStack(alignment: .leading) {
    CatRowView(cat: CatUIModel(cat: .init(id: "abcdre", tags: ["test1", "test2"], owner: "Raquel", createdAt: Date(), updatedAt: Date())))
    CatRowView(cat: CatUIModel(cat: .init(id: "abcdre", tags: ["test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8",  "test9","test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9", "test1", "test2", "test3", "test4", "test5", "test6", "test7", "test8", "test9"], owner: "Raquel", createdAt: Date(), updatedAt: Date())))
    CatRowView(cat: CatUIModel(cat: .init(id: "abcdre", tags: [], owner: "Raquel", createdAt: Date(), updatedAt: Date())))
  }
}
