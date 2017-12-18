//
//  ViewController.swift
//  directory
//
//  Created by Brian Chang on 10/2/17.
//  Copyright © 2017 Brian Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var nameArray: [String]!
    var staticArray: [String]!
    let dictionary = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "strings", ofType: "plist")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameArray = dictionary!.allKeys as! [String]
        staticArray = dictionary!.allKeys as! [String]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchBar.text = ""
        filterTableView(text: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray!.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = nameArray[indexPath.row]
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = name
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        let name = nameArray[indexPath.row]
        let titleDesc = dictionary?[name] as! String
        next.textToShow = "\(name),\(titleDesc)"
        searchBar.resignFirstResponder()
        self.navigationController?.pushViewController(next, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterTableView(text: searchText)
    }
    
    func filterTableView(text: String) {
        nameArray = staticArray.filter( { (String) -> Bool in
            return String.lowercased().hasPrefix(text.lowercased())
        })
        tableView.reloadData()
    }
    
}

