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
    
    let staticList = ["brian", "aaron", "agrim", "ethan", "rubin", "parth", "amruta", "aparna"]
    var employeeList = ["brian", "aaron", "agrim", "ethan", "rubin", "parth", "amruta", "aparna"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = employeeList[indexPath.row]
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(employeeList[indexPath.row])
        
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        next.textToShow = employeeList[indexPath.row]
        self.navigationController?.pushViewController(next, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterTableView(text: searchText)
    }
    
    func filterTableView(text: String) {
        employeeList = staticList.filter( { (String) -> Bool in
            return String.lowercased().hasPrefix(text.lowercased())
        })
        tableView.reloadData()
    }
    
}

