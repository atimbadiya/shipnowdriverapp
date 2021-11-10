//
//  StaticValues.swift
//
//  Created by apple on 2/13/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverRecieptStaticValues: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let highlightedText = "highlighted_text"
    static let valueTextvisibility = "value_textvisibility"
    static let highlightedStyle = "highlighted_style"
    static let highlightedVisibility = "highlighted_visibility"
    static let smallTexotClor = "small_texot_clor"
    static let valueTextStyle = "value_text_style"
    static let smallTextVisibility = "small_text_visibility"
    static let smallTextColor = "small_text_color"
    static let smallTextStyle = "small_text_style"
    static let smallText = "small_text"
    static let valueTextColor = "value_text_color"
    static let valueText = "value_text"
    static let highlightedTextColor = "highlighted_text_color"
  }

  // MARK: Properties
  public var highlightedText: String?
  public var valueTextvisibility: Bool? = false
  public var highlightedStyle: String?
  public var highlightedVisibility: Bool? = false
  public var smallTexotClor: String?
  public var valueTextStyle: String?
  public var smallTextVisibility: Bool? = false
  public var smallTextColor: String?
  public var smallTextStyle: String?
  public var smallText: String?
  public var valueTextColor: String?
  public var valueText: String?
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
    valueTextvisibility <- map[SerializationKeys.valueTextvisibility]
    highlightedStyle <- map[SerializationKeys.highlightedStyle]
    highlightedVisibility <- map[SerializationKeys.highlightedVisibility]
    smallTexotClor <- map[SerializationKeys.smallTexotClor]
    valueTextStyle <- map[SerializationKeys.valueTextStyle]
    smallTextVisibility <- map[SerializationKeys.smallTextVisibility]
    smallTextColor <- map[SerializationKeys.smallTextColor]
    smallTextStyle <- map[SerializationKeys.smallTextStyle]
    smallText <- map[SerializationKeys.smallText]
    valueTextColor <- map[SerializationKeys.valueTextColor]
    valueText <- map[SerializationKeys.valueText]
    highlightedTextColor <- map[SerializationKeys.highlightedTextColor]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = highlightedText { dictionary[SerializationKeys.highlightedText] = value }
    dictionary[SerializationKeys.valueTextvisibility] = valueTextvisibility
    if let value = highlightedStyle { dictionary[SerializationKeys.highlightedStyle] = value }
    dictionary[SerializationKeys.highlightedVisibility] = highlightedVisibility
    if let value = smallTexotClor { dictionary[SerializationKeys.smallTexotClor] = value }
    if let value = valueTextStyle { dictionary[SerializationKeys.valueTextStyle] = value }
    dictionary[SerializationKeys.smallTextVisibility] = smallTextVisibility
    if let value = smallTextColor { dictionary[SerializationKeys.smallTextColor] = value }
    if let value = smallTextStyle { dictionary[SerializationKeys.smallTextStyle] = value }
    if let value = smallText { dictionary[SerializationKeys.smallText] = value }
    if let value = valueTextColor { dictionary[SerializationKeys.valueTextColor] = value }
    if let value = valueText { dictionary[SerializationKeys.valueText] = value }
    if let value = highlightedTextColor { dictionary[SerializationKeys.highlightedTextColor] = value }
    return dictionary
  }

}
