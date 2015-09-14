//
//  ReadyPageViewController.swift
//  Numbers
//
//  Created by Hao Zheng on 9/13/15.
//  Copyright © 2015 Planhola.com. All rights reserved.
//

import UIKit

class ReadyPageViewController: UIViewController {

    var rookieOption : RookieOption?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(rookieOption!.getString())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
