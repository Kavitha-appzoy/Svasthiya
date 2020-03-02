//
//  ViewController.swift
//  DicomImageProcessing
//
//  Created by admin on 18/02/20.
//  Copyright © 2020 Genix. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class MultipleDICOMViewController: UIViewController{
    var player: AVPlayer?
    let avPVC = AVPlayerViewController()
    var customArray = [UIImage]()
  var session : URLSession!
  var queue : OperationQueue!
  @IBOutlet weak var loadingIndicaotr: UIActivityIndicatorView!
  @IBOutlet weak var videoView: UIView!
  override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicaotr.startAnimating()
        // path to documents directory
    
//      creatingFolderInFile()
    
    
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
      if customArray.count == 0{
        let folderStatus = creatingFolderInFile(docName: "Svas")
        if folderStatus == "created"{
          print("folder got created and calling sample fucntion")
          operationQueue()
        }else{
          print("already exists")
          dicomfiles()
        }
        
      }
    }
  func creatingFolderInFile(docName: String) -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    // Get documents folder
    let documentsDirectory: String = paths.first ?? ""
    // Get your folder path
    let dataPath = documentsDirectory + "/\(docName)"
    if !FileManager.default.fileExists(atPath: dataPath) {
      // Creates that folder if not exists
      try? FileManager.default.createDirectory(atPath: dataPath, withIntermediateDirectories: false, attributes: nil)
      return "created"
    }else{
      return "already exist"
      
    }
    
  }
  func sample()  {
    let dicomFilesArray = ["https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000015.dcm?generation=1581415062884470&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000016.dcm?generation=1581415062230154&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000017.dcm?generation=1581415062670193&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000018.dcm?generation=1581415062773819&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000019.dcm?generation=1581415062852944&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000020.dcm?generation=1581415062886415&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000021.dcm?generation=1581415062805678&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000022.dcm?generation=1581415062938729&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000023.dcm?generation=1581415062898779&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000024.dcm?generation=1581415062969097&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000001.dcm?generation=1578641790045896&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000002.dcm?generation=1579760542523768&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000003.dcm?generation=1579761521096032&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000004.dcm?generation=1579761521091927&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000005.dcm?generation=1581415062838560&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000006.dcm?generation=1581415062628116&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000007.dcm?generation=1581415060712173&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000008.dcm?generation=1581415062296635&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000009.dcm?generation=1581415062663642&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000010.dcm?generation=1581415062872337&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000011.dcm?generation=1581415061299899&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000012.dcm?generation=1581415056748422&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000013.dcm?generation=1581415060924252&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000014.dcm?generation=1581415062829683&alt=media"]
    //         let dicomFilesArray = []
    for i in 0 ..< dicomFilesArray.count{
      do{
        let fileName = "Kavitha/\(i).dcm"
        // Create destination URL
        let documentsUrl:URL =  (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL?)!
        let destinationFileUrl = documentsUrl.appendingPathComponent(fileName)
        
        let fileURL = URL(string: dicomFilesArray[i])
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        let request = URLRequest(url:fileURL!)
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
          if let tempLocalUrl = tempLocalUrl, error == nil {
            // Success
            if let statusCode = (response as? HTTPURLResponse)?.statusCode {
              print("Successfully downloaded. Status code: \(statusCode)")
            }
            
            do {
              try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
              print("the destination URL is",destinationFileUrl);
              //                            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
              //                            let filePath = paths.appendingPathComponent("/Kavitha/dcmFile1.dcm")
              //                            let dataSet = try ImebraCodecFactory.load(fromFile:filePath)
              //
              //                            // patientNameCharacter
              //                            _ = try dataSet.getString(ImebraTagId(group: 0x10, tag: 0x10), elementNumber: 0, defaultValue: "")
              //
              //                            // patientNameIdeographic
              //                            _ = try dataSet.getString(ImebraTagId(group: 0x10, tag: 0x10), elementNumber: 1, defaultValue: "")
              //
              //                            let image = try dataSet.getImageApplyModalityTransform(0)
              //                            let colorSpace = image.colorSpace
              //                            let width = image.width
              //                            let height = image.height
              //
              //                            let chain = Utils.applyTransformation(colorSpace: colorSpace,
              //                                                                  dataSet: dataSet,
              //                                                                  image: image,
              //                                                                  width: width,
              //                                                                  height: height)
              
              //                        self.dicomImageView.image = Utils.generateImage(chain: chain!, image: image)
              
              
              
              
            } catch (let writeError) {
              print("Error creating a file \(destinationFileUrl) : \(writeError)")
            }
            
          } else {
            print("Error took place while downloading a file. Error description: %@", error?.localizedDescription);
          }
        }
        task.resume()
        
        
      } catch let error{
        print("the exception is",error.localizedDescription);
      }
    }
    
    
  }
  func operationQueue(){
    session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
    queue = OperationQueue()
    queue.maxConcurrentOperationCount = 1
    let completionOperation = BlockOperation {
      
      print("finished download all")
      DispatchQueue.main.async {
        self.dicomfiles()
        self.loadingIndicaotr.stopAnimating()
        //                self.cancelButton.isEnabled = false
      }
    }
    let urls = ["https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000015.dcm?generation=1581415062884470&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000016.dcm?generation=1581415062230154&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000017.dcm?generation=1581415062670193&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000018.dcm?generation=1581415062773819&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000019.dcm?generation=1581415062852944&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000020.dcm?generation=1581415062886415&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000021.dcm?generation=1581415062805678&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000022.dcm?generation=1581415062938729&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000023.dcm?generation=1581415062898779&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000024.dcm?generation=1581415062969097&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000001.dcm?generation=1578641790045896&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000002.dcm?generation=1579760542523768&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000003.dcm?generation=1579761521096032&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000004.dcm?generation=1579761521091927&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000005.dcm?generation=1581415062838560&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000006.dcm?generation=1581415062628116&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000007.dcm?generation=1581415060712173&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000008.dcm?generation=1581415062296635&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000009.dcm?generation=1581415062663642&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000010.dcm?generation=1581415062872337&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000011.dcm?generation=1581415061299899&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000012.dcm?generation=1581415056748422&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000013.dcm?generation=1581415060924252&alt=media","https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000014.dcm?generation=1581415062829683&alt=media"]
    //        let urls = [
    //            URL(string: "https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000015.dcm?generation=1581415062884470&alt=media")!,
    //            URL(string: "https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000016.dcm?generation=1581415062230154&alt=media")!,
    //            URL(string: "https://www.googleapis.com/download/storage/v1/b/dicom-file-test-bucket/o/image-000017.dcm?generation=1581415062670193&alt=media")!
    //        ]
    
    for index in 0 ..< urls.count {
      let url = URL(string:urls[index])
      let operation = DownloadOperation(session: self.session, downloadTaskURL: url!,index : index, completionHandler: { (localURL, urlResponse, error) in
        
        if error == nil {
          DispatchQueue.main.async {
            //                        self.progressLabel.text = "\(index + 1) / \(urls.count) files downloaded"
          }
        }
      })
      
      completionOperation.addDependency(operation)
      self.queue.addOperation(operation)
    }
    
    self.queue.addOperation(completionOperation)
    
  }
   
  func dicomfiles(){
    
    
    //        var ImageArray =  [UIImage]()
    
    for index in (0 ..< 24){
      let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
      print("the paths is",paths);
      let getImagePath = paths.appendingPathComponent("/Svas/\(index).dcm")
      print("the getImagePath is",getImagePath);
      //            let dicomDIR = try ImebraDicomDir.getNewEntry(getImagePath)
      do{
        let dataSet = try ImebraCodecFactory.load(fromFileMaxSize:getImagePath , maxBufferSize: 2048)
        //                dataSetArray.append(dataSet)
        // patientNameCharacter
        let patientNameCharacter = try dataSet.getString(ImebraTagId(group: 0x10, tag: 0x10), elementNumber: 0, defaultValue: "")
        print("the patientNameCharacter",patientNameCharacter)
        // patientNameIdeographic
        let patientNameIdeographic = try dataSet.getString(ImebraTagId(group: 0x10, tag: 0x10), elementNumber: 1, defaultValue: "")
        print("the patientNameIdeographic",patientNameIdeographic)
        
        let image = try dataSet.getImageApplyModalityTransform(0)
        print("the Image", image)
        let colorSpace = image.colorSpace
        let width = image.width
        let height = image.height
        
        let chain = Utils.applyTransformation(colorSpace: colorSpace,
                                              dataSet: dataSet,
                                              image: image,
                                              width: width,
                                              height: height)
        let imageImebra =  Utils.generateImage(chain: chain!, image: image)
        customArray.append(imageImebra!)
        
        //                self.dicomImageView.image = Utils.generateImage(chain: chain!, image: image)
        
      }
      catch (let writeError) {
        print("Error creating a file \(writeError.localizedDescription) ")
      }
      
    }
    let settings = CXEImagesToVideo.videoSettings(codec: AVVideoCodecType.h264.rawValue, width: (customArray[0].cgImage?.width)!, height: (customArray[0].cgImage?.height)!)
    let movieMaker = CXEImagesToVideo(videoSettings: settings)
    movieMaker.createMovieFrom(images: customArray){ (fileURL:URL) in
      //            let video = AVAsset(url: fileURL)
      self.player = AVPlayer(url: fileURL)
      // 5. set the class property player to the AVPlayerViewController's player
      self.avPVC.player = self.player
      
      // 6. set the the parent vc's bounds to the AVPlayerViewController's frame
      self.avPVC.view.frame = self.view.bounds
      
      
      self.addChild(self.avPVC)
      
      // 8. add the AVPlayerViewController's view as a subview to the parent vc
      self.videoView.addSubview(self.avPVC.view)
      
      // 9. on AVPlayerViewController call didMove(toParentViewController:) and pass the parent vc as an argument to move it inside parent
      self.avPVC.didMove(toParent: self)
      self.loadingIndicaotr.stopAnimating()
      
    }
    
    
    
    
  }
    
    @IBAction func closeViewControllerFunction(_ sender: UIButton) {
      if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
        appDelegate.goToReactNative()
      }
    }
    @IBAction func viewMoreFunction(_ sender: UIButton) {
                      let MultipleCollectionViewController = self.storyboard?.instantiateViewController(withIdentifier: "MultipleCollectionViewController") as! MultipleCollectionViewController
      
              MultipleCollectionViewController.imageArray = customArray;
      self.present(MultipleCollectionViewController, animated: true, completion: nil)
//              self.navigationController?.pushViewController(MultipleCollectionViewController, animated: true)
    }
    
//    @IBAction func moreFucntion(_ sender: UIButton) {
//                let MultipleCollectionViewController = self.storyboard?.instantiateViewController(withIdentifier: "MultipleCollectionViewController") as! MultipleCollectionViewController
//        
//        MultipleCollectionViewController.imageArray = customArray;
//        self.navigationController?.pushViewController(MultipleCollectionViewController, animated: true)
        
//    }
    
}
