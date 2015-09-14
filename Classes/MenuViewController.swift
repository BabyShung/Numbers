//
//  MenuViewController.swift
//  Numbers
//
//  Created by Hao Zheng on 9/13/15.
//  Copyright © 2015 Planhola.com. All rights reserved.
//

import UIKit

enum IDs: Int {
    case Rookie = 0, GrandMaster, MyData, Settings
    
    func getIDString() -> String {
        switch self {
        case .Rookie:
            return "RookieOptionsCollectionViewController"
        case .GrandMaster:
            return "GrandMasterOptionsCollectionViewController"
        case .MyData:
            return "MyDataViewController"
        case .Settings:
            return "SettingsCollectionViewController"
        }
    }
}

class MenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    private let cellID = "menuCellID"
    
    let titles = ["Rookie".localized, "Grand Master".localized, "My Data".localized, "Settings".localized]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let value = IDs.init(rawValue: indexPath.row)!
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier(value.getIDString())
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! CenterCollectionViewCell
        cell.titleLabel.text = self.titles[indexPath.row]
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(160, 100)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
}
