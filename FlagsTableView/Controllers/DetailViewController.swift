//
//  DetailViewController.swift
//  FlagsTableView
//
//  Created by Edgars Jaudzems on 03/03/2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageLabel: UIImageView!
    
    var imageString: String?
    var textLabelString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = textLabelString?.uppercased()
        
        if let imageToLoad = imageString {
            imageLabel.image = UIImage(named: imageToLoad)
        }
        
        roundedFlags()
   
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc func shareTapped() {
        guard let image = imageLabel.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }

        let vc = UIActivityViewController(activityItems: [image, title ?? "No title found"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    func roundedFlags() {
        imageLabel.layer.borderWidth = 1
        imageLabel.layer.borderColor = UIColor.lightGray.cgColor
        imageLabel.layer.cornerRadius = 20
        imageLabel.clipsToBounds = true
    }


}
