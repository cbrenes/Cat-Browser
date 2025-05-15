//
//  String+Localized.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

import Foundation

/// A convenience method to fetch localized strings from the `Localizable.strings` file.
///
/// This method wraps `String(localized:)` and converts a plain `String` key into a
/// `String.LocalizationValue`, which is required by the localization API starting in iOS 15.
///
/// - Parameter key: The localization key defined in `Localizable.strings`.
/// - Returns: The localized string for the current locale.
///
/// ### Example
/// ```swift
/// let errorMessage = String.localized("app_error.no_internet")
/// print(errorMessage) // "No internet connection." (or localized equivalent)
/// ```
///
/// > Tip: Use this with centralized keys (e.g., `LocalizedStrings.AppError.noInternet`)
/// > to avoid raw strings scattered across the app.
extension String {
  static func localized(_ key: String) -> String {
    String(localized: String.LocalizationValue(key))
  }
}

