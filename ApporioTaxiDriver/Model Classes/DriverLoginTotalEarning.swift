//
//  TotalEarning.swift
//
//  Created by apple on 2/5/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverLoginTotalEarning: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let totalEarning = "total_earning"
    static let totalRide = "total_ride"
    static let rating = "rating"
  }

  // MARK: Properties
  public var totalEarning: String?
  public var totalRide: Int?
  public var rating: String?

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
    totalEarning <- map[SerializationKeys.totalEarning]
    totalRide <- map[SerializationKeys.totalRide]
    rating <- map[SerializationKeys.rating]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = totalEarning { dictionary[SerializationKeys.totalEarning] = value }
    if let value = totalRide { dictionary[SerializationKeys.totalRide] = value }
    if let value = rating { dictionary[SerializationKeys.rating] = value }
    return dictionary
  }

}
