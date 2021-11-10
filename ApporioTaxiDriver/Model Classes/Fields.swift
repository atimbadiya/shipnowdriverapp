//
//  Fields.swift
//
//  Created by Atul Jain on 18/06/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Fields: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let fieldInfo = "field_info"
    static let fieldHint = "field_hint"
    static let fieldName = "field_name"
    static let fieldId = "field_id"
  }

  // MARK: Properties
  public var fieldInfo: String?
  public var fieldHint: String?
  public var fieldName: String?
  public var fieldId: Int?

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
    fieldInfo <- map[SerializationKeys.fieldInfo]
    fieldHint <- map[SerializationKeys.fieldHint]
    fieldName <- map[SerializationKeys.fieldName]
    fieldId <- map[SerializationKeys.fieldId]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = fieldInfo { dictionary[SerializationKeys.fieldInfo] = value }
    if let value = fieldHint { dictionary[SerializationKeys.fieldHint] = value }
    if let value = fieldName { dictionary[SerializationKeys.fieldName] = value }
    if let value = fieldId { dictionary[SerializationKeys.fieldId] = value }
    return dictionary
  }

}
