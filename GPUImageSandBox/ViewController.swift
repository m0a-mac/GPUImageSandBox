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
    
    @IBOutlet var screenView: GPUImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        videoCamera = GPUImageAVCamera(sessionPreset: AVCaptureSessionPreset1280x720, cameraDevice:nil)

        // Do any additional setup after loading the view.
        videoCamera?.addTarget(screenView!)
        
        videoCamera!.startCameraCapture()

        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

