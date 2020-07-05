//
//  LikeDetailViewController.swift
//  Bideo
//
//  Created by 김가영 on 2020/06/21.
//  Copyright © 2020 김가영. All rights reserved.
//

import UIKit
import SafariServices //safari로 url열게하기 위함

class LikeDetailViewController: UIViewController, SFSafariViewControllerDelegate {
    
    @IBOutlet var textName: UILabel!
    @IBOutlet var textDescription: UILabel!
    @IBOutlet weak var product: UILabel!
    @IBOutlet weak var videoURL: UIButton!
    
    override func viewDidLoad() {
       super.viewDidLoad()

    if self.title == "(시술X)모공 줄이는법" {
        textName.text = "최모나"
        textDescription.text = "#모공타이트닝법 #모공관리 #모공"
        product.text = "나의 사랑 레모나들 안녕하세요!! 오늘도 소중한 시간 내서 이렇게 영상 보러 들어와 주셔서 진심으로 감사합니다. 오늘은 구독자 요청 컨텐츠 부동의 1순위 바로!! 모공 타이트닝 방법에 대해서 영상을 만들었어요!! 제가 아는 모든 노하우를 여러분께 공유했으니 긴 영상이어도 잘 봐주셨으면 좋겠어요!"
        
    }
    else if self.title == "피부타입별 토너 사용법 따로 있다?"{
        textName.text = "디렉터파이"
        textDescription.text = "#토너 #화장품 궁합 #피부타입"
        product.text = "안녕하세요, 화장품 연구소 디렉터 피현정 크리에이티브디렉터의 성분 분석 유튜버 디렉터 파이입니다. 오늘 영상에서는 2018 베스트 토너들과 피부타입별로 토너사용법에 대해 자세하게 알아 봤습니다. 2016년 디파가 토너 TOP으로 뽑았던 제품들에 대한 성분 검증이 있고요,  2017년 디파가 추천했던 토너들에 대한 업그레이드 버전의  2018 토너 추천템을 성분, 사용감, 기능, 가성비 부분까지 고려하여 TOP으로 뽑았습니다."
    }
        
    else if self.title == "가장 완벽한 민감성 피부관리법"{
        textName.text = "피부는 민동성"
        textDescription.text = "#민감성 극복 #홈케어"
        product.text = "오늘도 제 피부 정보 영상을 봐주셔서 정말 감사합니다. 여러분들의 소중한 피부 평생 여러분의 옆에 함께 있는 그 친구를 위하여 알찬 피부정보 컨텐츠를 만들고 있습니다. SBS 피부, 메이크업 강사가 전해드리는 기초적인 관리부터 세세하고 알찬 고~급 정보까지 피부가 좋아질 수 있는 정보가 쏙'쏙' 여러분 앞에 펼쳐집니다."
    }
        
    else if self.title == "여드름 없애는 7가지 방법"{
        textName.text = "다람이"
        textDescription.text = "#여드름 #홈케어 #피부과노노"
        product.text = "여드름으로 피부과 천만원 쓴 사람이 알려주는 여드름 없애는 방법_쓸데없는 시술 걸러줌!"
    }
        
    else{
        textName.text = "프리윤freeyoon"
        textDescription.text = "#건성스킨케어 #민감성스킨케어 #스킨케어추천"
        product.text = "안녕하세요😊 저는 건조하고 민감한 피부를 가지고 있어서 스킨케어제품을 찾을 때 검색을 많이하고 구매하는 편입니당. 저랑 비슷한 피부타입을 가지신 분들께 꿀템들을 소개해드리고 싶어 이렇게 영상으로 찾아왔어요! 그럼 오늘 영상도 재미있게 봐주시고 좋은하루 되세요😊"
        }
   }
    
    @IBAction func videoURL(_ sender: UIButton) {
         if self.title == "(시술X)모공 줄이는법" {
       guard let url = URL(string: "https://youtu.be/gB--A-w77zQ") else {
                 return
             }
                     let safariVC = SFSafariViewController(url: url)
             present(safariVC, animated: true, completion: nil)
             safariVC.delegate = self
         }
         else if self.title == "피부타입별 토너 사용법 따로 있다?"{
            guard let url = URL(string: "https://youtu.be/C8wXn0Xdp1c") else {
                      return
                  }
                          let safariVC = SFSafariViewController(url: url)
                  present(safariVC, animated: true, completion: nil)
                  safariVC.delegate = self
}
             
         else if self.title == "가장 완벽한 민감성 피부관리법"{
            guard let url = URL(string: "https://youtu.be/wY3rpuQM0D8") else {
              return
          }
                  let safariVC = SFSafariViewController(url: url)
          present(safariVC, animated: true, completion: nil)
          safariVC.delegate = self}
             
         else if self.title == "여드름 없애는 7가지 방법"{
        guard let url = URL(string: "https://youtu.be/fppkT7TMcjY") else {
                       return
                   }
                           let safariVC = SFSafariViewController(url: url)
                   present(safariVC, animated: true, completion: nil)
                   safariVC.delegate = self}
             
         else{
             guard let url = URL(string: "https://youtu.be/xx5NVJ5WStA") else {
                       return
                   }
                           let safariVC = SFSafariViewController(url: url)
                   present(safariVC, animated: true, completion: nil)
                   safariVC.delegate = self}
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


