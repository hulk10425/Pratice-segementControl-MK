//
//  ViewController.swift
//  UIPlay
//
//  Created by 陳遵丞 on 2017/7/28.
//  Copyright © 2017年 hulk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let items = ["Purple", "Green", "Blue"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let sc = SegementedControl()
        
//        let scii = UISegmentedControl(items: items)
//       let frame = UIScreen.main.bounds
//        scii.selectedSegmentIndex = 0
//        scii.frame = CGRect(x: frame.minX + 10, y: frame.minY + 50, width: frame.width - 20, height: frame.height*0.1)
        
        view.backgroundColor = UIColor.blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.purple
        
        
        
        // Initialize
        let items = ["Purple", "Green", "Blue"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        
        // Set up Frame and SegmentedControl
        let frame = UIScreen.main.bounds
        customSC.frame = CGRect(x: frame.minX + 10, y: frame.minY + 50, width: frame.width - 20, height: frame.height*0.1)
        // Style the Segmented Control
        customSC.layer.cornerRadius = 5.0  // Don't let background bleed
        customSC.backgroundColor = UIColor.black
        customSC.tintColor = UIColor.white
        
        // Add target action method
        customSC.addTarget(self, action: "changeColor:", for: .valueChanged)
        
        // Add this custom Segmented Control to our view
        self.view.addSubview(customSC)
    }
    func changeColor (sender: UISegmentedControl) {
        switch sender.
    }

}

