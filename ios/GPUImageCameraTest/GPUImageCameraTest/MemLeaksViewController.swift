//
//  MemLeaksViewController.swift
//  GPUImageCameraTest
//
//  Created by m0a on 2015/12/23.
//  Copyright © 2015年 m0a. All rights reserved.
//

import UIKit
import GPUImage
import SwiftFilePath


class MemLeaksViewController: UIViewController {

    
    let stilCamera = GPUImageStillCamera()
    let filter1 = GPUImageFilter()
    
    let maskFilter = GPUImageMaskFilter()
    var maskPict:GPUImagePicture?
    
    @IBOutlet weak var outputView: GPUImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stilCamera.outputImageOrientation = .Portrait
        stilCamera.jpegCompressionQuality = 0.8
        
        
        stilCamera.addTarget(filter1)
        filter1.addTarget(outputView)
        stilCamera.startCameraCapture()

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var maskFilePath:Path?
    var saveFilePath:Path?
    
    
    func setupFilter(){
        stilCamera.removeAllTargets()
        filter1.removeAllTargets()
        maskFilter.removeAllTargets()
        maskPict?.removeAllTargets()
        
        
        if maskFilePath != nil {
            //maskfilter on
            guard let maskJpeg = UIImage(contentsOfFile: self.maskFilePath?.asString ?? "" ) else { return }

            self.stilCamera.addTarget(self.maskFilter)
            self.maskPict = GPUImagePicture(image: maskJpeg)
            self.maskPict?.addTarget(self.maskFilter)
            self.maskFilter.addTarget(self.outputView)
            
            self.maskPict?.processImage()
            stilCamera.startCameraCapture()

            stilCamera.addTarget(filter1)
            
        } else {
            //maskfilter off
            stilCamera.addTarget(filter1)
            filter1.addTarget(outputView)
            stilCamera.startCameraCapture()
        }
    }
    
    
    @IBAction func runCapture(sender: AnyObject) {
        
        
        maskFilePath = saveFilePath
        let now = NSDate()
        saveFilePath = Path.cacheDir["\(now).jpg"]
        
        stilCamera.capturePhotoAsJPEGProcessedUpToFilter(filter1) { (data, err) -> Void in
            self.saveFilePath?.writeData(data)
            print(self.saveFilePath?.asString)
            self.setupFilter()
        }
        
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
