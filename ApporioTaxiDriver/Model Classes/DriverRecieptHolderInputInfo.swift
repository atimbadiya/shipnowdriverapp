//
//  HolderInputInfo.swift
//
//  Created by apple on 2/13/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverRecieptHolderInputInfo: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let fields = "fields"
    static let headlineMajorVisibility = "headline_major_visibility"
    static let headlineSmallTextVisibility = "headline_small_text_visibility"
    static let headlineMajorColor = "headline_major_color"
    static let headlineMajor = "headline_major"
    static let headlineSmallTextColor = "headline_small_text_color"
    static let headlineSmallTextStyle = "headline_small_text_style"
    static let headlineMajorStyle = "headline_major_style"
    static let headlineSmallText = "headline_small_text"
  }

  // MARK: Properties
  public var fields: [Fields]?
  public var headlineMajorVisibility: Bool? = false
  public var headlineSmallTextVisibility: Bool? = false
  public var headlineMajorColor: String?
  public var headlineMajor: String?
  public var headlineSmallTextColor: String?
  public var headlineSmallTextStyle: String?
  public var headlineMajorStyle: String?
  public var headlineSmallText: String?

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
    fields <- map[SerializationKeys.fields]
    headlineMajorVisibility <- map[SerializationKeys.headlineMajorVisibility]
    headlineSmallTextVisibility <- map[SerializationKeys.headlineSmallTextVisibility]
    headlineMajorColor <- map[SerializationKeys.headlineMajorColor]
    headlineMajor <- map[SerializationKeys.headlineMajor]
    headlineSmallTextColor <- map[SerializationKeys.headlineSmallTextColor]
    headlineSmallTextStyle <- map[SerializationKeys.headlineSmallTextStyle]
    headlineMajorStyle <- map[SerializationKeys.headlineMajorStyle]
    headlineSmallText <- map[SerializationKeys.headlineSmallText]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = fields { dictionary[SerializationKeys.fields] = value.map { $0.dictionaryRepresentation() } }
    dictionary[SerializationKeys.headlineMajorVisibility] = headlineMajorVisibility
    dictionary[SerializationKeys.headlineSmallTextVisibility] = headlineSmallTextVisibility
    if let value = headlineMajorColor { dictionary[SerializationKeys.headlineMajorColor] = value }
    if let value = headlineMajor { dictionary[SerializationKeys.headlineMajor] = value }
    if let value = headlineSmallTextColor { dictionary[SerializationKeys.headlineSmallTextColor] = value }
    if let value = headlineSmallTextStyle { dictionary[SerializationKeys.headlineSmallTextStyle] = value }
    if let value = headlineMajorStyle { dictionary[SerializationKeys.headlineMajorStyle] = value }
    if let value = headlineSmallText { dictionary[SerializationKeys.headlineSmallText] = value }
    return dictionary
  }

}
