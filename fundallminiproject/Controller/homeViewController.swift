//
//  homeViewController.swift
//  fundallminiproject
//
//  Created by user on 06/05/2020.
//

import UIKit
import CoreData

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
var pic: [UserDetails]?
class homeViewController: UIViewController {

    @IBOutlet weak var gotosigninviewbutton: UIImageView!
    @IBOutlet weak var testphoto: UIImageView!
    @IBOutlet weak var analyticsImageView: UIImageView!
    @IBOutlet weak var requestCardImageView: UIImageView!
    @IBOutlet weak var greenview: UIView!
    var firstname: String?
    var email: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        analyticsImageView.isUserInteractionEnabled = true
        requestCardImageView.isUserInteractionEnabled = true
        gotosigninviewbutton.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(nextview))
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(analyticsview))
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(poptosigninpage(_:)))
        requestCardImageView.addGestureRecognizer(gesture)
        analyticsImageView.addGestureRecognizer(gesture2)
        gotosigninviewbutton.addGestureRecognizer(gesture3)
        circularImage([testphoto,analyticsImageView,requestCardImageView])
        greenview.layer.cornerRadius = 10
        do{
            pic = try context.fetch(UserDetails.fetchRequest())
        }catch{
            
        }
    }
    func circularImage(_ images: [UIImageView]){
        for image in images{
            image.layer.masksToBounds = false
            image.layer.cornerRadius = image.frame.size.height/2
            image.clipsToBounds = true
        }
    }
   @objc func poptosigninpage(_ sender: UIImageView){
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextView = storyboard.instantiateViewController(identifier: "signInViewController") as signInViewController
    nextView.modalPresentationStyle = .fullScreen
    nextView.email = email
    nextView.firstname = firstname
    present(nextView, animated: true, completion: nil)
    }
    @objc func nextview(_ sender: UIImageView){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateViewController(identifier: "pickCardViewController")
        let nav = UINavigationController(rootViewController: nextView)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
    
    @objc func analyticsview(_ sender: UIImageView){
        let nextView = analyticsViewController()
        nextView.modalPresentationStyle = .fullScreen
        present(nextView, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
