//
//  DICOMViewController.swift
//  Svasthiya
//
//  Created by admin on 21/02/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import UIKit

class DICOMViewController: UIViewController,UIScrollViewDelegate {

  @IBOutlet weak var navView: UIView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var dicomImageView: UIImageView!
  override func viewDidLoad() {
        super.viewDidLoad()
    
  
    
    
    scrollView.delegate = self
    scrollView.backgroundColor = UIColor(red: 90, green: 90, blue: 90, alpha: 0.90)
    scrollView.alwaysBounceVertical = false
    scrollView.alwaysBounceHorizontal = false
    scrollView.showsVerticalScrollIndicator = true
    scrollView.flashScrollIndicators()
    
    scrollView.minimumZoomScale = 1.0
    scrollView.maximumZoomScale = 10.0

  let filePath = Bundle.main.path(forResource: "image-000001", ofType: "dcm")
      //            let dicomDIR = try ImebraDicomDir.getNewEntry(getImagePath)
    do{
      
    
      let dataSet = try ImebraCodecFactory.load(fromFile:filePath)
      print("the dataset is",dataSet);
      let DICOMDIR = try ImebraDicomDir.init(dataSet:dataSet )
      print("the DICOMDIR is",DICOMDIR)
      // patientNameCharacter
      let patientNameCharacter = try dataSet.getString(ImebraTagId(group: 0x10, tag: 0x10), elementNumber: 0, defaultValue: "")
      print("the patientNameCharacter",patientNameCharacter)
      // patientNameIdeographic
      let patientNameIdeographic = try dataSet.getString(ImebraTagId(group: 0x10, tag: 0x10), elementNumber: 1, defaultValue: "")
      print("the patientNameIdeographic",patientNameIdeographic)
      
      let image = try dataSet.getImageApplyModalityTransform(0)
      let colorSpace = image.colorSpace
      let width = image.width
      let height = image.height
      
      let chain = Utils.applyTransformation(colorSpace: colorSpace,
                                            dataSet: dataSet,
                                            image: image,
                                            width: width,
                                            height: height)
      
      self.dicomImageView.image = Utils.generateImage(chain: chain!, image: image)
    }catch{
      
    }
    print("the list of docfolder is",listFilesFromDocumentsFolder())
  }
  
  func listFilesFromDocumentsFolder() -> [String]?
  {
    let fileMngr = FileManager.default;
    
    // Full path to documents directory
    let docs = fileMngr.urls(for: .documentDirectory, in: .userDomainMask)[0].path
    
    // List all contents of directory and return as [String] OR nil if failed
    return try? fileMngr.contentsOfDirectory(atPath:docs)
  }

    
    @IBAction func closeClicked(_ sender: UIButton) {
      if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.goToReactNative()
        }
        
    }
  
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return self.dicomImageView
  }
}
