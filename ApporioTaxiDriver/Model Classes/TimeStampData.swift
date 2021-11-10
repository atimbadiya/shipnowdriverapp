//
//  Data.swift
//
//  Created by Atul Jain on 21/05/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct TimeStampData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let diffrance = "diffrance"
    static let currentTime = "current_time"
  }

  // MARK: Properties
  public var diffrance: Int?
  public var currentTime: Int?

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
    diffrance <- map[SerializationKeys.diffrance]
    currentTime <- map[SerializationKeys.currentTime]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = diffrance { dictionary[SerializationKeys.diffrance] = value }
    if let value = currentTime { dictionary[SerializationKeys.currentTime] = value }
    return dictionary
  }

}
