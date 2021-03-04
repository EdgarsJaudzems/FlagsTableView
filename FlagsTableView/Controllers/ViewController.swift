//
//  ViewController.swift
//  FlagsTableView
//
//  Created by Edgars Jaudzems on 03/03/2021.
//

import UIKit

class ViewController: UITableViewController {

    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        flags += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        flags.shuffle()
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)

        if flags[indexPath.row].hasPrefix("us") || flags[indexPath.row].hasPrefix("uk") {
            cell.textLabel?.text = flags[indexPath.row].uppercased()
        } else {
            cell.textLabel?.text = flags[indexPath.row].capitalized
        }
        
        
        cell.imageView!.image = UIImage(named: flags[indexPath.row])
        cell.imageView!.layer.borderWidth = 0.5
        cell.imageView!.layer.borderColor = UIColor.lightGray.cgColor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            
            vc.imageString = flags[indexPath.row]
            vc.textLabelString = flags[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}





