//
//  VehicleType.swift
//
//  Created by apple on 2/5/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct VehicleConfigureType: Mappable {
    

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let vehicleTypeName = "vehicleTypeName"
    static let vehicleTypeMapImage = "vehicleTypeMapImage"
    static let vehicleTypeImage = "vehicleTypeImage"
    static let id = "id"
    static let services = "services"
  }

  // MARK: Properties
  public var vehicleTypeName: String?
  public var vehicleTypeMapImage: String?
  public var vehicleTypeImage: String?
  public var id: Int?
  public var services: [VehicleConfigureServices]?

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
    vehicleTypeName <- map[SerializationKeys.vehicleTypeName]
    vehicleTypeMapImage <- map[SerializationKeys.vehicleTypeMapImage]
    vehicleTypeImage <- map[SerializationKeys.vehicleTypeImage]
    id <- map[SerializationKeys.id]
    services <- map[SerializationKeys.services]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = vehicleTypeName { dictionary[SerializationKeys.vehicleTypeName] = value }
    if let value = vehicleTypeMapImage { dictionary[SerializationKeys.vehicleTypeMapImage] = value }
    if let value = vehicleTypeImage { dictionary[SerializationKeys.vehicleTypeImage] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = services { dictionary[SerializationKeys.services] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
