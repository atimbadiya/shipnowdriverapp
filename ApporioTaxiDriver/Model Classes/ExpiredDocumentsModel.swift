//
//  ExpiredDocumentsModel.swift
//
//  Created by Gyanender on 16/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ExpiredDocumentsModel: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let expiryMessage = "expiry_message"
    static let expiryVisibility = "expiry_visibility"
    static let expiredPersonalDocuments = "expired_personal_documents"
    static let result = "result"
    static let expiredVehicleDocuments = "expired_vehicle_documents"
  }

  // MARK: Properties
  public var expiryMessage: String?
  public var expiryVisibility: Bool? = false
  public var expiredPersonalDocuments: [ExpiredPersonalDocuments]?
  public var result: String?
  public var expiredVehicleDocuments: [ExpiredVehicleDocuments]?

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
    expiryMessage <- map[SerializationKeys.expiryMessage]
    expiryVisibility <- map[SerializationKeys.expiryVisibility]
    expiredPersonalDocuments <- map[SerializationKeys.expiredPersonalDocuments]
    result <- map[SerializationKeys.result]
    expiredVehicleDocuments <- map[SerializationKeys.expiredVehicleDocuments]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = expiryMessage { dictionary[SerializationKeys.expiryMessage] = value }
    dictionary[SerializationKeys.expiryVisibility] = expiryVisibility
    if let value = expiredPersonalDocuments { dictionary[SerializationKeys.expiredPersonalDocuments] = value.map { $0.dictionaryRepresentation() } }
    if let value = result { dictionary[SerializationKeys.result] = value }
    if let value = expiredVehicleDocuments { dictionary[SerializationKeys.expiredVehicleDocuments] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
