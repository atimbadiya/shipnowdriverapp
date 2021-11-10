//
//  ApiResponseReceiver.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/2/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import ObjectMapper

protocol ApiResponseReceiver{
    
    func onSuccess<T: Mappable>(_ response:T) -> Void
    func onError(_ errorResponse:String , errorObject:AnyObject?) -> Void
     func onTimeOutError(_ errorResponse:String , errorObject:AnyObject?) -> Void
}


protocol DriverLocationUpdate{
    
    func onSuccessLocation<T: Mappable>(_ response:T) -> Void
    func onErrorLocation(_ errorResponse:String , errorObject:AnyObject?) -> Void
    func onTimeOutErrorLocation(_ errorResponse:String , errorObject:AnyObject?) -> Void
}

