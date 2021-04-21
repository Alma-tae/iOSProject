//
//  ViewController.swift
//  iOSProject
//
//  Created by Sinchon on 2021/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var timer:Timer! = nil
    
    //뷰 컨트롤러가 FirstResponder가 될 수 있도록 해주는 프로퍼티 재정의
    override var canBecomeFirstResponder: Bool{
        get{
            return true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //뷰 컨트롤러가 FirstResponder가 되도록 설정
        self.becomeFirstResponder()
        
        //바로 시작하는 타이머 생성
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(timer) -> Void in
            //현재 날짜 및 시간
            let date = Date()
            //날짜 및 시간을 문자열로 만들어주는 클래스의 객체 생성
            let formatter = DateFormatter()
            //문자열 서식 설정
            formatter.dateFormat = "yyyy-MM-dd  ccc hh:mm:ss"
            let msg = formatter.string(from: date)
            //클로저에서는 클래스에 만든 프로퍼티를 직접 사용이 안 됨
            //객체를 통해서 접근해야 함
            self.label.text = msg
        })
        
        //회전
        label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2.0)
        //선 모양 변경
        label.layer.borderWidth = 3.0
        label.layer.borderColor = UIColor.magenta.cgColor
    }
    
    //흔들기가 시작되면 호출되는 메서드
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        NSLog("흔들기 시작")
    }

}

