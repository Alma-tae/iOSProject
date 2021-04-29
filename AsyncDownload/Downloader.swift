//
//  Downloader.swift
//  AsyncDownload
//
//  Created by Sinchon on 2021/04/29.
//

import UIKit

class Downloader: Thread {
    //출력을 위한 뷰 프로퍼티
    var imageView : UIImageView!
    var textView : UITextView!
    
    //스레드를 동작할 메서드
    override func main(){
        OperationQueue.main.addOperation{
            let textURL = URL(string: "https://www.google.com")
            let textData = try! Data(contentsOf: textURL!)
            let googleText = String(data:textData, encoding: .utf8)
            //NSLog(googleText)
            self.textView.text = googleText
        
            let imageURL = URL(string: "https://vrthumb.clipartkorea.co.kr/2016/07/07/ti083a1110.jpg")
            let imageData = try! Data(contentsOf: imageURL!)
            let image = UIImage(data: imageData)
            self.imageView.image = image!
        }
    }
}
