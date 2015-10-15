//
//  ViewController.swift
//  GPUImageSandBox
//
//  Created by m0a on 2014/12/21.
//  Copyright (c) 2014年 m0a. All rights reserved.
//

import Cocoa
import GPUImage


class ViewController: NSViewController {

    var videoCamera: GPUImageAVCamera?
//    var sampleVideo: GPUImageMovie?
    
    @IBOutlet var screen0 : GPUImageView!
    @IBOutlet var screen1 : GPUImageView!
    @IBOutlet weak var screen2: GPUImageView!
    @IBOutlet weak var screen3: GPUImageView!
    @IBOutlet weak var screen4: GPUImageView!
    
    var filter0: GPUImagePolkaDotFilter?
    var filter1: GPUImageGrayscaleFilter?
    var filter2: GPUImageBrightnessFilter?
    var filter3: GPUImageExposureFilter?
    var filter4: GPUImageColorInvertFilter?

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        videoCamera = GPUImageAVCamera(sessionPreset: AVCaptureSessionPreset1280x720, cameraDevice:nil)
        videoCamera = GPUImageAVCamera(sessionPreset: AVCaptureSessionPreset320x240, cameraDevice:nil)
        videoCamera?.horizontallyMirrorRearFacingCamera = false
        videoCamera?.horizontallyMirrorFrontFacingCamera = false
        
//        sampleVideo = GPUImageMovieWriter.

        
        
//        let movieFile = GPUImageMovi
//        movieFile.playAtActualSpeed = true
        
        filter0 = GPUImagePolkaDotFilter()
        filter1 = GPUImageGrayscaleFilter()
        
        filter2 = GPUImageBrightnessFilter()
        filter2?.brightness = 0.9
        
        filter3 = GPUImageExposureFilter()
        filter3?.exposure = 8.0
        
        filter4 = GPUImageColorInvertFilter()
        
        
        videoCamera?.addTarget(filter0)
        videoCamera?.addTarget(filter1)
        videoCamera?.addTarget(filter2)
        videoCamera?.addTarget(filter3)
//        videoCamera?.addTarget(filter4)
        
        
        filter0?.addTarget(screen0)
        filter1?.addTarget(screen1)
        filter2?.addTarget(screen2)
        filter3?.addTarget(screen3)
        
        filter1?.addTarget(filter4)
        
        filter3?.frameProcessingCompletionBlock = { (output:GPUImageOutput!, time:CMTime)  in
            print("run comp block\n")
        }
        
//        filter4?.setInputRotation(<#T##newInputRotation: GPUImageRotationMode##GPUImageRotationMode#>, atIndex: <#T##Int#>)
        filter4?.addTarget(screen4)
        
        
        screen0?.setInputRotation(kGPUImageFlipHorizonal, atIndex: 0)
        screen1?.setInputRotation(kGPUImageFlipHorizonal, atIndex: 0)
        screen2?.setInputRotation(kGPUImageFlipHorizonal, atIndex: 0)
        screen3?.setInputRotation(kGPUImageFlipHorizonal, atIndex: 0)
        screen4?.setInputRotation(kGPUImageFlipHorizonal, atIndex: 0)
        
        
        
        videoCamera!.startCameraCapture()

        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

