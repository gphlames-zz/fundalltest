//
//  pickCardViewController.swift
//  fundallminiproject
//
//  Created by user on 06/05/2020.
//

import UIKit

class pickCardViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var Continue: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    let collectData = ["fundall Lifestyle Pro","fundall LifeStyle Premium","fundall LifeStyle Business"]
    let dataForImages = ["airplane","diamond.fill","gift.fill"]
    var pick = pickCardData()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "pickCardTableViewCell", bundle: nil), forCellReuseIdentifier: "table")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(pickCardCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsVerticalScrollIndicator = false
    }
    @IBAction func closeView(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func continueAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let popop = storyboard.instantiateViewController(identifier: "finalPageViewController")
        popop.modalPresentationStyle = .overCurrentContext
        popop.modalTransitionStyle = .crossDissolve
        navigationController?.present(popop, animated: true, completion: nil)
    }
}
extension pickCardViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! pickCardCollectionViewCell
        cell.namelabel.attributedText = NSAttributedString(string: collectData[indexPath.row], attributes: [.font:UIFont.boldSystemFont(ofSize: 13)])
        cell.namelabel.textColor = .black
        cell.backgroundColor = .gray
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 250)
    }
    

}
extension pickCardViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "table") as! pickCardTableViewCel
        cell.imager.image = UIImage(systemName: dataForImages[indexPath.row])
        cell.namelabel.attributedText = NSAttributedString(string: pick.name[indexPath.row], attributes: [.font: UIFont.boldSystemFont(ofSize: 12)])
        cell.price.text = pick.prices[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
