//
//  Receiving.swift
//
//  Created by apple on 2/21/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverAppConfigureReceiving: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let dropPoint = "drop_point"
    static let estimateFare = "estimate_fare"
  }

  // MARK: Properties
  public var dropPoint: Bool? = false
  public var estimateFare: Bool? = false

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
    dropPoint <- map[SerializationKeys.dropPoint]
    estimateFare <- map[SerializationKeys.estimateFare]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.dropPoint] = dropPoint
    dictionary[SerializationKeys.estimateFare] = estimateFare
    return dictionary
  }

}
