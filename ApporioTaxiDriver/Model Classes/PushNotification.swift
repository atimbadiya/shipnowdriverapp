//
//  PushNotification.swift
//
//  Created by Atul Jain on 24/01/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct PushNotification: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let fireBase = "fire_base"
  }

  // MARK: Properties
  public var fireBase: Bool? = false

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
    fireBase <- map[SerializationKeys.fireBase]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.fireBase] = fireBase
    return dictionary
  }

}
