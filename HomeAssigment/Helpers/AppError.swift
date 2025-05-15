//
//  AppError.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

import Foundation

enum AppError: Error, Equatable {
  case noInternet
  case server
  case unknown
  
  var message: String {
    switch self {
    case .noInternet:
      return .localized(LocalizedStrings.AppError.noInternet)
    case .server:
      return .localized(LocalizedStrings.AppError.server)
    case .unknown:
      return .localized(LocalizedStrings.AppError.unknown)
    }
  }
}

