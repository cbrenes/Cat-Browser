//
//  LoadingPlaceholderView.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

import SwiftUI

struct LoadingPlaceholderView: View {
  let message: String?
  
  init(message: String? = nil) {
    self.message = message
  }
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.gray.opacity(0.1))
        .frame(width: 200, height: 200)
      
      VStack(spacing: 8) {
        ProgressView()
          .scaleEffect(1.3)
        if let message = message {
          Text(message)
            .font(.caption)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .padding(.all, 8)
        }
      } //:VStack
    } //:ZStack
    .frame(maxWidth: .infinity)
  }
}


#Preview {
  VStack(alignment: .leading) {
    LoadingPlaceholderView()
    LoadingPlaceholderView(message: "loading..")
  }
}
