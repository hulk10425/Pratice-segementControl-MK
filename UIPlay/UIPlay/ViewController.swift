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
        
        let scii = UISegmentedControl(items: items)
//        let frame = UI
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

