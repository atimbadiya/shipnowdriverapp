//
//  ReceiptData.swift
//
//  Created by Atul Jain on 26/12/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct RideDetailsReceiptData: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let highlightedText = "highlighted_text"
    static let valueTextStyle = "value_text_style"
    static let valueTextvisibility = "value_textvisibility"
    static let smallTextVisibility = "small_text_visibility"
    static let smallText = "small_text"
    static let smallTextColor = "small_text_color"
    static let highlightedStyle = "highlighted_style"
    static let highlightedVisibility = "highlighted_visibility"
    static let smallTextStyle = "small_text_style"
    static let valueText = "value_text"
    static let valueTextColor = "value_text_color"
    static let highlightedTextColor = "highlighted_text_color"
  }

  // MARK: Properties
  public var highlightedText: String?
  public var valueTextStyle: String?
  public var valueTextvisibility: Bool? = false
  public var smallTextVisibility: Bool? = false
  public var smallText: String?
  public var smallTextColor: String?
  public var highlightedStyle: String?
  public var highlightedVisibility: Bool? = false
  public var smallTextStyle: String?
  public var valueText: String?
  public var valueTextColor: String?
  public var highlightedTextColor: String?

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
    highlightedText <- map[SerializationKeys.highlightedText]
    valueTextStyle <- map[SerializationKeys.valueTextStyle]
    valueTextvisibility <- map[SerializationKeys.valueTextvisibility]
    smallTextVisibility <- map[SerializationKeys.smallTextVisibility]
    smallText <- map[SerializationKeys.smallText]
    smallTextColor <- map[SerializationKeys.smallTextColor]
    highlightedStyle <- map[SerializationKeys.highlightedStyle]
    highlightedVisibility <- map[SerializationKeys.highlightedVisibility]
    smallTextStyle <- map[SerializationKeys.smallTextStyle]
    valueText <- map[SerializationKeys.valueText]
    valueTextColor <- map[SerializationKeys.valueTextColor]
    highlightedTextColor <- map[SerializationKeys.highlightedTextColor]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = highlightedText { dictionary[SerializationKeys.highlightedText] = value }
    if let value = valueTextStyle { dictionary[SerializationKeys.valueTextStyle] = value }
    dictionary[SerializationKeys.valueTextvisibility] = valueTextvisibility
    dictionary[SerializationKeys.smallTextVisibility] = smallTextVisibility
    if let value = smallText { dictionary[SerializationKeys.smallText] = value }
    if let value = smallTextColor { dictionary[SerializationKeys.smallTextColor] = value }
    if let value = highlightedStyle { dictionary[SerializationKeys.highlightedStyle] = value }
    dictionary[SerializationKeys.highlightedVisibility] = highlightedVisibility
    if let value = smallTextStyle { dictionary[SerializationKeys.smallTextStyle] = value }
    if let value = valueText { dictionary[SerializationKeys.valueText] = value }
    if let value = valueTextColor { dictionary[SerializationKeys.valueTextColor] = value }
    if let value = highlightedTextColor { dictionary[SerializationKeys.highlightedTextColor] = value }
    return dictionary
  }

}
