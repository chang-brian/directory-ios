//
//  ViewController2.swift
//  directory
//
//  Created by Brian Chang on 10/2/17.
//  Copyright © 2017 Brian Chang. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var share: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var desc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        back = UIBarButtonItem(title: "Back Title", style: UIBarButtonItemStyle.plain, target: self, action: #selector(backAction))
//        self.navigationItem.leftBarButtonItem = back
        // Do any additional setup if required.
    }
    
//    func backAction(){
//        //print("Back Button Clicked")
//        dismiss(animated: true, completion: nil)
//        
//    }
    
//    @IBAction func goBack() {
//        dismissViewControllerAnimated(true, completion:nil)
//    }


        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    //This can be changed when creating this UIViewController
    var textToShow : String?
    
    override func viewWillAppear(_ animated: Bool) {
        if let textToShow = textToShow {
            name.text = textToShow
        }
    }
}
