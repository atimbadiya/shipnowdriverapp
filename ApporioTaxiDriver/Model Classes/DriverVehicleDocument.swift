//
//  DriverVehicleDocument.swift
//
//  Created by Gyanender on 16/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverVehicleDocument: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let documentName = "document_name"
    static let documentVerificationStatus = "document_verification_status"
    static let expireDate = "expire_date"
    static let driverVehicleId = "driver_vehicle_id"
    static let document = "document"
    static let documentId = "document_id"
  }

  // MARK: Properties
  public var id: Int?
  public var documentName: String?
  public var documentVerificationStatus: Int?
  public var expireDate: String?
  public var driverVehicleId: Int?
  public var document: String?
  public var documentId: Int?

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
    id <- map[SerializationKeys.id]
    documentName <- map[SerializationKeys.documentName]
    documentVerificationStatus <- map[SerializationKeys.documentVerificationStatus]
    expireDate <- map[SerializationKeys.expireDate]
    driverVehicleId <- map[SerializationKeys.driverVehicleId]
    document <- map[SerializationKeys.document]
    documentId <- map[SerializationKeys.documentId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = documentName { dictionary[SerializationKeys.documentName] = value }
    if let value = documentVerificationStatus { dictionary[SerializationKeys.documentVerificationStatus] = value }
    if let value = expireDate { dictionary[SerializationKeys.expireDate] = value }
    if let value = driverVehicleId { dictionary[SerializationKeys.driverVehicleId] = value }
    if let value = document { dictionary[SerializationKeys.document] = value }
    if let value = documentId { dictionary[SerializationKeys.documentId] = value }
    return dictionary
  }

}
