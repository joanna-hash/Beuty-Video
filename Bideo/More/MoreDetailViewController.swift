//
//  MoreDetailViewController.swift
//  Bideo
//
//  Created by 김가영 on 2020/06/21.
//  Copyright © 2020 김가영. All rights reserved.
//

import UIKit
import CoreData

class MoreDetailViewController: UIViewController {

    @IBOutlet var videoName: UITextField!
    @IBOutlet var videoURL: UITextField!
    @IBOutlet var reason: UITextField!

    var detailInfo: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let detail = detailInfo {
        videoName.text = detail.value(forKey: "videoName") as? String
        videoURL.text = detail.value(forKey: "videoURL") as? String
        reason.text = detail.value(forKey: "reason") as? String
        }
        // Do any additional setup after loading the view.
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


