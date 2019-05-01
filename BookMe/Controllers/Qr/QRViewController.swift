//
//  QRViewController.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 3/19/19.
//  Copyright © 2019 Alikhan Ilyassov. All rights reserved.
//

import UIKit
import AVFoundation

class QRViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet var videoPreview: UIView!
    
    var stringURL = String()
    var didRecognized = false
    enum error: Error {
        case noCameraAvailable
        case videoInputInitFail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            try scanQRCode()
        }catch{
            print("Failed to scan the QR/Barcode.")
        }

       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didRecognized = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects:[AVMetadataObject], from connection: AVCaptureConnection){
        if metadataObjects.count>0 {
            let machineReadableCode = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            if machineReadableCode.type == AVMetadataObject.ObjectType.qr{
                stringURL = machineReadableCode.stringValue!
                if !didRecognized {
                    performSegue(withIdentifier: "openLink", sender: stringURL)
                }
                didRecognized = true
            }
        }
        
    }
    
    func scanQRCode() throws {
        let avCaptureSession = AVCaptureSession()
        
        guard let avCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video) else{
            print("No camera.")
            throw error.noCameraAvailable
        }
        guard let avCaptureInput = try? AVCaptureDeviceInput(device: avCaptureDevice) else{
            print("Failed to init camera.")
            throw error.videoInputInitFail
        }
        let avCaptureMetadataOutput = AVCaptureMetadataOutput()
        avCaptureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        avCaptureSession.addInput(avCaptureInput)
        avCaptureSession.addOutput(avCaptureMetadataOutput)
        
        avCaptureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        let avCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: avCaptureSession)
        avCaptureVideoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avCaptureVideoPreviewLayer.frame = videoPreview.bounds
        self.videoPreview.layer.addSublayer(avCaptureVideoPreviewLayer)
        
        avCaptureSession.startRunning()
        
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "openLink" {
            if let sender = sender as? String {
                let destination = segue.destination as! DishViewController
                destination.url = sender
            }
           
        }
    }
    
}
