//
//  ViewController.swift
//  WebDataSyncDownload
//
//  Created by Sinchon on 2021/04/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //다운로드 받을 URL 생성
        let imageAddr = "https://preview.clipartkorea.co.kr/2016/07/07/ti083a1110.jpg"
        
        let imageUrl = URL(string: imageAddr)
        //동기적으로 다운로드 받기
        //Data는 예외 처리를 반드시 해야하는 함수라서 try!로 예외가 발생하지 않는다고 설정
        let imageData = try! Data(contentsOf: imageUrl!)
        //다운로드 받은 데이터를 이미지로 변환
        let image = UIImage(data: imageData)
        //이미지 뷰에 출력
        imageView.image = image
        
        //문자열을 다운르도 받을 URL을 생성
        //let textAddr = "https://www.apple.com"
        //32번은 문제 없으나, 주소를 34번으로 바꾸면 실행 안 됨.
        let textAddr = "http://tjoeun.co.kr/"
        
        let textURL = URL(string: textAddr)
        //문자열 다운로드
        let textData = try! Data(contentsOf: textURL!)
        //다운로드 받은 데이터를 문자열로 변환
        //UTF-8로 변환
        //let text = String(data: textData, encoding: .windowsCP1251)
        //EUC-KR로 변환해서 생성
        let text = String(data: textData, encoding: String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(0x0422)))
        
        //NSLog("\(text)")
        //텍스트 뷰에 출력
        textView.text = text
    }


}

