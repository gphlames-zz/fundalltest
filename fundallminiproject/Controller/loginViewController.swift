//
//  loginViewController.swift
//  fundallminiproject
//
//  Created by user on 06/05/2020.
//

import UIKit
import CoreData

class loginViewController: UIViewController {

    @IBOutlet weak var Cancel: UILabel!
    @IBOutlet weak var missyouLabel: UILabel!
    @IBOutlet weak var passwordStack: UIStackView!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var profilePicImage: UIImageView!
    var fetch = fetchImage()
    var log = login()
    //var userpay = userdetailsarray()
    var user: UserDetails?
    var fetchedData:[UserDetails]?
    var firstname: String?
    var email: String?
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBAction func loginFunction(_ sender: Any) {
        let details = userPayload(email: email!, password: textfield.text ?? "")
        log.userpayload = details
        log.logininto()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addsubLayer(passwordStack)
        makeImageCircular(profilePicImage)
        fetch.delegate = self
        log.delegate = self
        missyouLabel.text = "We miss you \(firstname!)"
        emailLabel.text = "\(email!)"
//        fetch.getImage()
    }
    func makeImageCircular(_ image: UIImageView){
         image.layer.masksToBounds = false
         image.layer.borderColor = UIColor.white.cgColor
         image.layer.cornerRadius = image.frame.size.height/2
         image.clipsToBounds = true
    }
    func addsubLayer(_ view: UIStackView){
        let bottomborder  = CALayer()
        bottomborder.frame = CGRect(x: 0.0, y: view.frame.height-1, width: view.frame.width, height: 1.0)
        bottomborder.backgroundColor = UIColor.systemGreen.cgColor
        view.layer.addSublayer(bottomborder)
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
extension loginViewController: succesfullLogin,imaging{
    func didFailWithError(_ error: Error) {
        
    }
    
    func goregardless() {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextView = storyboard.instantiateViewController(identifier: "HomeViewController") as homeViewController
            nextView.email = self.email
            nextView.firstname = self.firstname
            nextView.modalPresentationStyle = .fullScreen
            self.present(nextView, animated: true, completion: nil)
        }
    }
    
    
    func didretriveimage(_ data: Data) {
        do{
            fetchedData = try context.fetch(UserDetails.fetchRequest())
            fetchedData?[0].avatarpng = data
            try context.save()
            DispatchQueue.main.async {
                self.profilePicImage.image = UIImage(data: data)
            }
        }catch{
            let alert = UIAlertController(title: "Error", message: "Couldn't pass data to imageview", preferredStyle: .alert)
            present(alert, animated: true, completion: {
                self.goregardless()
            })
        }
        
    }
    
    func loginsuccessful(_ userd: successlogin) {
//        if userd.status == "SUCCESS"{
////            user = UserDetails(context: context)
////            user?.firstname = userd.user.firstname
////            user?.lastname = userd.user.lastname
////            user?.email = userd.user.email
////            user?.ids = Int32(userd.user.id)
////            user?.access_token = userd.user.access_token
////            user?.expires_at = userd.user.expires_at
////            fetch.token = userd.user.access_token
////            fetch.endpoint = userd.user.avatar
////            do{
////                try context.save()
////            }catch{
////
////            }
////            fetch.getImage()
//            print("successful")
//
//        }else{
//            DispatchQueue.main.async {
//                let alert = UIAlertController(title: "Error", message: userd.status, preferredStyle: .alert)
//                self.present(alert, animated: true, completion: {
//                    self.goregardless()
//                })
//            }
//        }
        
    }
    
    func didFailWithError(_ error: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel, handler: {_ in
                self.goregardless()
            })
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
