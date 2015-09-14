//
//  RookieOptionsCollectionViewController.swift
//  Numbers
//
//  Created by Hao Zheng on 9/13/15.
//  Copyright © 2015 Planhola.com. All rights reserved.
//

import UIKit

private let reuseIdentifier = "RookieOptionsCell"

enum RookieOption: Int {
    case OneToHundred = 0, RandomNumbers, ChineseWords, Images
    
    func getString() -> String {
        switch self {
        case .OneToHundred:
            return "0~100"
        case .RandomNumbers:
            return "Random Numbers"
        case .ChineseWords:
            return "Chinese Words"
        case .Images:
            return "Images"
        }

    }
    
    func getIDString() -> String {
        return "ReadyPageViewController"
//        switch self {
//        case .OneToHundred:
//            return "RookieOptionsCollectionViewController"
//        case .RandomNumbers:
//            return "GrandMasterOptionsCollectionViewController"
//        case .ChineseWords:
//            return "MyDataViewController"
//        case .Images:
//            return "SettingsCollectionViewController"
//        }
    }
}

class RookieOptionsCollectionViewController: UICollectionViewController {

    let titles = ["Numbers 0 -> 100".localized,
        "Random Numbers".localized,
        "Chinese".localized,
        "images".localized,
        "Poker Cards".localized]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.titles.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! RookieOptionsCollectionViewCell
    
        cell.titleLabel.text = self.titles[indexPath.row]
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let value = RookieOption.init(rawValue: indexPath.row)!
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier(value.getIDString()) as! ReadyPageViewController
        vc.rookieOption = value
        
        self.presentViewController(vc, animated: true, completion: nil)
        
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
