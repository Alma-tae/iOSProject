//
//  ViewController.swift
//  controltest
//
//  Created by Sinchon on 2021/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var button: UIButton!
    
    //키보드가 올라올 때 호출될 함수
    @objc func keyboardWillShow(notification:Notification) -> Void{
        //버튼의 현재 위치와 크기 가져오기
        let originalRect = button.frame
        //위치 이동
        button.frame = CGRect(x: originalRect.origin.x, y: originalRect.origin.y - 50, width: originalRect.width, height: originalRect.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //리소스로 추가한 이미지를 객체로 생성
        let image1 = UIImage(named: "gongcha.jpeg")
        let image2 = UIImage(named: "stargreentea.jpeg")
        
        button.setBackgroundImage(image1, for: .normal)
        button.setBackgroundImage(image2, for: .highlighted)
        
        button.setTitle("보통", for: .normal)
        button.setTitle("누르고 있음", for: .highlighted)
        
        //키보드 화면에 출력
        tfEmail.becomeFirstResponder()
        
        //delegate 설정
        //tfEmail에서 이벤트가 발생하면 이벤트 처리 메서드를 self에서 찾겠다는 의미
        //현재 여기서 self는 ViewController
        tfEmail.delegate = self
        
        //노티피케이션과 함수 연결
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        //노티피케이션과 클로저 연경
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main){(Notification)-> Void in
            //버튼의 현재 위치와 크기 가져오기
            let originalRect = self.button.frame
            //위치 이동
            self.button.frame = CGRect(x: originalRect.origin.x, y: originalRect.origin.y + 50, width: originalRect.width, height: originalRect.height)
        }
    }
    
    
    
    
    
    
    
    
    

    @IBAction func click(_ sender: Any) {
        //NSLog("pushed the button")
        lblEmail.text = tfEmail.text
        tfEmail.text=""
    }
    
    //터치가 발생할 때 호출되는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //키보드를 제거
        tfEmail.resignFirstResponder()
    }
    //tfemail에서 return을 눌렀을 때 호출되는 함수
    @IBAction func returnProcess(_ sender: Any) {
        tfEmail.resignFirstResponder()
    }
    

}

extension ViewController : UITextFieldDelegate{
    //UITextFieldDelegate의 Return을 누르면 호출되는 메서드
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tfEmail.resignFirstResponder()
        return true
    }
}
