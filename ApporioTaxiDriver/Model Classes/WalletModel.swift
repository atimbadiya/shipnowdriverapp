//
//  WalletModel.swift
//
//  Created by Gyanender on 13/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct WalletModel: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let data = "data"
    static let message = "message"
    static let nextPageUrl = "next_page_url"
    static let result = "result"
    static let currentPage = "current_page"
    static let totalPages = "total_pages"
  }

  // MARK: Properties
  public var data: WalletData?
  public var message: String?
  public var nextPageUrl: String?
  public var result: String?
  public var currentPage: Int?
  public var totalPages: Int?

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
    nextPageUrl <- map[SerializationKeys.nextPageUrl]
    result <- map[SerializationKeys.result]
    currentPage <- map[SerializationKeys.currentPage]
    totalPages <- map[SerializationKeys.totalPages]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = data { dictionary[SerializationKeys.data] = value.dictionaryRepresentation() }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = nextPageUrl { dictionary[SerializationKeys.nextPageUrl] = value }
    if let value = result { dictionary[SerializationKeys.result] = value }
    if let value = currentPage { dictionary[SerializationKeys.currentPage] = value }
    if let value = totalPages { dictionary[SerializationKeys.totalPages] = value }
    return dictionary
  }

}
