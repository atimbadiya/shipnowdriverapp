//
//  MainScreenAdminMessageModel.swift
//
//  Created by Gyanender on 28/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct MainScreenAdminMessageModel: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let action = "action"
    static let show = "show"
    static let message = "message"
  }

  // MARK: Properties
  public var action: String?
  public var show: Bool? = false
  public var message: String?

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
    action <- map[SerializationKeys.action]
    show <- map[SerializationKeys.show]
    message <- map[SerializationKeys.message]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = action { dictionary[SerializationKeys.action] = value }
    dictionary[SerializationKeys.show] = show
    if let value = message { dictionary[SerializationKeys.message] = value }
    return dictionary
  }

}
