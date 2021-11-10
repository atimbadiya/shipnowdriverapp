//
//  SubscriptionPackage.swift
//
//  Created by Atul Jain on 14/10/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct SubscriptionPackage: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let adminDelete = "admin_delete"
    static let updatedAt = "updated_at"
    static let price = "price"
    static let merchantId = "merchant_id"
    static let packageType = "package_type"
    static let serviceType = "service_type"
    static let maxTrip = "max_trip"
    static let id = "id"
    static let status = "status"
    static let createdAt = "created_at"
    static let packageDurationId = "package_duration_id"
  }

  // MARK: Properties
  public var adminDelete: Int?
  public var updatedAt: String?
  public var price: String?
  public var merchantId: Int?
  public var packageType: Int?
  public var serviceType: [ServiceType]?
  public var maxTrip: Int?
  public var id: Int?
  public var status: Int?
  public var createdAt: String?
  public var packageDurationId: Int?

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
    adminDelete <- map[SerializationKeys.adminDelete]
    updatedAt <- map[SerializationKeys.updatedAt]
    price <- map[SerializationKeys.price]
    merchantId <- map[SerializationKeys.merchantId]
    packageType <- map[SerializationKeys.packageType]
    serviceType <- map[SerializationKeys.serviceType]
    maxTrip <- map[SerializationKeys.maxTrip]
    id <- map[SerializationKeys.id]
    status <- map[SerializationKeys.status]
    createdAt <- map[SerializationKeys.createdAt]
    packageDurationId <- map[SerializationKeys.packageDurationId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = adminDelete { dictionary[SerializationKeys.adminDelete] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = price { dictionary[SerializationKeys.price] = value }
    if let value = merchantId { dictionary[SerializationKeys.merchantId] = value }
    if let value = packageType { dictionary[SerializationKeys.packageType] = value }
    if let value = serviceType { dictionary[SerializationKeys.serviceType] = value.map { $0.dictionaryRepresentation() } }
    if let value = maxTrip { dictionary[SerializationKeys.maxTrip] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = packageDurationId { dictionary[SerializationKeys.packageDurationId] = value }
    return dictionary
  }

}
