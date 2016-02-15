//
//  ViewController.swift
//  GPUImageCameraTest
//
//  Created by m0a on 2015/08/22.
//  Copyright © 2015年 m0a. All rights reserved.
//

import UIKit
import GPUImage


class ViewController: UIViewController {

    @IBOutlet weak var outputView: GPUImageView!
    @IBOutlet weak var copyImageView: UIImageView!
    
    var videoCamera:GPUImageVideoCamera?
    var grayScalefilter:GPUImageGrayscaleFilter?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.videoCamera = GPUImageVideoCamera(sessionPreset: AVCaptureSessionPreset352x288, cameraPosition: .Back)
        self.videoCamera?.outputImageOrientation = .Portrait
        
        self.grayScalefilter = GPUImageGrayscaleFilter()
        videoCamera?.addTarget(grayScalefilter)
        
        let lastFilter = grayScalefilter
        lastFilter?.addTarget(outputView)
        
        lastFilter?.frameProcessingCompletionBlock = { (output,t) in
            
            //次のフレーム用の呼び出し
            defer { output!.useNextFrameForImageCapture() }
            
            //uiimageの取得
            guard let image = output!.imageFromCurrentFramebuffer() else {
                print("error get image!")
                return
            }
            
            //mainスレッドで処理する
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.copyImageView.image = image
            })
            
        }
        
        //最初のフレーム用の呼び出し
        lastFilter?.useNextFrameForImageCapture()
        videoCamera?.startCameraCapture()

    }

}

