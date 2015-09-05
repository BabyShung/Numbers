//
//  RandomNumbersViewController.swift
//  Rambers
//
//  Created by Hao Zheng on 7/26/15.
//  Copyright (c) 2015 Alarm.com. All rights reserved.
//

import UIKit
import Bond

class RandomNumbersViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var randomNumberLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //view model
    let viewModel = RandomNumberViewModel()
    
    let options = [26, 52, 80, 150, 200]
    
    /**
    Life cycle
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Good"
        
        startButton.themeWithColor(UIColor.orangeColor())
        stopButton.themeWithColor(UIColor.blueColor())
        
        viewModel.randomNumberText.bindTo(randomNumberLabel.bnd_text)
        viewModel.timerText.bindTo(timerLabel.bnd_text)
        viewModel.randomNumberLabelHidden.bindTo(randomNumberLabel.bnd_hidden)
        
        viewModel.startButtonEnabled.bindTo(startButton.bnd_enabled)
        viewModel.stopButtonEnabled.bindTo(stopButton.bnd_enabled)
        
        startButton.bnd_tap.observe {
            [unowned self] event in
            self.viewModel.digitNumbers = self.options[self.pickerView.selectedRowInComponent(0)]
            self.viewModel.startTimer()
            self.pickerView.hidden = true
        }
        
        stopButton.bnd_tap.observe {
            [unowned self] event in
            self.viewModel.stopTimer()
            self.pickerView.hidden = false
            
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("EnterResultViewController") as! EnterResultViewController
            //pass the data
            vc.tuple = (self.randomNumberLabel.text!, self.timerLabel.text!)
            
            vc.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            self.presentViewController(vc, animated: true) { () -> Void in
                self.randomNumberLabel.text = ""
            }
        }
    }
    
    /**
    Picker View delegates
    */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(options[row]) digits"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
