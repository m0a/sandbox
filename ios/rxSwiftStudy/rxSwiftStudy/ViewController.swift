//
//  ViewController.swift
//  rxSwiftStudy
//
//  Created by m0a on 2015/06/25.
//  Copyright (c) 2015年 m0a. All rights reserved.
//

import RxSwift
import RxCocoa

import UIKit
import SpriteKit



class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let subscription = textField.rx_text >- label.rx_subscribeTextTo
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

