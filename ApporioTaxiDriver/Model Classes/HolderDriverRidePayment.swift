//
//  HolderDriverRidePayment.swift
//
//  Created by Atul Jain on 10/09/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct HolderDriverRidePayment: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let dialogText = "dialog_text"
    static let buttonText = "button_text"
    static let message = "message"
    static let messageColor = "message_color"
    static let visiblity = "visiblity"
  }

  // MARK: Properties
  public var dialogText: String?
  public var buttonText: String?
  public var message: String?
  public var messageColor: String?
  public var visiblity: Bool? = false

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
    dialogText <- map[SerializationKeys.dialogText]
    buttonText <- map[SerializationKeys.buttonText]
    message <- map[SerializationKeys.message]
    messageColor <- map[SerializationKeys.messageColor]
    visiblity <- map[SerializationKeys.visiblity]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = dialogText { dictionary[SerializationKeys.dialogText] = value }
    if let value = buttonText { dictionary[SerializationKeys.buttonText] = value }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = messageColor { dictionary[SerializationKeys.messageColor] = value }
    dictionary[SerializationKeys.visiblity] = visiblity
    return dictionary
  }

}
