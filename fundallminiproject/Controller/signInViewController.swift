//
//  signInViewController.swift
//  fundallminiproject
//
//  Created by user on 06/05/2020.
//

import UIKit

class signInViewController: UIViewController {

    @IBOutlet weak var nameLifeStyleLabel: UILabel!
    @IBOutlet weak var notLabel: UILabel!
    @IBOutlet weak var biometricImageView: UIImageView!
    @IBOutlet weak var biometricStack: UIStackView!
    @IBOutlet weak var passwordImageView: UIImageView!
    @IBOutlet weak var passwordImageStack: UIStackView!
    var email: String?
    var firstname: String?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLifeStyleLabel.text = "\(firstname!)'s Lifestyle"
        notLabel.text = "Not \(firstname!)?"
        passwordImageView.isUserInteractionEnabled = true
        biometricImageView.isUserInteractionEnabled = true
        passwordImageStack.bringSubviewToFront(passwordImageView)
        biometricStack.bringSubviewToFront(biometricImageView)
        NSLayoutConstraint(item: passwordImageView, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: passwordImageStack, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: passwordImageView, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: passwordImageStack, attribute: .centerYWithinMargins, multiplier: 1, constant: 0).isActive = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(nextView))
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(nextView2))
        passwordImageView.addGestureRecognizer(gesture2)
        biometricImageView.addGestureRecognizer(gesture)
        makeCircularImages([passwordImageView,biometricImageView])
    }
   @objc func nextView(){
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextview = storyboard.instantiateViewController(identifier: "HomeViewController")
    nextview.modalPresentationStyle = .fullScreen
    present(nextview, animated: true, completion: nil)
    }
    @objc func nextView2(){
     let storyboard = UIStoryboard(name: "Main", bundle: nil)
     let nextview = storyboard.instantiateViewController(identifier: "LoginViewController") as loginViewController
     nextview.email = email
     nextview.firstname = firstname
     nextview.modalPresentationStyle = .fullScreen
     
     present(nextview, animated: true, completion: nil)
     }
    func makeCircularImages(_ images: [UIImageView]){
        for image in images{
            image.layer.borderWidth=1.0
             image.layer.masksToBounds = false
            image.layer.borderColor = UIColor.systemGreen.cgColor
             image.layer.cornerRadius = image.frame.size.height/2
             image.clipsToBounds = true
        }
        
    }
}
