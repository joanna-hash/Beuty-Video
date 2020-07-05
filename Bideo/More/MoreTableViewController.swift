//
//  MoreTableViewController.swift
//  Bideo
//
//  Created by 김가영 on 2020/06/21.
//  Copyright © 2020 김가영. All rights reserved.
//

import UIKit
import CoreData

class MoreTableViewController: UITableViewController {
    
    var informations: [NSManagedObject] = []

    func getContext () -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
    }
    // View가 보여질 때 자료를 DB에서 가져오도록 한다
    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let context = self.getContext()
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Info")
    let sortDescriptor = NSSortDescriptor (key: "videoName", ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
    
    do {
    informations = try context.fetch(fetchRequest)
    } catch let error as NSError {
    print("Could not fetch. \(error), \(error.userInfo)")
        }
    self.tableView.reloadData()
    }
    
    @IBAction func Logout(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title:"로그아웃 하시겠습니까?",message: "",preferredStyle: .alert)
                  
              alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in let urlString: String = "http://condi.swu.ac.kr/student/T02/login/logout.php"
              guard let requestURL = URL(string: urlString) else { return }
              var request = URLRequest(url: requestURL)
              request.httpMethod = "POST"
              let session = URLSession.shared
              let task = session.dataTask(with: request) { (responseData, response, responseError) in
              guard responseError == nil else { return } }
              task.resume()

              let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let loginView = storyboard.instantiateViewController(withIdentifier: "loginView")
                  loginView.modalPresentationStyle = .fullScreen
              self.present(loginView, animated: true, completion: nil)
              }))
                  
              alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
              self.present(alert, animated: true) //모달 윈도우가 뜸
    }


//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return informations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "More Cell", for: indexPath)

        // Configure the cell...
        let infos = informations[indexPath.row]
        var display: String = ""
        if let nameLabel = infos.value(forKey: "videoName") as? String {
        display = nameLabel }
        cell.textLabel?.text = display
        cell.detailTextLabel?.text = infos.value(forKey: "videoURL") as? String
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            // Core Data 내의 해당 자료 삭제
            let context = getContext()
            context.delete(informations[indexPath.row])
            do {
            try context.save()
            print("deleted!")
            } catch let error as NSError {
            print("Could not delete \(error), \(error.userInfo)") }
            // 배열에서 해당 자료 삭제
            informations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toMoreDetailView" {
        if let destination = segue.destination as? MoreDetailViewController {
        if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row {
        destination.detailInfo = informations[selectedIndex] }
        } }
    }
}
    


