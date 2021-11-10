//
//  VehicleDocuments.swift
//
//  Created by Atul Jain on 04/07/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverPersonalVehicleDocuments: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let id = "id"
    static let documentVerificationStatus = "document_verification_status"
    static let uploadedAt = "uploaded_at"
    static let documentname = "documentname"
    static let image = "image"
    static let expireDate = "expire_date"
    static let statusColor = "status_color"
    static let tempdocupload = "temp_doc_upload"
  }

  // MARK: Properties
  public var status: String?
  public var id: Int?
  public var documentVerificationStatus: Int?
  public var uploadedAt: String?
  public var documentname: String?
  public var image: String?
  public var expireDate: String?
  public var statusColor: String?
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
    status <- map[SerializationKeys.status]
    id <- map[SerializationKeys.id]
    documentVerificationStatus <- map[SerializationKeys.documentVerificationStatus]
    uploadedAt <- map[SerializationKeys.uploadedAt]
    documentname <- map[SerializationKeys.documentname]
    image <- map[SerializationKeys.image]
    expireDate <- map[SerializationKeys.expireDate]
    statusColor <- map[SerializationKeys.statusColor]
    tempdocupload <- map[SerializationKeys.tempdocupload]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = documentVerificationStatus { dictionary[SerializationKeys.documentVerificationStatus] = value }
    if let value = uploadedAt { dictionary[SerializationKeys.uploadedAt] = value }
    if let value = documentname { dictionary[SerializationKeys.documentname] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = expireDate { dictionary[SerializationKeys.expireDate] = value }
    if let value = statusColor { dictionary[SerializationKeys.statusColor] = value }
    dictionary[SerializationKeys.tempdocupload] = tempdocupload
    return dictionary
  }

}
