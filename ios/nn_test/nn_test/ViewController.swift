//
//  ViewController.swift
//  nn_test
//
//  Created by m0a on 2015/08/19.
//  Copyright (c) 2015年 m0a. All rights reserved.
//

import UIKit
import GPUImage
import Accelerate


func imageFromView(view:UIView) -> UIImage {
    UIGraphicsBeginImageContext(view.frame.size)
    let context = UIGraphicsGetCurrentContext();
    view.layer.renderInContext(context!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
}



extension UIView {
    func uiimage() -> UIImage {
        UIGraphicsBeginImageContext(self.frame.size)
        let context = UIGraphicsGetCurrentContext();
        self.layer.renderInContext(context!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}



class ViewController: UIViewController {

    var videoCamera:GPUImageVideoCamera?
//    var filter:GPUImagePixellateFilter?
    var grayScalefilter:GPUImageGrayscaleFilter?
    var cropFilter:GPUImageCropFilter?
    var invertColorFilter:GPUImageColorInvertFilter?
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var debugLabel: UILabel!
    
    
    @IBOutlet weak var gpuImageView: GPUImageView!
    @IBOutlet weak var smallGpuImageView: GPUImageView!
    
    @IBOutlet weak var debugImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let theta1 = la_matrix_from_double_array(loadMatrix("theta1.txt")) else {
            return
        }
        guard let theta2 = la_matrix_from_double_array(loadMatrix("theta2.txt")) else {
            return
        }
        

        
//        videoCamera = GPUImageVideoCamera(sessionPreset: AVCaptureSessionPreset640x480, cameraPosition: .Back)
        videoCamera = GPUImageVideoCamera(sessionPreset: AVCaptureSessionPreset352x288, cameraPosition: .Back)
        if let vc = videoCamera {
            vc.outputImageOrientation = .Portrait
        } else {
            return
        }
        
//        videoCamera?.forceProcessingAtSizeRespectingAspectRatio(CGSizeMake(1.0, 1.0))
        videoCamera?.forceProcessingAtSize(CGSizeMake(288, 288))

        grayScalefilter = GPUImageGrayscaleFilter()
        grayScalefilter?.forceProcessingAtSize(CGSizeMake(20, 20))
        
//        cropFilter = GPUImageCropFilter(cropRegion: CGRectMake(0, 0, 0.5, 0.5) )
        invertColorFilter = GPUImageColorInvertFilter()

        videoCamera?.addTarget(grayScalefilter)
        grayScalefilter?.addTarget(invertColorFilter)
     
        let lastFilter = invertColorFilter
        
        lastFilter?.setInputRotation(kGPUImageFlipHorizonal, atIndex: 0)
        lastFilter?.setInputRotation(kGPUImageFlipVertical, atIndex: 0)
        lastFilter?.addTarget(self.gpuImageView)
        lastFilter?.addTarget(self.smallGpuImageView)
//        cropFilter?.addTarget(self.gpuImageView)
        
        lastFilter?.frameProcessingCompletionBlock = {
           [weak self] (output:GPUImageOutput!, time:CMTime) in
            
            defer { output!.useNextFrameForImageCapture() }
            
            
            guard let image = output!.imageFromCurrentFramebuffer() else {
                print("error get image!")
                return
            }
            
//            image.saveImage("bb\(time.value).png")
                let inputs = image.pixelGrayscaleArray()
                let x = la_matrix_from_double_array(inputs, rows: UInt(1), columns: UInt(400))
//                print(results.count)
                let results = predict(theta1, theta2: theta2, x: x)
                if let result = results.first?.result,present = results.first?.present {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self?.resultLabel.text = "\(result)"
                        self?.debugLabel.text = "\(present)% value = \(time.value)"
//                        image.saveImage("aa\(time.value).png")
                        self?.debugImageView.image = image
                        
                    })
                }
        }
        
        lastFilter?.useNextFrameForImageCapture()
        videoCamera?.startCameraCapture()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

