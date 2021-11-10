//
//  Vehicle.swift
//
//  Created by Atul Jain on 18/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverDocumentListVehicle: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let documentStatus = "documentStatus"
    static let documentVerificationStatus = "document_verification_status"
    static let documentname = "documentname"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let createdAt = "created_at"
    static let expireDate = "expire_date"
    static let merchantId = "merchant_id"
    static let documentNeed = "documentNeed"
    static let drivervehicleID = "driver_vehicle_id"
  }

  // MARK: Properties
  public var documentStatus: String?
  public var documentVerificationStatus: Int?
  public var documentname: String?
  public var updatedAt: String?
  public var id: Int?
  public var createdAt: String?
  public var expireDate: Int?
  public var merchantId: String?
  public var documentNeed: Int?
    public var drivervehicleID: Int?

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
    documentStatus <- map[SerializationKeys.documentStatus]
    documentVerificationStatus <- map[SerializationKeys.documentVerificationStatus]
    documentname <- map[SerializationKeys.documentname]
    updatedAt <- map[SerializationKeys.updatedAt]
    id <- map[SerializationKeys.id]
    createdAt <- map[SerializationKeys.createdAt]
    expireDate <- map[SerializationKeys.expireDate]
    merchantId <- map[SerializationKeys.merchantId]
    documentNeed <- map[SerializationKeys.documentNeed]
    drivervehicleID <- map[SerializationKeys.drivervehicleID]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = documentStatus { dictionary[SerializationKeys.documentStatus] = value }
    if let value = documentVerificationStatus { dictionary[SerializationKeys.documentVerificationStatus] = value }
    if let value = documentname { dictionary[SerializationKeys.documentname] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = expireDate { dictionary[SerializationKeys.expireDate] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = documentNeed { dictionary[SerializationKeys.documentNeed] = value }
    if let value = drivervehicleID { dictionary[SerializationKeys.drivervehicleID] = value }
    return dictionary
  }

}
