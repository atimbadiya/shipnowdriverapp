//
//  GeocodedWaypoints.swift
//
//  Created by Gyanender on 01/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct GeocodedWaypoints: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let placeId = "place_id"
    static let geocoderStatus = "geocoder_status"
    static let types = "types"
  }

  // MARK: Properties
  public var placeId: String?
  public var geocoderStatus: String?
  public var types: [String]?

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
    placeId <- map[SerializationKeys.placeId]
    geocoderStatus <- map[SerializationKeys.geocoderStatus]
    types <- map[SerializationKeys.types]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = placeId { dictionary[SerializationKeys.placeId] = value }
    if let value = geocoderStatus { dictionary[SerializationKeys.geocoderStatus] = value }
    if let value = types { dictionary[SerializationKeys.types] = value }
    return dictionary
  }

}
