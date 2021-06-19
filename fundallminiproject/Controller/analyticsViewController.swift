//
//  analyticsViewController.swift
//  fundallminiproject
//
//  Created by user on 06/05/2020.
//

import UIKit

class analyticsViewController: UIViewController {
 let analyticsview = analysisView()
    let analyticdata = analyticData()
    var scrollview:UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .white
        return scroll
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollview)
        scrollview.addSubview(analyticsview)
        view.backgroundColor = .white
        let guides = view.safeAreaLayoutGuide
        NSLayoutConstraint(item: scrollview, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: scrollview, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0).isActive = true
        scrollview.topAnchor.constraint(equalTo: guides.topAnchor).isActive = true
        NSLayoutConstraint(item: analyticsview, attribute: .top, relatedBy: .equal, toItem:  scrollview, attribute: .top, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: analyticsview.mainView, attribute: .bottom, relatedBy: .equal, toItem: analyticsview.scrollview, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
//        analyticsview.scrollview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":analyticsview.mainView]))
        NSLayoutConstraint(item: analyticsview, attribute: .width, relatedBy: .equal, toItem: scrollview, attribute: .width, multiplier: 1, constant: 0).isActive = true
       
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":analyticsview.scrollview]))
        scrollview.delegate = self
        analyticsview.backButton.addTarget(self, action: #selector(closeview), for: .touchUpInside)
        scrollview.isUserInteractionEnabled = true
        scrollview.isScrollEnabled = true
        view.backgroundColor = .white
        analyticsview.setConstraints()
        analyticsview.tableview.delegate = self
        analyticsview.collection.delegate = self
        analyticsview.tableview.dataSource = self
        analyticsview.collection.dataSource = self
        analyticsview.tableview.register(UINib(nibName: "analyticsTableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
        analyticsview.collection.register(UINib(nibName: "analyticCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        var height: CGFloat = 0.0
            let y = analyticsview.subviews
            for i in y{
                height+=i.bounds.height
            }
            
        scrollview.contentSize = CGSize(width: analyticsview.frame.width, height: height + 119.0)
        scrollview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
    }
    @objc func closeview(){
        dismiss(animated: true, completion: nil)
    }
}
extension analyticsViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    }
}
extension analyticsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! analyticCollectionViewCell
        cell.colorview.backgroundColor = analyticdata.color[indexPath.row]
        cell.featurelabel.attributedText = NSAttributedString(string:  analyticdata.collectionnames[indexPath.row], attributes: [.font:UIFont.systemFont(ofSize: 10)])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! analyticsTableViewCell
        cell.imageview.image = UIImage(named: analyticdata.images[indexPath.row])
        cell.imageview.contentMode = .scaleAspectFit
        cell.amountlabel.text = "₦\(analyticdata.amounts[indexPath.row])"
        cell.nameLabel.attributedText = NSAttributedString(string: analyticdata.transactionsname[indexPath.row], attributes: [.font:UIFont.boldSystemFont(ofSize: 14)])
        cell.transactionsLabel.text = "\(analyticdata.numbers[indexPath.row]) transactions"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 15)
    }
    
    
}
