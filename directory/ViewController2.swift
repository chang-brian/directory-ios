//
//  ViewController2.swift
//  directory
//
//  Created by Brian Chang on 10/2/17.
//  Copyright © 2017 Brian Chang. All rights reserved.
//

import UIKit
import Branch

class ViewController2: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var dept: UILabel!
    @IBOutlet weak var share: UIButton!
    
    var buo: BranchUniversalObject = BranchUniversalObject()
    var lp: BranchLinkProperties = BranchLinkProperties()
    
    
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
            let result = textToShow
//            name.text = result
            let resultArray = result.characters.split(separator: ",", maxSplits: 2, omittingEmptySubsequences: false)
//            print(String(resultArray[0]), String(resultArray[1]), String(resultArray[2]))
            name.text = String(resultArray[0])
            dept.text = String(resultArray[1])
            desc.text = String(resultArray[2])
            
            let nameArray = String(resultArray[0]).characters.split(separator: " ")
            let imageName = String(nameArray[0]).lowercased() + "_" + String(String(nameArray[1]).characters[String(nameArray[1]).characters.startIndex]).lowercased()
            image.image = UIImage(named: "\(imageName)")
            
            buo = BranchUniversalObject()
            buo.title = name.text
            buo.contentDescription = dept.text
            buo.addMetadataKey("name", value: name.text!)
            buo.addMetadataKey("dept", value: dept.text!)
            buo.addMetadataKey("desc", value: desc.text!)
            
            lp = BranchLinkProperties()
            
        }
    }
    
    @IBAction func share(_ sender: UIButton) {
        buo.showShareSheet(with: lp, andShareText: nil, from: nil, completionWithError: nil)
    }
}
