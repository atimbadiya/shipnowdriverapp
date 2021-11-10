//
//  ChatViewController.swift
//  ApporioTaxiDriver
//
//  Created by apple on 2/13/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import ObjectMapper
import JSQMessagesViewController


class ChatViewController: JSQMessagesViewController  {
    
    var messages = [JSQMessage]()
    //  var ref1 = FIRDatabase.database().reference()
    
    var defaults = UserDefaults.standard
    
    /// Lazy computed property for painting outgoing messages blue
    lazy var outgoingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
    }()
    
    /// Lazy computed property for painting incoming messages gray
    lazy var incomingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleGreen())
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBackButton()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(chattrack),
            name: NSNotification.Name(rawValue: "chatscreen"),
            object: nil)
        
        // First, check the defaults if an ID and display name are set
        if  let id = defaults.string(forKey: "jsq_id"),
            let name = defaults.string(forKey: "jsq_name")
        {
            // Set the JSQMVC properties for sender ID and display name
            senderId = id
            senderDisplayName = name
        }
        else
        {
            // If the defaults doesn't have the ID and name, generate an ID, set the name to blank, and show the name dialog
            //   senderId = String(arc4random_uniform(999999))
            
            senderId = "DRIVER"
            senderDisplayName = AppConstants.username
            
            // Save the sender ID
            defaults.set(senderId, forKey: "jsq_id")
            defaults.set(senderDisplayName, forKey: "jsq_name")
            defaults.synchronize()
            
            // Show the display name dialog
            // showDisplayNameDialog()
        }
        
        title = "\(senderDisplayName!)"
        
        inputToolbar.contentView.leftBarButtonItem = nil
        collectionView.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
        
        callApi()
        // Do any additional setup after loading the view.
    }
    func callApi(){
        
        let dic1 = ["booking_id": AppConstants.bookingid,
    ] as [String : AnyObject]
   
    // showLoaderWithoutBackground()
    
    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCHAT
    ServiceManager.sharedInstance.delegate = self
    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverChatModel.self)
    }
    @objc func chattrack(notification: NSNotification){
        
        callApi()
    }
    func setupBackButton(){
        
        let backButton = UIBarButtonItem(title: "Back".localized, style: UIBarButtonItem.Style.plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        defaults.removeObject(forKey: "jsq_id")
        defaults.removeObject(forKey: "jsq_name")
        
        AppConstants.checkfromchat = 1
        AppConstants.chatCount = 0
        dismiss(animated: true, completion: nil)
    }

override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData!
{
    // Return a specific message by index path
    return messages[indexPath.item]
}

override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
{
    // Return the number of messages
    
    print(messages.count)
    return messages.count
}

override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource!
{
    // Return the right image bubble (see top): outgoing/blue for messages from the current user, and incoming/gray for other's messages
    
    return messages[indexPath.item].senderId == senderId ? outgoingBubble : incomingBubble
}

override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource!
{
    // No avatar!
    return nil
}

override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString!
{
    // Return an attributed string with the name of the user who's text bubble is shown, displayed on top of the bubble, or return `nil` for the current user
    
    return messages[indexPath.item].senderId == senderId ? nil : NSAttributedString(string: AppConstants.username)
    // return messages[indexPath.item].senderId == senderId ? nil : NSAttributedString(string: messages[indexPath.item].senderDisplayName)
}

override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat
{
    // Return the height of the bubble top label
    return messages[indexPath.item].senderId == senderId ? 0 : 15
}

override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!)
{
    // Get a reference for a new object on the `databaseChats` reference
    // `childByAutoId()` generates a unique random object key
    //let ref = Constants.refs.databaseChats.childByAutoId()
    
    // let ref = ref1.child("RideTable").child(GlobalVarible.checkRideId).child("Chat").childByAutoId()
    
    // let sticks = String((Date().timeIntervalSince1970 + 62_135_596_800) * 10_000_000)
    
    let sticks = String(Date().timeIntervalSince1970)
    
    let startdate = (sticks.components(separatedBy: "."))
    
    let dic1 = ["booking_id":AppConstants.bookingid,
                "message": text
        
        ] as [String : AnyObject]
    
    // showLoaderWithoutBackground()
    
    let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERCHATSENDMESSAGE
    ServiceManager.sharedInstance.delegate = self
    
    ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DriverChatSendModel.self)
    
    
    //         let ref = self.ref1.child("Chat").child(AppConstants.checkRideId).childByAutoId()
    //
    //
    //        // Create the message data, as a dictionary
    let message = ["send_via": senderId, "timestamp": startdate[0], "message": text]
    //
    //        // Save the data on the new reference
    //        ref.setValue(message)
    //
    //        // Tell JSQMVC we're done here
    //        // Note: the UI and bubbles don't update until the newly sent message is returned via the .observe(.childAdded,with:) closure. Neat!
    finishSendingMessage()
}
}

extension JSQMessagesInputToolbar {
    override open func didMoveToWindow() {
        super.didMoveToWindow()
        if #available(iOS 11.0, *) {
            if self.window?.safeAreaLayoutGuide != nil {
                self.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: (self.window?.safeAreaLayoutGuide.bottomAnchor)!, multiplier: 1.0).isActive = true
            }
        }
    }
}

extension ChatViewController: ApiResponseReceiver{
    
    func onSuccess<T>(_ response: T) where T : Mappable {
        
        if let responseData = response as? DriverChatModel{
            
            let data:DriverChatModel = responseData
            
            // viewfavouritedriverdata = data
            
            if data.result == "1" {
                
                //  hideLoaderWithoutBackground()
                
                
                let count = data.data?.chat?.count
                
                self.messages.removeAll()
                
                for i in 0..<count!{
                    
                    let id = data.data?.chat![i].sender
                    let name = String((data.data?.chat![i].timestamp!)!)
                    let text = data.data?.chat![i].message
                    
                    if let message = JSQMessage(senderId: id, displayName: name, text: text)
                    {
                        // Append to the local messages array
                        self.messages.append(message)
                        
                        // Tell JSQMVC that we're done adding this message and that it should reload the view
                        self.finishReceivingMessage()
                    }
                }
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }  else {
                //   hideLoaderWithoutBackground()
                //    showErrorAlert("Alert", alertMessage: viewfavouritedriverdata.message!, VC: self)
                
            }
        }
        
        if let responseData = response as? DriverChatSendModel{
            
            let data:DriverChatSendModel = responseData
            
            // viewfavouritedriverdata = data
            
            if data.result == "1" {
                
                //  hideLoaderWithoutBackground()
                
                callApi()
                
            }else if data.result == "999" {
                
                UserDefaultUtility.removeAllUserDefault()
                
                self.presentVC("SplashViewController")
                
            }  else {
                //   hideLoaderWithoutBackground()
                //    showErrorAlert("Alert", alertMessage: viewfavouritedriverdata.message!, VC: self)
                
            }
        }
    }
    
    
    func onError(_ errorResponse: String, errorObject: AnyObject?) {
        
        //     hideLoaderWithoutBackground()
        //    showErrorAlert("Alert", alertMessage: errorResponse, VC: self)
        
        // presenter?.onError(errorResponse)
    }
    
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
      //  hideLoaderWithoutBackground()
      //  showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }
}





  

