//
//  analysisView.swift
//  fundallminiproject
//
//  Created by user on 06/05/2020.
//

import UIKit

class analysisView: UIView {
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    lazy var tableview: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    lazy var collection: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.backgroundColor = .white
        return collectionview
    }()
    
    func setConstraints() {
        // MARK: - initialization section
        let analyticsLabel = UILabel()
        let dateLabel = UILabel()
        let firstStack = UIStackView()
        let firstStackLabel = UILabel()
        let firstStackSecondLabel = UILabel()
        let firstStackmiddleView = UIView()
        let walletandcardimage = UIImageView(image: UIImage(named: "walletandcard"))
        let spendinglabel = UILabel()
        let amountLabel = UILabel()
        let welldoneLabel = UILabel()
        let inflowStack = UIStackView()
        let inflowhorizontalStack = UIStackView()
        let inflowhorizontalStack2 = UIStackView()
        let inflowverticalStack = UIStackView()
        let inflowverticalStack2 = UIStackView()
        let inflowprogressview = UIProgressView()
        let expensesProgressView = UIProgressView()
        let inflowamountLabel1 = UILabel()
        let inflowamountLabel2 = UILabel()
        let inflowLabel = UILabel()
        let expensesLabl = UILabel()
        let nextLabel = UILabel()
        let tableViewLabel = UILabel()
        let topCategoryView = UIView()
        let topCategoryLabel = UILabel()
        let topcategoryImageView = UIImageView(image: UIImage(named: "categoryimageview1"))
        let topcategoryImageView1 = UIImageView(image: UIImage(named: "categoryimageview2"))
        let incometrackerlabel = UILabel()
        let incomeLabelImageview = UIImageView(image: UIImage(named: "graphs"))
        let incomeunderview = UIView()
        let categoryImageStack = UIStackView()
        
        //MARK: - set properties Section
        setresizingmask([self,analyticsLabel,dateLabel,firstStack,firstStackLabel,firstStackSecondLabel,firstStackmiddleView,walletandcardimage,spendinglabel,amountLabel,welldoneLabel,inflowStack,inflowverticalStack,inflowhorizontalStack,inflowhorizontalStack2,inflowverticalStack2,inflowprogressview,inflowamountLabel1,inflowamountLabel2,nextLabel,tableViewLabel,topCategoryView,topCategoryLabel,topcategoryImageView,topcategoryImageView1,incometrackerlabel,incomeunderview,incomeLabelImageview,expensesLabl,expensesProgressView,categoryImageStack,inflowLabel])
        
        // MARK: - firstStack subviews
        firstStack.addSubview(firstStackLabel)
        firstStack.addSubview(firstStackmiddleView)
        firstStack.addSubview(firstStackSecondLabel)
        
        // MARK: - inflowverticalstack subviews
        inflowverticalStack.addSubview(inflowLabel)
        inflowverticalStack.addSubview(inflowprogressview)
        // MARK: - inflowverticalstack2 subviews
        inflowverticalStack2.addSubview(expensesLabl)
        inflowverticalStack2.addSubview(expensesProgressView)
        // MARK: - inflowhorizontalstack subviews
        inflowhorizontalStack.addSubview(inflowverticalStack)
        inflowhorizontalStack.addSubview(inflowamountLabel1)
        // MARK: - inflowhorizontalstack2 subviews
        inflowhorizontalStack2.addSubview(inflowverticalStack2)
        inflowhorizontalStack2.addSubview(inflowamountLabel2)
        // MARK: - inflowstack subviews
        inflowStack.addSubview(inflowhorizontalStack)
        inflowStack.addSubview(inflowhorizontalStack2)
        // MARK: - topcategory subviews
        topCategoryView.addSubview(topCategoryLabel)
        topCategoryView.addSubview(categoryImageStack)
            // MARK: - categoryimagestack
        categoryImageStack.addSubview(topcategoryImageView)
        categoryImageStack.addSubview(topcategoryImageView1)
        
        analyticsLabel.attributedText = NSAttributedString(string: "Analytics", attributes: [.font: UIFont.boldSystemFont(ofSize: 17)])
        dateLabel.attributedText = NSAttributedString(string: "MAY 2020 ", attributes: [.font: UIFont.boldSystemFont(ofSize: 10),.foregroundColor:UIColor(named: "top view home color")])
        firstStack.layer.cornerRadius = 5
        firstStack.layer.borderWidth = 2
        firstStack.layer.borderColor = CGColor(red: 0.004, green: 0.412, blue: 0.220, alpha: 1.0)
        firstStackLabel.text = "INSIGHTS"
        firstStackLabel.backgroundColor = UIColor(named: "top view home color")
        firstStackSecondLabel.text = "COMPARE"
        firstStackSecondLabel.textColor = UIColor(named: "top view home color")
        firstStackmiddleView.backgroundColor = UIColor(named: "top view home color")
        spendinglabel.text = "This month's spending"
        amountLabel.attributedText = NSAttributedString(string: "₦178,500.00", attributes: [.font: UIFont.boldSystemFont(ofSize: 20)])
        amountLabel.textColor = UIColor(named: "top view home color")
        nextLabel.text = "You spent $2,732 on dining out this month. This is 25% more than last month"
        nextLabel.numberOfLines = 0
        welldoneLabel.text = "Well done you have maintained your spending"
        welldoneLabel.adjustsFontSizeToFitWidth = true
        tableViewLabel.attributedText = NSAttributedString(string: "Top Merchants/Transaction", attributes: [.font:UIFont.boldSystemFont(ofSize: 13)])
        topCategoryLabel.attributedText = NSAttributedString(string: "Top Category", attributes: [.font:UIFont.boldSystemFont(ofSize: 13)])
        incometrackerlabel.attributedText = NSAttributedString(string: "INCOME TRACKER", attributes: [.font:UIFont.boldSystemFont(ofSize: 13)])
        incometrackerlabel.textColor = UIColor(named: "top view home color")
        incomeunderview.backgroundColor = .lightGray
        dateLabel.textAlignment = .center
        spendinglabel.textAlignment = .center
        amountLabel.textAlignment = .center
        welldoneLabel.textAlignment = .center
        inflowStack.backgroundColor = UIColor(named: "home page background color")
        nextLabel.backgroundColor = UIColor(named: "home page background color")
        inflowLabel.attributedText = NSAttributedString(string: "Inflow", attributes: [.foregroundColor: UIColor(named: "top view home color")])
        expensesLabl.attributedText = NSAttributedString(string: "Expenses", attributes: [.foregroundColor: UIColor(named: "top view home color")])
        inflowamountLabel1.text = "₦525"
        inflowamountLabel2.text = "₦520"
        inflowprogressview.progress = 0.7
        inflowprogressview.progressTintColor = UIColor(named: "top view home color")
        inflowprogressview.trackTintColor = UIColor(named: "home page background color")
        expensesProgressView.progress = 0.0
        incomeLabelImageview.contentMode = .scaleAspectFit
        walletandcardimage.contentMode = .scaleAspectFit
        topcategoryImageView.contentMode = .scaleAspectFit
        topcategoryImageView1.contentMode = .scaleAspectFit
        addtomainview([backButton,analyticsLabel,dateLabel,firstStack,walletandcardimage,spendinglabel,amountLabel,welldoneLabel,inflowStack,nextLabel,tableViewLabel,tableview,topCategoryView,incometrackerlabel,incomeLabelImageview,incomeunderview,collection])
       
       
        // MARK: - Mainview constraints
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(5)-[v0(30)]-(10)-[v1(30)]-(5)-[v2(15)]-(5)-[v3(50)]-(5)-[v4(200)][v5(25)]-(2)-[v6(40)]-(2)-[v7(25)]-(5)-[v8(100)][v10(50)]-(5)-[v11(15)]-(5)-[v12(240)]-(20)-[v13(200)]-(50)-[v14(15)][v15(150)][v16(2)][v17(80)]", options: [], metrics: nil, views: ["v0":backButton,"v1":analyticsLabel,"v2":dateLabel,"v3":firstStack,"v4":walletandcardimage,"v5":spendinglabel,"v6":amountLabel,"v7":welldoneLabel,"v8":inflowStack,"v10":nextLabel,"v11":tableViewLabel,"v12":tableview,"v13":topCategoryView,"v14":incometrackerlabel,"v15":incomeLabelImageview,"v16":incomeunderview,"v17":collection]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0(50)]", options: [], metrics: nil, views: ["v0":backButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":analyticsLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":dateLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":firstStack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":walletandcardimage]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":spendinglabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":amountLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":welldoneLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":inflowStack]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":nextLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":tableViewLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":tableview]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":topCategoryView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":incometrackerlabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":incomeLabelImageview]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":incomeunderview]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":collection]))
        
        // MARK: - firstStack constraints
        NSLayoutConstraint(item: firstStackmiddleView, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: firstStack, attribute: .centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: firstStackmiddleView, attribute: .trailing, relatedBy: .equal, toItem: firstStackSecondLabel, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: firstStackmiddleView, attribute: .leading, relatedBy: .equal, toItem: firstStackLabel, attribute: .trailing, multiplier: 1, constant: 3).isActive = true
//        NSLayoutConstraint(item: firstStackmiddleView, attribute: .top, relatedBy: .equal, toItem: firstStack, attribute: .top, multiplier: 1, constant: -3).isActive = true
//        NSLayoutConstraint(item: firstStackmiddleView, attribute: .bottom, relatedBy: .equal, toItem: firstStack, attribute: .bottom, multiplier: 1, constant: -3).isActive = true
        NSLayoutConstraint(item: firstStackLabel, attribute: .leading, relatedBy: .equal, toItem: firstStack, attribute: .leading, multiplier: 1, constant: 3).isActive = true
        NSLayoutConstraint(item: firstStackmiddleView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 2).isActive = true
        firstStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(3)-[v0]-(3)-|", options: [], metrics: nil, views: ["v0":firstStackLabel]))
        firstStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(3)-[v0]-(3)-|", options: [], metrics: nil, views: ["v0":firstStackSecondLabel]))
        firstStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(4)-[v0]-(4)-|", options: [], metrics: nil, views: ["v0":firstStackmiddleView]))
        
        // MARK: - inflowStack constraints
        inflowStack.distribution = .fillEqually
        inflowStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(50)][v1(50)]|", options: [], metrics: nil, views: ["v0":inflowhorizontalStack,"v1":inflowhorizontalStack2]))
        inflowStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":inflowhorizontalStack]))
        inflowStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: [], metrics: nil, views: ["v0":inflowhorizontalStack2]))
        
        
        // MARK: - inflowverticalStack constraints
        inflowverticalStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0][v1(5)]|", options: [], metrics: nil, views: ["v0":inflowLabel,"v1":inflowprogressview]))
        inflowverticalStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(3)-[v0]-(3)-|", options: [], metrics: nil, views: ["v0":inflowLabel]))
        inflowverticalStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(3)-[v0]-(3)-|", options: [], metrics: nil, views: ["v0":inflowprogressview]))
        
        // MARK: - inflowverticalStack2 constraints
        
        inflowverticalStack2.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0][v1(5)]|", options: [], metrics: nil, views: ["v0":expensesLabl,"v1":expensesProgressView]))
        inflowverticalStack2.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(3)-[v0]-(3)-|", options: [], metrics: nil, views: ["v0":expensesLabl]))
        inflowverticalStack2.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(3)-[v0]-(3)-|", options: [], metrics: nil, views: ["v0":expensesProgressView]))
        
        // MARK: - inflowhorizontalStack constraints
        inflowhorizontalStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0][v1(60)]|", options: [], metrics: nil, views: ["v0":inflowverticalStack,"v1":inflowamountLabel1]))
        // MARK: - inflowhorizontalStack2 constraints
        inflowhorizontalStack2.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0][v1(60)]|", options: [], metrics: nil, views: ["v0":inflowverticalStack2,"v1":inflowamountLabel2]))
        // MARK: - topcategoryview constraints
        topCategoryView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(2)-[v0(15)]-(20)-[v1]-(30)-|", options: [], metrics: nil, views: ["v0":topCategoryLabel,"v1":categoryImageStack]))
        topCategoryView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]|", options: [], metrics: nil, views: ["v0":topCategoryLabel]))
        topCategoryView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[v0]-(20)-|", options: [], metrics: nil, views: ["v0":categoryImageStack]))
        
        // MARK: - categoryImageStack constraints
        
        categoryImageStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]-(20)-[v1]|", options: [], metrics: nil, views: ["v0":topcategoryImageView,"v1":topcategoryImageView1]))
        categoryImageStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":topcategoryImageView]))
        categoryImageStack.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: [], metrics: nil, views: ["v0":topcategoryImageView1]))
        
        
    }
    func setresizingmask(_ views: [UIView]){
        for view in views{
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    func addtomainview(_ views: [UIView]){
        for view in views{
            addSubview(view)
        }
    }
//    override func layoutSubviews() {
//        setConstraints()
//        scrollview.contentSize = mainView.bounds.size
//    }
}
