//
//  LikeTableViewController.swift
//  Bideo
//
//  Created by 김가영 on 2020/06/20.
//  Copyright © 2020 김가영. All rights reserved.
//

import UIKit

class LikeTableViewController: UITableViewController {

    //var fetchedArray: [TopData] = Array()
    let videoList = ["(시술X)모공 줄이는법","피부타입별 토너 사용법 따로 있다?","가장 완벽한 민감성 피부관리법","여드름 없애는 7가지 방법","건성&민감성 피부를 위한 스킨케어 제품 추천"]
    
    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let name = appDelegate.userName {
        self.title = name + "'s Favorites"
        }
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Favorite Cell", for: indexPath)
        
        // Configure the cell...
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
        cell.textLabel?.text = videoList[indexPath.row]
        switch indexPath.row {
        case 0:
            if appDelegate.firstStatus{ // firstStatus=false
        cell.imageView?.image = UIImage(named: "heartFill.png")
        }
        else  {cell.imageView?.image = UIImage(named: "heartEmpty.png")}


        case 1:
            if appDelegate.secondStatus{
        cell.imageView?.image = UIImage(named: "heartFill.png")
        }
        else  {cell.imageView?.image = UIImage(named: "heartEmpty.png")}

        case 2:
            if appDelegate.thirdStatus{
        cell.imageView?.image = UIImage(named: "heartFill.png")
        }
        else  {cell.imageView?.image = UIImage(named: "heartEmpty.png")}

        case 3:
            if appDelegate.fourthStatus{
        cell.imageView?.image = UIImage(named: "heartFill.png")
        }
        else  {cell.imageView?.image = UIImage(named: "heartEmpty.png")}

        case 4:
            if appDelegate.fifthStatus{
        cell.imageView?.image = UIImage(named: "heartFill.png")
        }
        else  {cell.imageView?.image = UIImage(named: "heartEmpty.png")}

        default:
            print("default")
        }


        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

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
        if segue.identifier == "toDetailView" {
        if let destination = segue.destination as? LikeDetailViewController {
        if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row { let data = videoList[selectedIndex]
//        destination.se = data
            destination.title = data
        } }
        }
        
    }
    

}
