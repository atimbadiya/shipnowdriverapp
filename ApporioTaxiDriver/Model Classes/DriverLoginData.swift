//
//  Data.swift
//
//  Created by apple on 3/19/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct DriverLoginData: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let bankName = "bank_name"
        static let phoneCode = "phone_code"
        static let profileImage = "profile_image"
        static let termStatus = "term_status"
        static let freeBusy = "free_busy"
        static let currentLatitude = "current_latitude"
        static let lastName = "last_name"
        static let driverVehicle = "DriverVehicle"
        static let id = "id"
        static let totalEarning = "totalEarning"
        static let password = "password"
        static let playerId = "player_id"
        static let allowOtherSmoker = "allow_other_smoker"
        static let walletMoney = "wallet_money"
        static let accountNumber = "account_number"
        static let signupStep = "signupStep"
        static let email = "email"
        static let phoneNumber = "phoneNumber"
        static let currentLongitude = "current_longitude"
        static let signupFrom = "signupFrom"
        static let driverAdminStatus = "driver_admin_status"
        static let smokerType = "smoker_type"
        static let countryId = "country_id"
        static let driverGender = "driver_gender"
        static let rating = "rating"
        static let selectedAddress = "selected_address"
        static let accountHolderName = "account_holder_name"
        static let anyDocumentExpire = "any_document_expire"
        static let loginLogout = "login_logout"
        static let countryAreaId = "country_area_id"
        static let firstName = "first_name"
        static let onlineOffline = "online_offline"
        static let homeLocationActive = "home_location_active"
        static let createdAt = "created_at"
        static let autoAcceptStatus = "auto_accept_enable"
        static let subscriptionComission = "subscription_wise_commission"
        static let driverComissionChoices = "driver_commission_choices"
        static let accounttypeid = "account_type_id"
        static let bsbnumber = "bsb_number"
        
    }
    
    // MARK: Properties
    public var bankName: String?
    public var phoneCode: String?
    public var profileImage: String?
    public var termStatus: Int?
    public var freeBusy: Int?
    public var currentLatitude: String?
    public var lastName: String?
    public var driverVehicle: [DriverLoginVehicles]?
    public var id: Int?
    public var totalEarning: DriverLoginTotalEarning?
    public var password: String?
    public var playerId: String?
    public var allowOtherSmoker: String?
    public var walletMoney: String?
    public var accountNumber: String?
    public var signupStep: String?
    public var email: String?
    public var phoneNumber: String?
    public var currentLongitude: String?
    public var signupFrom: String?
    public var driverAdminStatus: String?
    public var smokerType: String?
    public var countryId: String?
    public var driverGender: Int?
    public var rating: String?
    public var selectedAddress: String?
    public var accountHolderName: String?
    public var anyDocumentExpire: Bool? = false
    public var loginLogout: Int?
    public var countryAreaId: Int?
    public var firstName: String?
    public var onlineOffline: Int?
    public var homeLocationActive: String?
    public var createdAt: String?
    public var autoAcceptStatus: String?
    public var subscriptionComission: String?
    public var driverComissionChoices: [DriverCommissionChoices]?
    public var accounttypeid: String?
    public var bsbnumber: String?
    
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
        bankName <- map[SerializationKeys.bankName]
        phoneCode <- map[SerializationKeys.phoneCode]
        profileImage <- map[SerializationKeys.profileImage]
        termStatus <- map[SerializationKeys.termStatus]
        freeBusy <- map[SerializationKeys.freeBusy]
        currentLatitude <- map[SerializationKeys.currentLatitude]
        lastName <- map[SerializationKeys.lastName]
        driverVehicle <- map[SerializationKeys.driverVehicle]
        id <- map[SerializationKeys.id]
        totalEarning <- map[SerializationKeys.totalEarning]
        password <- map[SerializationKeys.password]
        playerId <- map[SerializationKeys.playerId]
        allowOtherSmoker <- map[SerializationKeys.allowOtherSmoker]
        walletMoney <- map[SerializationKeys.walletMoney]
        accountNumber <- map[SerializationKeys.accountNumber]
        signupStep <- map[SerializationKeys.signupStep]
        email <- map[SerializationKeys.email]
        phoneNumber <- map[SerializationKeys.phoneNumber]
        currentLongitude <- map[SerializationKeys.currentLongitude]
        signupFrom <- map[SerializationKeys.signupFrom]
        driverAdminStatus <- map[SerializationKeys.driverAdminStatus]
        smokerType <- map[SerializationKeys.smokerType]
        countryId <- map[SerializationKeys.countryId]
        driverGender <- map[SerializationKeys.driverGender]
        rating <- map[SerializationKeys.rating]
        selectedAddress <- map[SerializationKeys.selectedAddress]
        accountHolderName <- map[SerializationKeys.accountHolderName]
        anyDocumentExpire <- map[SerializationKeys.anyDocumentExpire]
        loginLogout <- map[SerializationKeys.loginLogout]
        countryAreaId <- map[SerializationKeys.countryAreaId]
        firstName <- map[SerializationKeys.firstName]
        onlineOffline <- map[SerializationKeys.onlineOffline]
        homeLocationActive <- map[SerializationKeys.homeLocationActive]
        createdAt <- map[SerializationKeys.createdAt]
        autoAcceptStatus <- map[SerializationKeys.autoAcceptStatus]
        subscriptionComission <- map[SerializationKeys.subscriptionComission]
        driverComissionChoices <- map[SerializationKeys.driverComissionChoices]
        accounttypeid <- map[SerializationKeys.accounttypeid]
        bsbnumber <- map[SerializationKeys.bsbnumber]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = bankName { dictionary[SerializationKeys.bankName] = value }
        if let value = phoneCode { dictionary[SerializationKeys.phoneCode] = value }
        if let value = profileImage { dictionary[SerializationKeys.profileImage] = value }
        if let value = termStatus { dictionary[SerializationKeys.termStatus] = value }
        if let value = freeBusy { dictionary[SerializationKeys.freeBusy] = value }
        if let value = currentLatitude { dictionary[SerializationKeys.currentLatitude] = value }
        if let value = lastName { dictionary[SerializationKeys.lastName] = value }
        if let value = driverVehicle { dictionary[SerializationKeys.driverVehicle] = value.map { $0.dictionaryRepresentation() } }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = totalEarning { dictionary[SerializationKeys.totalEarning] = value.dictionaryRepresentation() }
        if let value = password { dictionary[SerializationKeys.password] = value }
        if let value = playerId { dictionary[SerializationKeys.playerId] = value }
        if let value = allowOtherSmoker { dictionary[SerializationKeys.allowOtherSmoker] = value }
        if let value = walletMoney { dictionary[SerializationKeys.walletMoney] = value }
        if let value = accountNumber { dictionary[SerializationKeys.accountNumber] = value }
        if let value = signupStep { dictionary[SerializationKeys.signupStep] = value }
        if let value = email { dictionary[SerializationKeys.email] = value }
        if let value = phoneNumber { dictionary[SerializationKeys.phoneNumber] = value }
        if let value = currentLongitude { dictionary[SerializationKeys.currentLongitude] = value }
        if let value = signupFrom { dictionary[SerializationKeys.signupFrom] = value }
        if let value = driverAdminStatus { dictionary[SerializationKeys.driverAdminStatus] = value }
        if let value = smokerType { dictionary[SerializationKeys.smokerType] = value }
        if let value = countryId { dictionary[SerializationKeys.countryId] = value }
        if let value = driverGender { dictionary[SerializationKeys.driverGender] = value }
        if let value = rating { dictionary[SerializationKeys.rating] = value }
        if let value = selectedAddress { dictionary[SerializationKeys.selectedAddress] = value }
        if let value = accountHolderName { dictionary[SerializationKeys.accountHolderName] = value }
        dictionary[SerializationKeys.anyDocumentExpire] = anyDocumentExpire
        if let value = loginLogout { dictionary[SerializationKeys.loginLogout] = value }
        if let value = countryAreaId { dictionary[SerializationKeys.countryAreaId] = value }
        if let value = firstName { dictionary[SerializationKeys.firstName] = value }
        if let value = onlineOffline { dictionary[SerializationKeys.onlineOffline] = value }
        if let value = homeLocationActive { dictionary[SerializationKeys.homeLocationActive] = value }
        if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
        if let value = autoAcceptStatus { dictionary[SerializationKeys.autoAcceptStatus] = value }
        if let value = subscriptionComission { dictionary[SerializationKeys.subscriptionComission] = value }
        if let value = driverComissionChoices { dictionary[SerializationKeys.driverComissionChoices] = value.map { $0.dictionaryRepresentation() } }
        if let value = accounttypeid { dictionary[SerializationKeys.accounttypeid] = value }
        if let value = bsbnumber { dictionary[SerializationKeys.bsbnumber] = value }
        return dictionary
    }
}
