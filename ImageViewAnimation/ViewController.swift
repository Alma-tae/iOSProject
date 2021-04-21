//
//  ViewController.swift
//  ImageViewAnimation
//
//  Created by Sinchon on 2021/04/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    //애니메이션 사용할 이미지 배열
    var imgArray = [UIImage]()
    //현재 출력 중인 이미지의 인덱스
    var i:Int?
    //애니메이션 속도
    var speed:Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //이비지 배열에 데이터 삽입
        imgArray.append(UIImage(named:"anne.jpg")!)
        imgArray.append(UIImage(named:"gilbert.jpg")!)
        imgArray.append(UIImage(named:"captain.jpg")!)
        imgArray.append(UIImage(named:"ironman.jpg")!)
        imgArray.append(UIImage(named:"thor.jpg")!)
        
        i = 0
        
        speed = 0.5
        
        //이미지 뷰 초기화
        imgView.image = imgArray[i!]
        imgView.animationImages = imgArray
    }

    @IBAction func changeSpeed(_ sender: Any) {
        //슬라이더의 값을 speed에 저장
        speed = slider.value
        //애니메이션이 작동 중이면 애니메이션을 멈추고 다시 시작
        if imgView.isAnimating == true{
            imgView.stopAnimating()
            
            //애니메이션 시간 설정
            imgView.animationDuration = TimeInterval(Int(speed! * 5) * imgArray.count)
            //애니메이션 시작
            imgView.startAnimating()
        }
    }
    
    @IBAction func prevButton(_ sender: Any) {
        i = i! - 1
        if i! < 0{
            //순환
            i = imgArray.count - 1
        }
        imgView.image = imgArray[i!]
    }
    
    @IBAction func nextButton(_ sender: Any) {
        i = i! + 1
        if i! >= imgArray.count {
            //처음으로 돌아옴
            i = 0
        }
        imgView.image = imgArray[i!]
    }
    
    @IBAction func startButton(_ sender: Any) {
        //애니메이션을 중지 중인지 확인
        if imgView.isAnimating == false{
            imgView.animationDuration = TimeInterval(Int(speed! * 5) * imgArray.count)
            //애니메이션 시작
            imgView.startAnimating()
            //버튼의 타이틀 변경
            (sender as! UIButton).setTitle("중지", for: .normal)
        }else{
            //애니메이션 중지
            imgView.stopAnimating()
            //버튼의 타이틀 변경
            (sender as! UIButton).setTitle("시작", for: .normal)
        }
    }
    
}

