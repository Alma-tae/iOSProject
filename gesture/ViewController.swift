//
//  ViewController.swift
//  gesture
//
//  Created by Sinchon on 2021/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    //탭 제스처가 사용할 selector
    @objc func tapGestureMethod(sender:UITapGestureRecognizer){
        if self.imgView.contentMode == UIView.ContentMode.scaleAspectFit{
            self.imgView.contentMode = UIView.ContentMode.center
        }else{
            self.imgView.contentMode = UIView.ContentMode.scaleAspectFit
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //제스처 객체 생성
        let tap = UITapGestureRecognizer(target: self, action:  #selector(tapGestureMethod(sender:)))
        //세부 옵션 설정
        tap.numberOfTapsRequired = 2
        //뷰에 제스쳐 객체 설정
        imgView.addGestureRecognizer(tap)
    }


}

