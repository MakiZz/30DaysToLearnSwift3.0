//
//  ViewController.swift
//  界面切换
//
//  Created by mk on 17/3/10.
//  Copyright © 2017年 maki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var baseScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let leftView = LeftView()
        let centerView = CameraView()
        let rightView = RightView()
        
        self.addChildViewController(leftView)
        self.baseScrollView.addSubview(leftView.view)
        leftView.didMove(toParentViewController: self)
        
        self.addChildViewController(rightView)
        self.baseScrollView.addSubview(rightView.view)
        rightView.didMove(toParentViewController: self)
        
        self.addChildViewController(centerView)
        self.baseScrollView.addSubview(centerView.view)
        centerView.didMove(toParentViewController: self)
        
        centerView.view.frame.origin.x = self.view.frame.width
        rightView.view.frame.origin.x = 2 * self.view.frame.width
        
        self.baseScrollView.contentSize = CGSize.init(width: self.view.frame.width * 3, height: self.view.frame.height)
        
    }
    

}



class LeftView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView.init(frame: view.frame)
        imageView.image = UIImage.init(named: "left")
        view.addSubview(imageView)
    }
    
}



class RightView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView.init(frame: view.frame)
        imageView.image = UIImage.init(named: "right")
        view.addSubview(imageView)
    }
    
}


import AVFoundation
class CameraView: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var cameraView : UIView!
    var tempImageView : UIImageView!
    
    
    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCaptureStillImageOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraView = UIView.init(frame: view.frame)
        view.addSubview(cameraView)
        tempImageView = UIImageView(frame:view.frame)
        view.addSubview(tempImageView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = cameraView.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        captureSession = AVCaptureSession.init()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let backCamera = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeAudio)
        
        var error : NSError?
        var input : AVCaptureDeviceInput!
        
        do {
            input = try AVCaptureDeviceInput.init(device: backCamera)
        }catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        if (error == nil && captureSession?.canAddInput(input) != nil) {
            captureSession?.addInput(input)
            
            stillImageOutput = AVCaptureStillImageOutput.init()
            stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
            
            if captureSession?.canAddOutput(stillImageOutput) != nil {
                captureSession?.addOutput(stillImageOutput)
                
                previewLayer = AVCaptureVideoPreviewLayer.init(session: captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.portrait
                cameraView.layer.addSublayer(previewLayer!)
                captureSession?.startRunning()
            }
            
            
        }
        
        
    }
    
    func didPressTakePhoto(){
        
        if let videoConnection = stillImageOutput?.connection(withMediaType: AVMediaTypeVideo) {
            videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
            stillImageOutput?.captureStillImageAsynchronously(from: videoConnection, completionHandler: { (sampleBuffer, error) in
                if sampleBuffer != nil{
                    
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    let dataProvider = CGDataProvider.init(data: imageData as! CFData)
                    let cgImageRef = CGImage.init(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: .defaultIntent)
                    
                    let image = UIImage.init(cgImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.right)
                    self.tempImageView.image = image
                    self.tempImageView.isHidden = false
                }
            })
        }
    }
    
    var didTakePhoto = Bool.init()
    
    func didPressTakeAnother() {
        
        if didTakePhoto == true {
            tempImageView.isHidden = true
            didTakePhoto = false
        }else{
            captureSession?.startRunning()
            didTakePhoto = true
            didPressTakePhoto()
        }
        
    }
    
    
}
