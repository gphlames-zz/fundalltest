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
    var log = login()
    var user: UserDetails?
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
        log.delegate = self
        missyouLabel.text = "We miss you \(firstname!)"
        emailLabel.text = "\(email!)"
//        fetch.getImage()
    }
    func makeImageCircular(_ image: UIImageView){
         image.layer.masksToBounds = false
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
extension loginViewController: succesfullLogin{
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
    
    func loginsuccessful(_ userd: successlogin) {
        if userd.users.id != 0{
            var times = [UserDetails]()
            do{
                times = try context.fetch(UserDetails.fetchRequest())
            }catch{
                
            }
            if times.count == 0{
            user = UserDetails(context: context)
            user?.firstname = userd.users.firstname
            user?.lastname = userd.users.lastname
            user?.email = userd.users.email
            user?.ids = Int32(userd.users.id)
            user?.access_token = userd.users.access_token
            user?.expires_at = userd.users.expires_at
            do{
                try context.save()
            }catch{

            }
            }else{
                times[0].access_token = userd.users.access_token
                times[0].firstname = userd.users.firstname
                times[0].lastname = userd.users.lastname
                times[0].email = userd.users.email
                times[0].ids = Int32(userd.users.id)
                times[0].access_token = userd.users.access_token
                times[0].expires_at = userd.users.expires_at
                do{
                    try context.save()
                }catch{

                }
            }

        }else{
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Error", message: "Failed to retrieve user data", preferredStyle: .alert)
                self.present(alert, animated: true, completion: {
                    self.goregardless()
                })
            }
        }
        
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
