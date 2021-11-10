//
//  HolderData.swift
//
//  Created by Atul Jain on 17/06/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct NewEarningHolderData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let rightTextColor = "right_text_color"
    static let leftTextVisibility = "left_text_visibility"
    static let rightTextStyle = "right_text_style"
    static let rightTextVisibility = "right_text_visibility"
    static let rightText = "right_text"
    static let leftTextColor = "left_text_color"
    static let leftText = "left_text"
    static let leftTextStyle = "left_text_style"
  }

  // MARK: Properties
  public var rightTextColor: String?
  public var leftTextVisibility: Bool? = false
  public var rightTextStyle: String?
  public var rightTextVisibility: Bool? = false
  public var rightText: String?
  public var leftTextColor: String?
  public var leftText: String?
  public var leftTextStyle: String?

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
    rightTextColor <- map[SerializationKeys.rightTextColor]
    leftTextVisibility <- map[SerializationKeys.leftTextVisibility]
    rightTextStyle <- map[SerializationKeys.rightTextStyle]
    rightTextVisibility <- map[SerializationKeys.rightTextVisibility]
    rightText <- map[SerializationKeys.rightText]
    leftTextColor <- map[SerializationKeys.leftTextColor]
    leftText <- map[SerializationKeys.leftText]
    leftTextStyle <- map[SerializationKeys.leftTextStyle]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = rightTextColor { dictionary[SerializationKeys.rightTextColor] = value }
    dictionary[SerializationKeys.leftTextVisibility] = leftTextVisibility
    if let value = rightTextStyle { dictionary[SerializationKeys.rightTextStyle] = value }
    dictionary[SerializationKeys.rightTextVisibility] = rightTextVisibility
    if let value = rightText { dictionary[SerializationKeys.rightText] = value }
    if let value = leftTextColor { dictionary[SerializationKeys.leftTextColor] = value }
    if let value = leftText { dictionary[SerializationKeys.leftText] = value }
    if let value = leftTextStyle { dictionary[SerializationKeys.leftTextStyle] = value }
    return dictionary
  }

}
