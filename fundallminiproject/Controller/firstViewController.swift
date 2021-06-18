//
//  ViewController.swift
//  fundallminiproject
//
//  Created by user on 06/05/2020.
//

import UIKit
import CoreData

class firstViewController: UIViewController {
   
    @IBOutlet weak var lastNameStack: UIStackView!
    @IBOutlet weak var firstnameStack: UIStackView!
    @IBOutlet weak var emailAddressImageView: UIImageView!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var phoneNumberimageView: UIImageView!
    @IBOutlet weak var phoneNumberTextfield: UITextField!
    @IBOutlet weak var emailAddressStack: UIStackView!
    @IBOutlet weak var passwordStack: UIStackView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordImageView2: UIImageView!
    @IBOutlet weak var passwordImageView: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameImageView: UIImageView!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var firstNameImageView: UIImageView!
    var puttingUnderView: [UIStackView] = [UIStackView]()
    var texts: [UITextField] = [UITextField]()
    var register = Register()
    var payload: Payload?
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBAction func logInFunc(_ sender: UIButton) {
        
    }
    @IBAction func signUpFunc(_ sender: UIButton) {
      payload = Payload(firstname: firstNameTextField.text!, lastname: lastNameTextfield.text!, email: emailAddressTextField.text!, password: passwordTextField.text!, password_confirmation: passwordTextField.text!)
        register.payload = payload
        register.registerUser()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let nextView = storyboard.instantiateViewController(identifier: "signInViewController") as! signInViewController
//        nextView.modalPresentationStyle = .fullScreen
//        //nextView.firstname = payload?.firstname
//        present(nextView, animated: true, completion: nil)
    }
    @IBOutlet weak var phoneNumberStack: UIStackView!
    @IBOutlet weak var nameStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        puttingUnderView = [lastNameStack,firstnameStack,emailAddressStack,phoneNumberStack,passwordStack]
        addsubLayer(puttingUnderView)
        texts = [firstNameTextField,lastNameTextfield,emailAddressTextField,passwordTextField]
        removeborders(texts)
        firstNameImageView.image = UIImage(systemName: "person.fill")
        lastNameImageView.image =  UIImage(systemName: "person.fill")
        phoneNumberimageView.image = UIImage(systemName: "phone")
        passwordImageView.image = UIImage(systemName: "lock")
        passwordImageView2.image = UIImage(systemName: "eye.slash")
        register.delegate = self
    }
    func addsubLayer(_ view: [UIStackView]){
        for i in view{
            let bottomborder  = CALayer()
            bottomborder.frame = CGRect(x: 0.0, y: i.frame.height-1, width: i.frame.width, height: 1.0)
            bottomborder.backgroundColor = UIColor.systemGreen.cgColor
            i.layer.addSublayer(bottomborder)
        }
        
    }
    func removeborders(_ view:[UITextField]){
        for i in view{
            i.layer.borderWidth = 0
        }
    }

}
extension firstViewController: checkError{
    func goregardless() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        DispatchQueue.main.async { [self] in
            let nextView = storyboard.instantiateViewController(identifier: "signInViewController") as! signInViewController
            nextView.modalPresentationStyle = .fullScreen
            nextView.email = self.emailAddressTextField.text
            nextView.firstname = self.firstNameTextField.text
            present(nextView, animated: true, completion: nil)
        }
        
    }
    
    func successful(_ success: successfulregistration) {
        if success.message == "Registration successfull."{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextView = storyboard.instantiateViewController(identifier: "signInViewController") as! signInViewController
            nextView.modalPresentationStyle = .fullScreen
            nextView.email = emailAddressTextField.text
            nextView.firstname = firstNameTextField.text
            present(nextView, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Error", message: success.message, preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func didFailWithError(_ error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel, handler: {_ in
                self.goregardless()
            })
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    
}
