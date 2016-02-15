//
//  ViewController.swift
//  eigen_tests
//
//  Created by m0a on 2015/08/25.
//  Copyright © 2015年 m0a. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var testEgien02 = TestEigen02()
        testEgien02.testFunc()
//        TestEigen02.testFunc()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

