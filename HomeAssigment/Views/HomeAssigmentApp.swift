//
//  HomeAssignmentApp.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

import SwiftUI

@main
struct HomeAssignmentApp: App {
  var body: some Scene {
    WindowGroup {

      // ✅ Use local JSON file bundled with the app (default for testing/offline use)
      ListPageView(viewModel: ListPageViewModel(dataSource: JsonCatService()))

      // 🌐 To use remote API instead, comment out the line above and uncomment below
      // This fetches the same data from a live endpoint (Mocky)
      //ListPageView(viewModel: ListPageViewModel(dataSource: APICatService()))
    }
  }
}
