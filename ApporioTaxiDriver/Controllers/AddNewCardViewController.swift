//
//  AddNewCardViewController.swift
//  ApporioTaxiDriver
//
//  Created by Gyanender on 29/03/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import Stripe
import ObjectMapper

class AddNewCardViewController: BaseViewController
{
    //MARK:- IBOUTLETS
    //================
    @IBOutlet weak var viewTitleLabel: UILabel!
    @IBOutlet weak var cardNoTextField: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var monthTitleLabel: UILabel!
    @IBOutlet weak var cvvTitleLabel: UILabel!
    @IBOutlet weak var nextBtnView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK:- VARIABLES
    //================
    let card: STPCardParams = STPCardParams()
    
    //MARK:- VIEW LIFECYCLE
    //=====================
    override func viewDidLoad() {
        super.viewDidLoad()

        //TEXTFIELD DELEGATE CONFORM
        //==========================
        self.cardNoTextField.delegate = self
        self.cvvTextField.delegate = self
        self.monthTextField.delegate = self
        
        self.viewTitleLabel.text = "Add Card".localized
        self.cardTitleLabel.text = "ENTER CARD NUMBER".localized
        self.nextButton.setTitle("NEXT".localized, for: UIControl.State.normal)
        self.monthTitleLabel.text = "MM/YYYY".localized
        self.cvvTitleLabel.text = "CVV".localized
    }
    
    //MARF:- FUNCTIONS
    //================
    func getStripeToken(card:STPCardParams)
    {
        STPAPIClient.shared.createToken(withCard: card) { token, error in
            if let token = token
            {
                print(token)
                
                
                let dic1 = ["payment_option":"STRIPE" as AnyObject,
                            "token":token
                    ] as [String : AnyObject]
                self.showLoaderWithoutBackground()
                
                let apiRequestUrl = AppConstants.APIURL.BASE_URL + AppConstants.ApiEndPoints.DRIVERSAVECARDS
                ServiceManager.sharedInstance.delegate = self
                ServiceManager.sharedInstance.requestPostWithParameter(apiRequestUrl, andRequestDictionary: dic1, requestHeader: AppConstants.dicauthorization, returningClass: DeleteCardModel.self)
            }
            else
            {
                print(error!)
                // SVProgressHUD.showErrorWithStatus(error?.localizedDescription)
            }
        }
    }
    
    //MARK:- IBACTIONS
    //================
    @IBAction func backBtnTapped(_ sender: Any)
    {
        self.dismissVC()
    }
    
    @IBAction func nextBtnTapped(_ sender: Any)
    {
        if self.cardNoTextField.text == "" || self.monthTextField.text == "" || self.cvvTextField.text == ""
        {
            self.showErrorAlert("", alertMessage: "Please enter the required details".localized, VC: self)
        }
        else
        {
            let textarray = self.monthTextField.text!.components(separatedBy: " / ")
            print(textarray[0])
            print(textarray[1])
            print(self.cardNoTextField.text!)
            print(self.cvvTextField.text!)
            
            card.number = self.cardNoTextField.text!
            card.expMonth = UInt(textarray[0])!
            card.expYear = UInt(textarray[1])!
            card.name = "test"
            card.cvc = self.cvvTextField.text!
            
            getStripeToken(card: card)
            
        }
    }
}

//MARK:- TEXTFIELD DELEGATE METHODS
//=================================
extension AddNewCardViewController: UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let val = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if textField == self.monthTextField{
            if string == ""
            {
                return true
            }
                //Put / space after 2 digit
            else if val.count == 3
            {
                print(val)
                self.monthTextField.text = self.monthTextField.text! + " / "
            }
                //Check for max length including the spacers we added
            else if (val.count) > 9
            {
                return false
            }
            
        }
        else if textField == self.cardNoTextField{
            if string == ""
            {
                
                return true
            }
                //Check for max length including the spacers we added
            else if (val.count) > 19
            {
                
                return false
            }
                //Put / space after 2 digit
            else if val.count == 5
            {
                print(val)
                self.cardNoTextField.text = self.cardNoTextField.text! + "-"
            }
            else if val.count == 10
            {
                print(val)
                self.cardNoTextField.text = self.cardNoTextField.text! + "-"
            }
            else if val.count == 15
            {
                print(val)
                self.cardNoTextField.text = self.cardNoTextField.text! + "-"
            }
        }
        else if  textField == self.cvvTextField{
            //Range.Lenth will greater than 0 if user is deleting text - Allow it to replce
            if string == ""
            {
                return true
            }
                //Check for max length including the spacers we added
            else if (val.count) > 3
            {
                return false
            }
            else{
                return true
            }
        }
        else{
            return true
        }
        return true
        
    }
}

//MARK:- API RESPONSE
//===================
extension AddNewCardViewController: ApiResponseReceiver
{
    func onSuccess<T>(_ response: T) where T : Mappable
    {
        if let responseData = response as? DeleteCardModel
        {
            let data:DeleteCardModel = responseData
            if data.result == "1"
            {
                hideLoaderWithoutBackground()
                AppConstants.tokenvalue = 1
                self.dismissVC()
            }
            else if data.result == "999"
            {
                UserDefaultUtility.removeAllUserDefault()
                self.presentVC("SplashViewController")
                
            }
            else
            {
                hideLoaderWithoutBackground()
                showErrorAlert("Alert".localized, alertMessage: data.message!, VC: self)
            }
        }
    }
    
    
    func onError(_ errorResponse: String, errorObject: AnyObject?)
    {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
        // presenter?.onError(errorResponse)
    }
    
    func onTimeOutError(_ errorResponse: String, errorObject: AnyObject?) {
        hideLoaderWithoutBackground()
        showErrorAlert("Alert".localized, alertMessage: errorResponse, VC: self)
    }
}
