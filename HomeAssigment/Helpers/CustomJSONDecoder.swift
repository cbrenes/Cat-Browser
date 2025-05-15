//
//  CustomJSONDecoder.swift
//  HomeAssigment
//
//  Created by Cesar Brenes on 15/5/25.
//

import Foundation

struct CustomJSONDecoder {
  
  static var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEE MMM dd yyyy HH:mm:ss 'GMT'Z (zzzz)"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }
  
  static var decoder: JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(CustomJSONDecoder.dateFormatter)
    return decoder
  }
}
