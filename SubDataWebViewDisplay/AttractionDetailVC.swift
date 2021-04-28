//
//  AttractionDetailVC.swift
//  SubDataWebViewDisplay
//
//  Created by Sinchon on 2021/04/27.
//

import UIKit
import WebKit

class AttractionDetailVC: UIViewController {

    //처음에 저장하면 에러남. import 필요
    @IBOutlet weak var webView: WKWebView!
    
    //상위 뷰 컨트롤러로부터 데이터를 넘겨받을 프로퍼티
    var webAddress : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //넘겨 받은 주소를 webView에 출력
        if let address = webAddress{
            let url = URL(string: address)
            let urlRequest = URLRequest(url: url!)
            webView.load(urlRequest)
        }
    }

    
}
