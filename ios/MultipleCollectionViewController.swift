//
//  MultipleCollectionViewController.swift
//  DicomImageProcessing
//
//  Created by admin on 20/02/20.
//  Copyright © 2020 Genix. All rights reserved.
//

import UIKit

class MultipleCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var singleImageView: UIImageView!
    var imageArray = [UIImage]()
    var colorArray : NSMutableArray = []
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.frameNo.text = "\(indexPath.row+1)"
        cell.imgView.image = imageArray[indexPath.row]
        if colorArray[indexPath.row] as! String == "1"{
             cell.colorIndicator.backgroundColor = UIColor.white
        }else{
             cell.colorIndicator.backgroundColor = UIColor.black
        }
    
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        singleImageView.image = imageArray[indexPath.row]
        currentLabel.text = "Frame No: \(indexPath.row+1)"
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }


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
        singleImageView.image = imageArray[0]
        for _ in 0 ..< imageArray.count{
            colorArray.add("1")
        }
        print(colorArray)
        currentLabel.text = "Frame No: 1"
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return singleImageView
    }


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for cell in collectionView.visibleCells {
            let indexPath = collectionView.indexPath(for: cell)
            let indexVal = indexPath!.row
            
            singleImageView.image = imageArray[indexVal]
            currentLabel.text = "Frame No: \(indexVal+1)"
//            for i in 0 ..< colorArray.count{
//                if indexVal == i {
//                    colorArray[indexVal] = "0"
//                }else{
//                    colorArray[indexVal] = "1"
//                }
//            }
           print("the cuurent visible cell",indexVal as Any)
        }
        collectionView.reloadData()
    }
  
  @IBAction func closeView(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
  
}
