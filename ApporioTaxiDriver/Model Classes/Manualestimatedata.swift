//
//  Manualestimatedata.swift
//
//  Created by Gyanender on 18/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Manualestimatedata: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let amount = "amount"
    static let time = "time"
    static let distance = "distance"
  }

  // MARK: Properties
  public var amount: String?
  public var time: String?
  public var distance: String?

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
    amount <- map[SerializationKeys.amount]
    time <- map[SerializationKeys.time]
    distance <- map[SerializationKeys.distance]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = amount { dictionary[SerializationKeys.amount] = value }
    if let value = time { dictionary[SerializationKeys.time] = value }
    if let value = distance { dictionary[SerializationKeys.distance] = value }
    return dictionary
  }

}
