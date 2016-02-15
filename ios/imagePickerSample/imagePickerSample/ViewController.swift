//
//  ViewController.swift
//  imagePickerSample
//
//  Created by m0a on 2015/08/23.
//  Copyright © 2015年 m0a. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func runImagePicker(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        self.presentViewController(imagePicker, animated: true) { () -> Void in
            print("complited!")
        }

    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        self.imageView?.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        picker.dismissViewControllerAnimated(true, completion: nil)
    }


}

