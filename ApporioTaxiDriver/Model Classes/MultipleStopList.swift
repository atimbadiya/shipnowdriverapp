//
//  MultipleStopList.swift
//
//  Created by Atul Jain on 23/05/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct MultipleStopList: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let stop = "stop"
    static let status = "status"
    static let dropLatitude = "drop_latitude"
    static let dropLocation = "drop_location"
    static let dropLongitude = "drop_longitude"
  }

  // MARK: Properties
  public var stop: Int?
  public var status: String?
  public var dropLatitude: String?
  public var dropLocation: String?
  public var dropLongitude: String?

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
    stop <- map[SerializationKeys.stop]
    status <- map[SerializationKeys.status]
    dropLatitude <- map[SerializationKeys.dropLatitude]
    dropLocation <- map[SerializationKeys.dropLocation]
    dropLongitude <- map[SerializationKeys.dropLongitude]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = stop { dictionary[SerializationKeys.stop] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = dropLatitude { dictionary[SerializationKeys.dropLatitude] = value }
    if let value = dropLocation { dictionary[SerializationKeys.dropLocation] = value }
    if let value = dropLongitude { dictionary[SerializationKeys.dropLongitude] = value }
    return dictionary
  }

}
