//
//  BaseClass.swift
//
//  Created by Atul Jain on 29/11/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct MainRecievedNotificationModel: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let contentAvailable = "content_available"
    static let alert = "alert"
    static let sound = "sound"
    static let badge = "badge"
    static let ridedata = "data"
    static let mutableContent = "mutable_content"
    static let contents = "contents"
  }

  // MARK: Properties
  public var contentAvailable: Bool? = false
  public var alert: String?
  public var sound: String?
  public var badge: Int?
  public var ridedata: RecievedNotificationModel?
  public var mutableContent: Bool? = false
  public var contents: Contents?

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
    contentAvailable <- map[SerializationKeys.contentAvailable]
    alert <- map[SerializationKeys.alert]
    sound <- map[SerializationKeys.sound]
    badge <- map[SerializationKeys.badge]
    ridedata <- map[SerializationKeys.ridedata]
    mutableContent <- map[SerializationKeys.mutableContent]
    contents <- map[SerializationKeys.contents]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.contentAvailable] = contentAvailable
    if let value = alert { dictionary[SerializationKeys.alert] = value }
    if let value = sound { dictionary[SerializationKeys.sound] = value }
    if let value = badge { dictionary[SerializationKeys.badge] = value }
    if let value = ridedata { dictionary[SerializationKeys.ridedata] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.mutableContent] = mutableContent
    if let value = contents { dictionary[SerializationKeys.contents] = value.dictionaryRepresentation() }
    return dictionary
  }

}
