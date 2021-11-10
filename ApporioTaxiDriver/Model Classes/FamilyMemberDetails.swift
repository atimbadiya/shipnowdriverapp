//
//  FamilyMemberDetails.swift
//
//  Created by Atul Jain on 19/09/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct FamilyMemberDetails: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let familyMemberAge = "family_member_age"
    static let familyMemberPhoneNumber = "family_member_phoneNumber"
    static let familyMemberName = "family_member_name"
    static let familyVisibility = "family_visibility"
  }

  // MARK: Properties
  public var familyMemberAge: String?
  public var familyMemberPhoneNumber: String?
  public var familyMemberName: String?
  public var familyVisibility: Bool? = false

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
    familyMemberAge <- map[SerializationKeys.familyMemberAge]
    familyMemberPhoneNumber <- map[SerializationKeys.familyMemberPhoneNumber]
    familyMemberName <- map[SerializationKeys.familyMemberName]
    familyVisibility <- map[SerializationKeys.familyVisibility]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = familyMemberAge { dictionary[SerializationKeys.familyMemberAge] = value }
    if let value = familyMemberPhoneNumber { dictionary[SerializationKeys.familyMemberPhoneNumber] = value }
    if let value = familyMemberName { dictionary[SerializationKeys.familyMemberName] = value }
    dictionary[SerializationKeys.familyVisibility] = familyVisibility
    return dictionary
  }

}
