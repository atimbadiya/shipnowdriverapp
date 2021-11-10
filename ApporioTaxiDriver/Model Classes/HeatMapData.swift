//
//  Data.swift
//
//  Created by apple on 3/5/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct HeatMapData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let pickupLongitude = "pickup_longitude"
    static let pickupLatitude = "pickup_latitude"
  }

  // MARK: Properties
  public var pickupLongitude: String?
  public var pickupLatitude: String?

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
    pickupLongitude <- map[SerializationKeys.pickupLongitude]
    pickupLatitude <- map[SerializationKeys.pickupLatitude]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = pickupLongitude { dictionary[SerializationKeys.pickupLongitude] = value }
    if let value = pickupLatitude { dictionary[SerializationKeys.pickupLatitude] = value }
    return dictionary
  }

}
