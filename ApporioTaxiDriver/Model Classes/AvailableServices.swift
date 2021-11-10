//
//  AvailableServices.swift
//
//  Created by Atul Jain on 21/06/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct AvailableServices: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let serviceName = "serviceName"
    static let serviceId = "service_id"
  }

  // MARK: Properties
  public var serviceName: String?
  public var serviceId: Int?

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
    serviceName <- map[SerializationKeys.serviceName]
    serviceId <- map[SerializationKeys.serviceId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = serviceName { dictionary[SerializationKeys.serviceName] = value }
    if let value = serviceId { dictionary[SerializationKeys.serviceId] = value }
    return dictionary
  }

}
