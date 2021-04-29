//
//  ViewController.swift
//  AsyncDownload
//
//  Created by Sinchon on 2021/04/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //스레드 객체를 생성
        let thread = Downloader()
        thread.imageView = imageView
        thread.textView = textView
        //스레드 시작
        thread.start()
    }


}

