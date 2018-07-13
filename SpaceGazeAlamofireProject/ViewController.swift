
//  ViewController.swift
//  SpaceGazeAlamofireProject
//
//  Created by Aananya on 13/07/18.
//  Copyright © 2018 Aananya. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    
    @IBOutlet weak var tableViewImages: UITableView!
    let URL_GET_DATA = "https://api.nasa.gov/planetary/apod?api_key=hnwHBNW2Sy7VSv5zpoMmFrjdlU4xWrVGAwg9mKhr"
    
    
    var nasaImages = [nasaImage]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nasaImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        let nasaimage :nasaImage
        nasaimage = nasaImages[indexPath.row]
        
       
        cell.labelName.text = nasaimage.title
        cell.labelName.text = nasaimage.date
        
        Alamofire.request(nasaimage.url!).responseImage { response in
//            debugPrint(response)
            if let image = response.result.value {
                cell.nasaImage.image = image
            }
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(URL_GET_DATA).responseJSON { response in
            if let json = response.result.value {
                let nasaImagesArray : NSDictionary = json as! NSDictionary
                for i in 0..<nasaImagesArray.count{
                    self.nasaImages.append(nasaImage(
                        title: (nasaImagesArray[i] as AnyObject).value(forKey:"title") as? String,
                        date: (nasaImagesArray[i] as AnyObject).value(forKey:"date") as? String,
                        url: (nasaImagesArray[i] as AnyObject).value(forKey:"url") as? String
                    ))
                }
                self.tableViewImages.reloadData()
            }
        }
    }
    
    
}

