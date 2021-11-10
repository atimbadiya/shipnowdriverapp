//
//  Data.swift
//
//  Created by Atul Jain on 19/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct AddDocumentData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let updatedAt = "updated_at"
    static let documentFile = "document_file"
    static let id = "id"
    static let expireDate = "expire_date"
    static let documentVerificationStatus = "document_verification_status"
    static let createdAt = "created_at"
    static let driverId = "driver_id"
    static let documentId = "document_id"
  }

  // MARK: Properties
  public var updatedAt: String?
  public var documentFile: String?
  public var id: Int?
  public var expireDate: String?
  public var documentVerificationStatus: Int?
  public var createdAt: String?
  public var driverId: String?
  public var documentId: String?

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
    updatedAt <- map[SerializationKeys.updatedAt]
    documentFile <- map[SerializationKeys.documentFile]
    id <- map[SerializationKeys.id]
    expireDate <- map[SerializationKeys.expireDate]
    documentVerificationStatus <- map[SerializationKeys.documentVerificationStatus]
    createdAt <- map[SerializationKeys.createdAt]
    driverId <- map[SerializationKeys.driverId]
    documentId <- map[SerializationKeys.documentId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = documentFile { dictionary[SerializationKeys.documentFile] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = expireDate { dictionary[SerializationKeys.expireDate] = value }
    if let value = documentVerificationStatus { dictionary[SerializationKeys.documentVerificationStatus] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = driverId { dictionary[SerializationKeys.driverId] = value }
    if let value = documentId { dictionary[SerializationKeys.documentId] = value }
    return dictionary
  }

}
