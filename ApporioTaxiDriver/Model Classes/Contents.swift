//
//  Contents.swift
//
//  Created by Atul Jain on 29/11/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Contents: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let en = "en"
  }

  // MARK: Properties
  public var en: String?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public mutating func mapping(map: Map) {
    en <- map[SerializationKeys.en]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = en { dictionary[SerializationKeys.en] = value }
    return dictionary
  }

}
