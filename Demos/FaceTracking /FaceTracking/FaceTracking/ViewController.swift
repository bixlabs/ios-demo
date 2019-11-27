//
//  ViewController.swift
//  FaceTracking
//
//  Created by Cris on 27/11/19.
//  Copyright © 2019 Cris. All rights reserved.
//

import AVFoundation
import UIKit
import os.log
import Vision

class ViewController: UIViewController {
    
    //MARK: - Properties
    private let session = AVCaptureSession()
    private let videoOutput = AVCaptureVideoDataOutput()
    private let dataOutputQueue = DispatchQueue(label: "video data queue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
    private var shapes: [CAShapeLayer] = []
    private lazy var previewLayer = AVCaptureVideoPreviewLayer(session: session)
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCameraSession()
        setupVideoOutput()
        setupPreviewLayer()
        session.startRunning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = view.bounds
    }
}

//MARK: - Private Methods
private extension ViewController {
    
    func setupCameraSession() {
        guard let device = AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera, .builtInDualCamera, .builtInTrueDepthCamera],
            mediaType: .video,
            position: .front).devices.first else {
                os_log("No device found", log: OSLog.default, type: .error)
                return
        }
        
        guard let deviceInput = try? AVCaptureDeviceInput(device: device) else {
            os_log("Error trying to create device input", log: OSLog.default, type: .error)
            return
        }
        session.addInput(deviceInput)
    }
    
    func setupVideoOutput() {
        videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
        videoOutput.setSampleBufferDelegate(self, queue: dataOutputQueue)
        videoOutput.alwaysDiscardsLateVideoFrames = true
        session.addOutput(videoOutput)
        let videoConnection = videoOutput.connection(with: .video)
        videoConnection?.videoOrientation = .portrait
    }
    
    func setupPreviewLayer() {
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.bounds
        view.layer.addSublayer(previewLayer)
    }
}


extension ViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        let detectFaceRequest = VNDetectFaceLandmarksRequest(completionHandler: detectedFace)
        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: imageBuffer, orientation: .leftMirrored, options: [:])
    
        do {
            try imageRequestHandler.perform( [detectFaceRequest])
        } catch {
            os_log("Error during the face tracking", log: OSLog.default, type: .error)
        }
    }
    
    func detectedFace(request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            self.clearDraw()
            
            guard let results = request.results as? [VNFaceObservation]  else {
                self.clearDraw()
                return
            }
            
            let faceBoxes: [CAShapeLayer] = results.map({ (observedFace: VNFaceObservation) -> CAShapeLayer in
                let faceBoxOnScreen = self.previewLayer.layerRectConverted(fromMetadataOutputRect: observedFace.boundingBox)
                let faceBoxPath = CGPath(rect: faceBoxOnScreen, transform: nil)
                let faceBoxShape = CAShapeLayer()
                
                faceBoxShape.path = faceBoxPath
                faceBoxShape.fillColor = UIColor.clear.cgColor
                faceBoxShape.strokeColor = UIColor.red.cgColor
                return faceBoxShape
            })
            
            faceBoxes.forEach({ faceBoundingBox in self.view.layer.addSublayer(faceBoundingBox) })
            self.shapes = faceBoxes
        }
    }
    
    func clearDraw() {
        shapes.forEach({ drawing in drawing.removeFromSuperlayer() })
    }
}
