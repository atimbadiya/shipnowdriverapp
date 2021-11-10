//
//  Data.swift
//
//  Created by Atul Jain on 04/07/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverPersonalData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let updatedAt = "updated_at"
    static let documentname = "documentname"
    static let uploadedAt = "uploaded_at"
    static let statusColor = "status_color"
    static let documentNeed = "documentNeed"
    static let merchantId = "merchant_id"
    static let status = "status"
    static let documentStatus = "documentStatus"
    static let id = "id"
    static let documentVerificationStatus = "document_verification_status"
    static let expireDate = "expire_date"
    static let createdAt = "created_at"
    static let image = "image"
    static let tempdocupload = "temp_doc_upload"
  }

  // MARK: Properties
  public var updatedAt: String?
  public var documentname: String?
  public var uploadedAt: String?
  public var statusColor: String?
  public var documentNeed: Int?
  public var merchantId: Int?
  public var status: String?
  public var documentStatus: Int?
  public var id: Int?
  public var documentVerificationStatus: Int?
  public var expireDate: String?
  public var createdAt: String?
  public var image: String?
    public var tempdocupload: Bool? = false

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
    documentname <- map[SerializationKeys.documentname]
    uploadedAt <- map[SerializationKeys.uploadedAt]
    statusColor <- map[SerializationKeys.statusColor]
    documentNeed <- map[SerializationKeys.documentNeed]
    merchantId <- map[SerializationKeys.merchantId]
    status <- map[SerializationKeys.status]
    documentStatus <- map[SerializationKeys.documentStatus]
    id <- map[SerializationKeys.id]
    documentVerificationStatus <- map[SerializationKeys.documentVerificationStatus]
    expireDate <- map[SerializationKeys.expireDate]
    createdAt <- map[SerializationKeys.createdAt]
    image <- map[SerializationKeys.image]
    tempdocupload <- map[SerializationKeys.tempdocupload]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = documentname { dictionary[SerializationKeys.documentname] = value }
    if let value = uploadedAt { dictionary[SerializationKeys.uploadedAt] = value }
    if let value = statusColor { dictionary[SerializationKeys.statusColor] = value }
    if let value = documentNeed { dictionary[SerializationKeys.documentNeed] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = documentStatus { dictionary[SerializationKeys.documentStatus] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = documentVerificationStatus { dictionary[SerializationKeys.documentVerificationStatus] = value }
    if let value = expireDate { dictionary[SerializationKeys.expireDate] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    dictionary[SerializationKeys.tempdocupload] = tempdocupload
    return dictionary
  }

}
