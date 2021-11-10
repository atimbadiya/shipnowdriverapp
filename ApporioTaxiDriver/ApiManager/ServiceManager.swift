//
//  ServiceManager.swift
//  ApporioEats
//
//  Created by Apporio on 01/06/18.
//  Copyright © 2018 Apporio. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper


class ServiceManager: NSObject  {
    
    static let sharedInstance = ServiceManager()
    var delegate : ApiResponseReceiver?
    
    var locationdelegate : DriverLocationUpdate?

     let manager = Alamofire.SessionManager.default

    // POST API -
    
    func requestPostWithParameter<T:Mappable>(_ urlString:String , andRequestDictionary requestDictionary:[String : AnyObject] , requestHeader:[String:AnyObject] , returningClass:T.Type)-> Void{
        
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        
        let headers: HTTPHeaders = requestHeader as! HTTPHeaders
        
        if ReachabilityManager.shared.isNetworkAvailable {
            
            manager
                .request(urlString + "?XDEBUG_SESSION_START=PHP", method: .post, parameters:requestDictionary, headers:headers)
                .validate()
                .responseObject { (response: DataResponse<T>) in
                
                    switch response.result {
                        
                    case .success(let responseDetail):

                        self.delegate?.onSuccess(responseDetail)
                   
                    case .failure(let error):
                        
                        if error._code == NSURLErrorTimedOut{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            self.delegate?.onTimeOutError("Internet connection seems slow" , errorObject: nil)
                        }else if error._code == NSURLErrorNetworkConnectionLost{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            self.delegate?.onTimeOutError("Internet connection seems slow" , errorObject: nil)
                            
                        }else if error._code == NSURLErrorCannotFindHost{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            self.delegate?.onTimeOutError("cannot find Host" , errorObject: nil)
                            
                        }
                    }
            }
        
        }else{
            
            // Generating common network error
            self.delegate?.onError("Please check Your Internet connection" , errorObject: nil)
        }
        
    }
    
    
    func requestPostWithParameter1<T:Mappable>(_ urlString:String , andRequestDictionary requestDictionary:[String : AnyObject] , requestHeader:[String:AnyObject] , returningClass:T.Type)-> Void{
        
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        
        let headers: HTTPHeaders = requestHeader as! HTTPHeaders
        
        if ReachabilityManager.shared.isNetworkAvailable {
            
            manager
                .request(urlString, method: .post, parameters:requestDictionary, headers:headers)
                .validate()
                .responseObject { (response: DataResponse<T>) in
                    
                    switch response.result {
                        
                    case .success(let responseDetail):
                        
                        let valur = responseDetail.toJSON()
                        
                        
                        UserDefaults.standard.set(valur, forKey: "configurationarray")
                        
                        self.delegate?.onSuccess(responseDetail)
                        
                    case .failure(let error):
                        
                        if error._code == NSURLErrorTimedOut{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            self.delegate?.onTimeOutError("Internet connection seems slow" , errorObject: nil)
                        }else if error._code == NSURLErrorNetworkConnectionLost{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            self.delegate?.onTimeOutError("Internet connection seems slow" , errorObject: nil)
                            
                        }else if error._code == NSURLErrorCannotFindHost{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            self.delegate?.onTimeOutError("cannot find Host" , errorObject: nil)
                            
                        }
                        
                    }
            }
            
        }else{
            
            // Generating common network error
            self.delegate?.onError("Please check Your Internet connection" , errorObject: nil)
        }
        
    }
    
    
    //GET API -
     func requestGETWithURL<T:Mappable>(_ urlString:String , requestHeader:[String:AnyObject], returningClass:T.Type)-> Void{
        
      
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        let headers: HTTPHeaders = requestHeader as! HTTPHeaders
        
        if ReachabilityManager.shared.isNetworkAvailable {
            
            manager
                .request(urlString, method: .get, parameters: nil, headers:headers)
                .validate()
                .responseObject { (response: DataResponse<T>) in
                    
                    switch response.result {
                        
                    case .success(let responseDetail):
                        
                        self.delegate?.onSuccess(responseDetail)
 
                    case .failure(let error):
                        
                        if error._code == NSURLErrorTimedOut{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            self.delegate?.onTimeOutError("Internet connection seems slow" , errorObject: nil)
                        }else if error._code == NSURLErrorNetworkConnectionLost{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            self.delegate?.onTimeOutError("Internet connection seems slow" , errorObject: nil)
                            
                        }else if error._code == NSURLErrorCannotFindHost{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            self.delegate?.onTimeOutError("cannot find Host" , errorObject: nil)
                            
                        }
                        
                    }
            }
            
        }else{
            
            // Generating common network error
            self.delegate?.onError("Please check Your Internet connection" , errorObject: nil)
        }
    }
    
    
    func requestPostWithImageParameter<T:Mappable>(_ urlString:String , andRequestDictionary requestDictionary:[String : AnyObject] , requestHeader:[String:AnyObject] ,imagesData:[Data], imageParamName:[String], returningClass:T.Type)-> Void {
        
     
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        let headers: HTTPHeaders = requestHeader as! HTTPHeaders
        
        if ReachabilityManager.shared.isNetworkAvailable {
            
            manager.upload(multipartFormData: { multipartFormData in
                // import image to request
                for (index,_) in imagesData.enumerated() {
                    
                    print(imageParamName[index])
                    // imageData
                    multipartFormData.append(imagesData[index], withName: "\(imageParamName[index])", fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
                }
                
//                for (index,imageData) in imagesData.enumerated() {
//                   multipartFormData.append(imageData, withName: "\(imageParamName[index])", fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
//                }
                
                print("request dict \(requestDictionary)")
                for (key, value) in requestDictionary {
                    multipartFormData.append(value.data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }, to: urlString, headers: headers,
               
               encodingCompletion: { encodingResult in
                switch encodingResult {
                 case .success(let upload, _, _):
                    
                    upload.responseObject(completionHandler: { (response: DataResponse<T>) in
                        
                        if let responsedata = response.result.value {
                            self.delegate?.onSuccess(responsedata)
                            
                        } else {
                            debugPrint("Error...")
                        }
                    })
                    
                case .failure(let error):

                    if error._code == NSURLErrorTimedOut{
                        
                        print("Request Timeout!")
                        
                        //let errorDetail:String = error as! String
                        self.delegate?.onTimeOutError("Internet connection seems slow" , errorObject: nil)
                    }else if error._code == NSURLErrorNetworkConnectionLost{
                        
                        print("Request Timeout!")
                        
                        //let errorDetail:String = error as! String
                        self.delegate?.onTimeOutError("Internet connection seems slow" , errorObject: nil)
                        
                    }else if error._code == NSURLErrorCannotFindHost{
                        
                        print("Request Timeout!")
                        
                        //let errorDetail:String = error as! String
                        self.delegate?.onTimeOutError("cannot find Host" , errorObject: nil)
                        
                    }
                    
                }
                
            })
            
        }else{
            
            // Generating common network error
            self.delegate?.onError("Please check Your Internet connection" , errorObject: nil)
        }
    }
    
    
    
    func requestPostWithSingleImageParameter<T:Mappable>(_ urlString:String , andRequestDictionary requestDictionary:[String : AnyObject] , requestHeader:[String:AnyObject] ,imageData:Data, imageParamName:String, returningClass:T.Type)-> Void {
        
     
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        let headers: HTTPHeaders = requestHeader as! HTTPHeaders
        
        if ReachabilityManager.shared.isNetworkAvailable {
            
            manager.upload(multipartFormData: { multipartFormData in
                // import image to request
                
                multipartFormData.append(imageData, withName: "\(imageParamName)", fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
                
//                for (index,imageData) in imagesData.enumerated() {
//                   multipartFormData.append(imageData, withName: "\(imageParamName[index])", fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
//                }
                
                print("request dict \(requestDictionary)")
                for (key, value) in requestDictionary {
                    multipartFormData.append(value.data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }, to: urlString, headers: headers,
               
               encodingCompletion: { encodingResult in
                switch encodingResult {
                 case .success(let upload, _, _):
                    
                    upload.responseObject(completionHandler: { (response: DataResponse<T>) in
                        
                        if let responsedata = response.result.value {
                            self.delegate?.onSuccess(responsedata)
                            
                        } else {
                            debugPrint("Error...")
                        }
                    })
                    
                case .failure(let error):
                    if error._code == NSURLErrorTimedOut{
                        
                        print("Request Timeout!")
                        
                        //let errorDetail:String = error as! String
                        self.delegate?.onTimeOutError("Internet connection seems slow" , errorObject: nil)
                    }else if error._code == NSURLErrorNetworkConnectionLost{
                        
                        print("Request Timeout!")
                        
                        //let errorDetail:String = error as! String
                        self.delegate?.onTimeOutError("Internet connection seems slow" , errorObject: nil)
                        
                    }else if error._code == NSURLErrorCannotFindHost{
                        
                        print("Request Timeout!")
                        
                        //let errorDetail:String = error as! String
                        self.delegate?.onTimeOutError("cannot find Host" , errorObject: nil)
                    }
                    
                }
                
            })
            
        }else{
            
            // Generating common network error
            self.delegate?.onError("Please check Your Internet connection" , errorObject: nil)
        }
    }
    
    
    
    
    
    
    func requestPostWithParameterLocationtimer<T:Mappable>(_ urlString:String , andRequestDictionary requestDictionary:[String : AnyObject] , requestHeader:[String:AnyObject] , returningClass:T.Type)-> Void{
        
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        
        let headers: HTTPHeaders = requestHeader as! HTTPHeaders
        
        if ReachabilityManager.shared.isNetworkAvailable {
            
            manager
                .request(urlString + "?XDEBUG_SESSION_START=PHPSTORM", method: .post, parameters:requestDictionary, headers:headers)
                .validate()
                .responseObject { (response: DataResponse<T>) in
                    
                    switch response.result {
                        
                    case .success(let responseDetail):
                        
                        self.locationdelegate?.onSuccessLocation(responseDetail)
                        
                    case .failure(let error):
                        
                        if error._code == NSURLErrorTimedOut{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            //self.locationdelegate?.onTimeOutErrorLocation("Internet connection seems slow" , errorObject: nil)
                        }else if error._code == NSURLErrorNetworkConnectionLost{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            //self.locationdelegate?.onTimeOutErrorLocation("Internet connection seems slow" , errorObject: nil)
                            
                        }else if error._code == NSURLErrorCannotFindHost{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            self.locationdelegate?.onTimeOutErrorLocation("cannot find Host" , errorObject: nil)
                            
                        }
                        
                        
                    }
            }
            
        }else{
            
            // Generating common network error
            self.locationdelegate?.onErrorLocation("Please check Your Internet connection" , errorObject: nil)
        }
        
    }
    
    
    func requestPostWithParameterLocationtimer1<T:Mappable>(_ urlString:String , andRequestDictionary requestDictionary:[String : AnyObject] , requestHeader:[String:AnyObject] , returningClass:T.Type)-> Void{
        
       
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        
        let headers: HTTPHeaders = requestHeader as! HTTPHeaders
        
        if ReachabilityManager.shared.isNetworkAvailable {
            
            manager
                .request(urlString, method: .post, parameters:requestDictionary, headers:headers)
                .validate()
                .responseObject { (response: DataResponse<T>) in
                    
                    switch response.result {
                        
                    case .success(let responseDetail):
                        
                        self.delegate?.onSuccess(responseDetail)
                        
                    case .failure(let error):
                        
                        if error._code == NSURLErrorTimedOut{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            //self.locationdelegate?.onTimeOutErrorLocation("Internet connection seems slow" , errorObject: nil)
                        }else if error._code == NSURLErrorNetworkConnectionLost{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            //self.locationdelegate?.onTimeOutErrorLocation("Internet connection seems slow" , errorObject: nil)
                            
                        }else if error._code == NSURLErrorCannotFindHost{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            self.delegate?.onTimeOutError("cannot find Host" , errorObject: nil)
                            
                        }
                        
                        
                    }
            }
            
        }else{
            
            // Generating common network error
            self.delegate?.onError("Please check Your Internet connection" , errorObject: nil)
        }
        
    }
    
    
    func requestPostWithParameterLocation<T:Mappable>(_ urlString:String , andRequestDictionary requestDictionary:[String : AnyObject] , requestHeader:[String:AnyObject] , returningClass:T.Type)-> Void{
        
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
        
        let headers: HTTPHeaders = requestHeader as! HTTPHeaders
        
        if ReachabilityManager.shared.isNetworkAvailable {
            
            manager
                .request(urlString + "?XDEBUG_SESSION_START=PHPSTORM", method: .post, parameters:requestDictionary, headers:headers)
                .validate()
                .responseObject { (response: DataResponse<T>) in
                    
                    switch response.result {
                        
                    case .success(let responseDetail):
                        
                        self.locationdelegate?.onSuccessLocation(responseDetail)
                        
                    case .failure(let error):
                        
                        if error._code == NSURLErrorTimedOut{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            self.locationdelegate?.onTimeOutErrorLocation("Internet connection seems slow" , errorObject: nil)
                        }else if error._code == NSURLErrorNetworkConnectionLost{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            self.locationdelegate?.onTimeOutErrorLocation("Internet connection seems slow" , errorObject: nil)
                            
                        }else if error._code == NSURLErrorCannotFindHost{
                            
                            print("Request Timeout!")
                            
                            //let errorDetail:String = error as! String
                            self.locationdelegate?.onTimeOutErrorLocation("cannot find Host" , errorObject: nil)
                            
                        }                        
                    }
            }
            
        }else{
            
            // Generating common network error
            self.locationdelegate?.onErrorLocation("Please check Your Internet connection" , errorObject: nil)
        }
        
    }
    
    
    
}
