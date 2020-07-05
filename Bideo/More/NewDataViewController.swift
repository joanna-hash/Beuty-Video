//
//  NewDataViewController.swift
//  Bideo
//
//  Created by 김가영 on 2020/06/21.
//  Copyright © 2020 김가영. All rights reserved.
//

import UIKit
import CoreData

class NewDataViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var textName: UITextField!
    @IBOutlet var textURL: UITextField!
    @IBOutlet var textReason: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getContext () -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { textField.resignFirstResponder()
    return true }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
    let context = self.getContext()
    let entity = NSEntityDescription.entity(forEntityName: "Info", in: context)
    // friend record를 새로 생성함
    let object = NSManagedObject(entity: entity!, insertInto: context)
    object.setValue(textName.text, forKey: "videoName")
        object.setValue(textURL.text, forKey: "videoURL")
        object.setValue(textReason.text, forKey: "reason")
    do {
    try context.save()
        print("saved!")
    } catch let error as NSError {
    print("Could not save \(error), \(error.userInfo)") }
    // 현재의 View를 없애고 이전 화면으로 복귀
    self.navigationController?.popViewController(animated: true)
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
