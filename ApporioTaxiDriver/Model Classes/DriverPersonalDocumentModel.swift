//
//  DriverPersonalDocumentModel.swift
//
//  Created by Atul Jain on 04/07/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverPersonalDocumentModel: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let data = "data"
    static let message = "message"
    static let vehicleDocument = "vehicle_document"
    static let result = "result"
  }

  // MARK: Properties
  public var data: [DriverPersonalData]?
  public var message: String?
  public var vehicleDocument: [DriverPersonalVehicleDocument]?
  public var result: String?

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
    data <- map[SerializationKeys.data]
    message <- map[SerializationKeys.message]
    vehicleDocument <- map[SerializationKeys.vehicleDocument]
    result <- map[SerializationKeys.result]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = data { dictionary[SerializationKeys.data] = value.map { $0.dictionaryRepresentation() } }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = vehicleDocument { dictionary[SerializationKeys.vehicleDocument] = value.map { $0.dictionaryRepresentation() } }
    if let value = result { dictionary[SerializationKeys.result] = value }
    return dictionary
  }

}
