//
//  ViewController.swift
//  switchViewController
//
//  Created by Sinchon on 2021/04/23.
//

import UIKit

class ViewController: UIViewController {
    //SdcondViewController로부터 데이터를 전달받을 프로퍼티
    var mainData : String!{
        //값이 변경될 때 호출되는 함수
        didSet{
            viewIfLoaded?.setNeedsLayout()
        }
    }
    //뷰를 출력할 때 호출되는 메서드 재저의
    override func viewWillLayoutSubviews() {
        if mainData != nil{
            lblMain.text = mainData
        }
    }

    @IBAction func push(_ sender: Any) {
        //네비게이션 컨트롤러를 이용해서 DetailViewController 출력
        
        //스토리보드에 디자인한 DetailViewController 객체 생성
        let detail = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    @IBOutlet weak var lblMain: UILabel!
    @IBAction func moveSecond(_ sender: Any) {
        //이동할 뷰 컨트롤러 객체 생성
        let secondViewController = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        //애니메이션 설정
        self.modalTransitionStyle = .crossDissolve
        //데이터 전달
        secondViewController.subData = "Hello, Stranger?"
        //화면 이동
        present(secondViewController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네비게이션 바의 중앙에 출력
        self.title = "Title"
    }

    //세그웨이로 돌아오도록 하기 위한 메서드
    @IBAction func returned(segue:UIStoryboardSegue){
        lblMain.text = "Came back with Segue"
    }

    //세그웨이로 이동하기 전에 호출되는 메서드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //이동할 뷰 컨트롤러 찾아오기
        let destination = segue.destination as! SegueController
        //detination에서 프로퍼티를 호출해서 넘겨주면 됨
    }
}

