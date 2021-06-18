//
//  finalPageViewController.swift
//  fundallminiproject
//
//  Created by user on 06/05/2020.
//

import UIKit


class finalPageViewController: UIViewController {

    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet var mainview: UIView!
    @IBAction func finshAction(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateViewController(identifier: "HomeViewController")
        nextView.modalPresentationStyle = .fullScreen
        present(nextView, animated: true, completion: nil)
    }
    @IBOutlet weak var markerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        mainview.backgroundColor = .gray
//        mainview.layer.opacity = 0.5
        mainview.bringSubviewToFront(secondView)
        navigationController?.navigationBar.isHidden = true
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

