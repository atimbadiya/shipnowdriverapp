//
//  ThemeConfiguration.swift
//
//  Created by Gyanender on 06/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct ThemeConfiguration: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let shareButtonColorDriver = "share_button_color_driver"
    static let chatButtonColorDriver = "chat_button_color_driver"
    static let primaryColorDriver = "primary_color_driver"
    static let cancelButtonColorDriver = "cancel_button_color_driver"
    static let callButtonColorDriver = "call_button_color_driver"
  }

  // MARK: Properties
  public var shareButtonColorDriver: String?
  public var chatButtonColorDriver: String?
  public var primaryColorDriver: String?
  public var cancelButtonColorDriver: String?
  public var callButtonColorDriver: String?

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
    shareButtonColorDriver <- map[SerializationKeys.shareButtonColorDriver]
    chatButtonColorDriver <- map[SerializationKeys.chatButtonColorDriver]
    primaryColorDriver <- map[SerializationKeys.primaryColorDriver]
    cancelButtonColorDriver <- map[SerializationKeys.cancelButtonColorDriver]
    callButtonColorDriver <- map[SerializationKeys.callButtonColorDriver]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = shareButtonColorDriver { dictionary[SerializationKeys.shareButtonColorDriver] = value }
    if let value = chatButtonColorDriver { dictionary[SerializationKeys.chatButtonColorDriver] = value }
    if let value = primaryColorDriver { dictionary[SerializationKeys.primaryColorDriver] = value }
    if let value = cancelButtonColorDriver { dictionary[SerializationKeys.cancelButtonColorDriver] = value }
    if let value = callButtonColorDriver { dictionary[SerializationKeys.callButtonColorDriver] = value }
    return dictionary
  }

}
