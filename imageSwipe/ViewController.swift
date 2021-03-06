//
//  ViewController.swift
//  imageSwipe
//
//  Created by Sinchon on 2021/04/22.
//

import UIKit

class ViewController: UIViewController {

    var scrollView:UIScrollView!
    //스크롤뷰에 내용이 될 뷰
    var contentView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //스크롤 뷰 생성 - 한 페이지의 크기를 설정
        scrollView = UIScrollView(frame: CGRect(x: 60, y: 20, width: 200, height: 200))
        //스크롤 뷰에 출력할 내용 생성
        contentView = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 200))
        //반복문을 수행해서 contentView의 내용을 만듬
        var t : Int = 0
        for i in 0...4{
            //이미지 뷰를 x 좌표를 변경하면서 생성
            let imageView = UIImageView(frame: CGRect(x: t, y: 0, width: 200, height: 200))
            //이미지 설정
            imageView.image = UIImage(named: "marvel\(i).jpg")
            //항목 뷰에 배치
            contentView.addSubview(imageView)
            t = t + 200
        }
        scrollView!.addSubview(contentView)
        scrollView.contentSize = contentView!.frame.size
        self.view.addSubview(scrollView)
        scrollView.isPagingEnabled = true
    }


}

