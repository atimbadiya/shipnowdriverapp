//
//  ExpiredPersonalDocuments.swift
//
//  Created by Gyanender on 16/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ExpiredPersonalDocuments: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let documentId = "document_id"
    static let documentFile = "document_file"
    static let documentVerificationStatus = "document_verification_status"
    static let documentExpiryDate = "document_expiry_date"
    static let documentName = "document_name"
  }

  // MARK: Properties
  public var documentId: Int?
  public var documentFile: String?
  public var documentVerificationStatus: Int?
  public var documentExpiryDate: String?
  public var documentName: String?

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
    documentId <- map[SerializationKeys.documentId]
    documentFile <- map[SerializationKeys.documentFile]
    documentVerificationStatus <- map[SerializationKeys.documentVerificationStatus]
    documentExpiryDate <- map[SerializationKeys.documentExpiryDate]
    documentName <- map[SerializationKeys.documentName]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = documentId { dictionary[SerializationKeys.documentId] = value }
    if let value = documentFile { dictionary[SerializationKeys.documentFile] = value }
    if let value = documentVerificationStatus { dictionary[SerializationKeys.documentVerificationStatus] = value }
    if let value = documentExpiryDate { dictionary[SerializationKeys.documentExpiryDate] = value }
    if let value = documentName { dictionary[SerializationKeys.documentName] = value }
    return dictionary
  }

}
