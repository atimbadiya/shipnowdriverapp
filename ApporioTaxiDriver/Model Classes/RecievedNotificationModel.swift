//
//  BaseClass.swift
//
//  Created by apple on 2/9/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RecievedNotificationModel: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let type = "type"
    static let data = "data"
  }

  // MARK: Properties
  public var type: Int?
  public var data: RecievedNotificationData?

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
    type <- map[SerializationKeys.type]
    data <- map[SerializationKeys.data]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = data { dictionary[SerializationKeys.data] = value.dictionaryRepresentation() }
    return dictionary
  }

}
