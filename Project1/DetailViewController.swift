//
//  DetailViewController.swift
//  Project1
//
//  Created by Toni on 17.9.2020.
//  Copyright © 2020 asikainen.toni. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedImage: String? // Valittu kuvatiedosto TVC:stä
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
