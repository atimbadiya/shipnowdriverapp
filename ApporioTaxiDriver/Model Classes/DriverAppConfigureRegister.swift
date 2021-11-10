//
//  Register.swift
//
//  Created by apple on 2/21/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverAppConfigureRegister: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let phone = "phone"
    static let gender = "gender"
    static let email = "email"
    static let smoker = "smoker"
    static let emailVerification = "driver_email_otp"
    static let phoneVerification = "driver_phone_otp"
    static let driverCommissionChoice = "driver_commission_choice"
    
  }

  // MARK: Properties
  public var phone: Bool? = false
  public var gender: Bool? = false
  public var email: Bool? = false
  public var smoker: Bool? = false
  public var emailVerification: Bool? = false
  public var phoneVerification: Bool? = false
    public var driverCommissionChoice: Bool? = false

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
    phone <- map[SerializationKeys.phone]
    gender <- map[SerializationKeys.gender]
    email <- map[SerializationKeys.email]
    smoker <- map[SerializationKeys.smoker]
    emailVerification <- map[SerializationKeys.emailVerification]
    phoneVerification <- map[SerializationKeys.phoneVerification]
    driverCommissionChoice <- map[SerializationKeys.driverCommissionChoice]

  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.phone] = phone
    dictionary[SerializationKeys.gender] = gender
    dictionary[SerializationKeys.email] = email
    dictionary[SerializationKeys.smoker] = smoker
    dictionary[SerializationKeys.emailVerification] = emailVerification
    dictionary[SerializationKeys.phoneVerification] = phoneVerification
    return dictionary
  }

}

public struct DriverAppConfigureLogin: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let phone = "phone"
        static let email = "email"
    }
    
    // MARK: Properties
    public var phone: Bool? = false
    public var email: Bool? = false
    
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
        phone <- map[SerializationKeys.phone]
        email <- map[SerializationKeys.email]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        dictionary[SerializationKeys.phone] = phone
        dictionary[SerializationKeys.email] = email
        return dictionary
    }
    
}

