//
//  PopularViewController.swift
//  Bideo
//
//  Created by 김가영 on 2020/06/20.
//  Copyright © 2020 김가영. All rights reserved.
//

import UIKit
import SafariServices //safari로 url열게하기 위함

class PopularViewController: UIViewController, UINavigationControllerDelegate, SFSafariViewControllerDelegate {
//하트버튼 하나당 user들의 하트 총 개수 저장
    
    @IBOutlet weak var firstHeart: UIButton!
    @IBOutlet weak var secondHeart: UIButton!
    @IBOutlet weak var thirdHeart: UIButton!
    @IBOutlet weak var fourthHeart: UIButton!
    @IBOutlet weak var fifthHeart: UIButton!
    
    //var buttonStatus = false
    var boolInt: Int!
    var textName: String!
    var descript: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstHeart.setBackgroundImage(UIImage(named: "heartEmpty.png"), for: .normal)
        secondHeart.setBackgroundImage(UIImage(named: "heartEmpty.png"), for: .normal)
        thirdHeart.setBackgroundImage(UIImage(named: "heartEmpty.png"), for: .normal)
        fourthHeart.setBackgroundImage(UIImage(named: "heartEmpty.png"), for: .normal)
        fifthHeart.setBackgroundImage(UIImage(named: "heartEmpty.png"), for: .normal)
        // Do any additional setup after loading the view.
    }
    
    
       func textFieldShouldReturn(_ textField: UITextField) -> Bool { // delegate 연결
       textField.resignFirstResponder()
       //textDescription.becomeFirstResponder()
           return true
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

       // return à Done 변경
       // 12주차에서 구현
       @IBAction func saveFavorite(_ sender: UIButton) { //click>fill & count++ || unclick>empty & count--
        
        textName = "firstVideo"
        descript = "blackhead"
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if appDelegate.firstStatus{ //status=false, count--
        firstHeart.setBackgroundImage(UIImage(named: "heartEmpty.png"), for: .normal)
        } else { //status=true, count++
            firstHeart.setBackgroundImage(UIImage(named: "heartFill.png"), for: .normal)
        }
        appDelegate.firstStatus = !appDelegate.firstStatus //buttonStatus change
        
        let myUrl = URL(string: "http://condi.swu.ac.kr/student/T02/bideo/insertFavorite.php");
        var request = URLRequest(url:myUrl!);
        request.httpMethod = "POST";

        var restString: String = "ID=" + appDelegate.ID + "&NAME=" + appDelegate.userName
        restString += "&textName=" + textName + "&descript=" + descript
        boolInt = appDelegate.firstStatus ? 1:0
        restString += "&Heart=" + String(boolInt)
        request.httpBody = restString.data(using: .utf8)
        let session2 = URLSession.shared
        let task2 = session2.dataTask(with: request) { (responseData, response, responseError) in
        guard responseError == nil else { return }
        guard let receivedData = responseData else { return }
        if let utf8Data = String(data: receivedData, encoding: .utf8) { print(utf8Data) }
        }
        task2.resume()
        _ = self.navigationController?.popViewController(animated: true)
           }
       
    @IBAction func secondFavorite(_ sender: UIButton) {
        textName = "secondVideo"
        descript = "toner"
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if appDelegate.secondStatus{ //status=false, count--
        secondHeart.setBackgroundImage(UIImage(named: "heartEmpty.png"), for: .normal)
        } else { //status=true, count++
            secondHeart.setBackgroundImage(UIImage(named: "heartFill.png"), for: .normal)
        }
        appDelegate.secondStatus = !appDelegate.secondStatus //buttonStatus change

        let myUrl = URL(string: "http://condi.swu.ac.kr/student/T02/bideo/insertFavorite.php");
        var request = URLRequest(url:myUrl!);
        request.httpMethod = "POST";

        var restString: String = "ID=" + appDelegate.ID + "&NAME=" + appDelegate.userName
        restString += "&textName=" + textName + "&descript=" + descript
        boolInt = appDelegate.secondStatus ? 1:0
        restString += "&Heart=" + String(boolInt)
        request.httpBody = restString.data(using: .utf8)
        let session2 = URLSession.shared
        let task2 = session2.dataTask(with: request) { (responseData, response, responseError) in
        guard responseError == nil else { return }
        guard let receivedData = responseData else { return }
        if let utf8Data = String(data: receivedData, encoding: .utf8) { print(utf8Data) }
        }
        task2.resume()
        _ = self.navigationController?.popViewController(animated: true)
    }

    @IBAction func thirdFavorite(_ sender: UIButton) {
        textName = "thirdVideo"
        descript = "home care"
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if appDelegate.thirdStatus{ //status=false, count--
        thirdHeart.setBackgroundImage(UIImage(named: "heartEmpty.png"), for: .normal)
        } else { //status=true, count++
            thirdHeart.setBackgroundImage(UIImage(named: "heartFill.png"), for: .normal)
        }
        appDelegate.thirdStatus = !appDelegate.thirdStatus //buttonStatus change

        let myUrl = URL(string: "http://condi.swu.ac.kr/student/T02/bideo/insertFavorite.php");
        var request = URLRequest(url:myUrl!);
        request.httpMethod = "POST";

        var restString: String = "ID=" + appDelegate.ID + "&NAME=" + appDelegate.userName
        restString += "&textName=" + textName + "&descript=" + descript
        boolInt = appDelegate.thirdStatus ? 1:0
        restString += "&Heart=" + String(boolInt)
        request.httpBody = restString.data(using: .utf8)
        let session2 = URLSession.shared
        let task2 = session2.dataTask(with: request) { (responseData, response, responseError) in
        guard responseError == nil else { return }
        guard let receivedData = responseData else { return }
        if let utf8Data = String(data: receivedData, encoding: .utf8) { print(utf8Data) }
        }
        task2.resume()
        _ = self.navigationController?.popViewController(animated: true)
    }

    @IBAction func fourthFavorite(_ sender: UIButton) {
        textName = "fourthVideo"
        descript = "acne care"
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if appDelegate.fourthStatus{ //status=false, count--
        fourthHeart.setBackgroundImage(UIImage(named: "heartEmpty.png"), for: .normal)
        } else { //status=true, count++
            fourthHeart.setBackgroundImage(UIImage(named: "heartFill.png"), for: .normal)
        }
        appDelegate.fourthStatus = !appDelegate.fourthStatus //buttonStatus change

        let myUrl = URL(string: "http://condi.swu.ac.kr/student/T02/bideo/insertFavorite.php");
        var request = URLRequest(url:myUrl!);
        request.httpMethod = "POST";

        var restString: String = "ID=" + appDelegate.ID + "&NAME=" + appDelegate.userName
        restString += "&textName=" + textName + "&descript=" + descript
        boolInt = appDelegate.fourthStatus ? 1:0
        restString += "&Heart=" + String(boolInt)

        request.httpBody = restString.data(using: .utf8)
        let session2 = URLSession.shared
        let task2 = session2.dataTask(with: request) { (responseData, response, responseError) in
        guard responseError == nil else { return }
        guard let receivedData = responseData else { return }
        if let utf8Data = String(data: receivedData, encoding: .utf8) { print(utf8Data) }
        }
        task2.resume()
        _ = self.navigationController?.popViewController(animated: true)
    }

    @IBAction func fifthFavorite(_ sender: UIButton) {
        textName = "fifthVideo"
        descript = "hydration"
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if appDelegate.fifthStatus{ //status=false, count--
        fifthHeart.setBackgroundImage(UIImage(named: "heartEmpty.png"), for: .normal)
        } else { //status=true, count++
            fifthHeart.setBackgroundImage(UIImage(named: "heartFill.png"), for: .normal)
        }
        appDelegate.fifthStatus = !appDelegate.fifthStatus //buttonStatus change

        let myUrl = URL(string: "http://condi.swu.ac.kr/student/T02/bideo/insertFavorite.php");
        var request = URLRequest(url:myUrl!);
        request.httpMethod = "POST";

        var restString: String = "ID=" + appDelegate.ID + "&NAME=" + appDelegate.userName
        restString += "&textName=" + textName + "&descript=" + descript
        boolInt = appDelegate.fifthStatus ? 1:0
        restString += "&Heart=" + String(boolInt)

        request.httpBody = restString.data(using: .utf8)
        let session2 = URLSession.shared
        let task2 = session2.dataTask(with: request) { (responseData, response, responseError) in
        guard responseError == nil else { return }
        guard let receivedData = responseData else { return }
        if let utf8Data = String(data: receivedData, encoding: .utf8) { print(utf8Data) }
        }
        task2.resume()
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func firstLink(_ sender: UIButton) {
        guard let url = URL(string: "https://youtu.be/gB--A-w77zQ") else {
            return
        }
                let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self //해당 링크를 safariViewController로 화면 불러오기
    }
    
    @IBAction func secondLink(_ sender: UIButton) {
        guard let url = URL(string: "https://youtu.be/C8wXn0Xdp1c") else {
                   return
               }
                       let safariVC = SFSafariViewController(url: url)
               present(safariVC, animated: true, completion: nil)
               safariVC.delegate = self
    }
    
    @IBAction func thirdLink(_ sender: UIButton) {
        guard let url = URL(string: "https://youtu.be/wY3rpuQM0D8") else {
                   return
               }
                       let safariVC = SFSafariViewController(url: url)
               present(safariVC, animated: true, completion: nil)
               safariVC.delegate = self
    }
    
    @IBAction func fourthLink(_ sender: UIButton) {
        guard let url = URL(string: "https://youtu.be/fppkT7TMcjY") else {
                   return
               }
                       let safariVC = SFSafariViewController(url: url)
               present(safariVC, animated: true, completion: nil)
               safariVC.delegate = self
    }
    
    @IBAction func fifthLink(_ sender: UIButton) {
        guard let url = URL(string: "https://youtu.be/xx5NVJ5WStA") else {
                   return
               }
                       let safariVC = SFSafariViewController(url: url)
               present(safariVC, animated: true, completion: nil)
               safariVC.delegate = self
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

