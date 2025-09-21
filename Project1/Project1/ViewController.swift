//
//  ViewController.swift
//  Project1
//
//  Created by Miguel Correa Avila on 17/9/25.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath:path)
        

        for item in items {
            if item.hasPrefix("nssl") {
                print("\(item) found! 🎉")
                pictures.append(item)
            }
        }
        
        pictures.sort{ $0 < $1 }

    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = "Picture \(indexPath.row+1) of \(pictures.count): (\(pictures[indexPath.row]))"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailView = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            detailView.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(detailView, animated: true)
        }
    }
    
   
}

