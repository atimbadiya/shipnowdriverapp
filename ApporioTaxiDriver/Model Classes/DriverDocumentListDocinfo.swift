//
//  Docinfo.swift
//
//  Created by Atul Jain on 18/02/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverDocumentListDocinfo: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let color = "color"
    static let message = "message"
    static let verificationstatus = "verification_status"
    static let title = "dialog_title"
    static let dialogmessage = "dialog_message"
  }

  // MARK: Properties
  public var color: String?
  public var message: String?
    public var verificationstatus: String?
    public var title: String?
    public var dialogmessage: String?

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
    color <- map[SerializationKeys.color]
    message <- map[SerializationKeys.message]
    verificationstatus <- map[SerializationKeys.verificationstatus]
    title <- map[SerializationKeys.title]
    dialogmessage <- map[SerializationKeys.dialogmessage]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = color { dictionary[SerializationKeys.color] = value }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = verificationstatus { dictionary[SerializationKeys.verificationstatus] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = dialogmessage { dictionary[SerializationKeys.dialogmessage] = value }
    return dictionary
  }

}
