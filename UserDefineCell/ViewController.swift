//
//  ViewController.swift
//  UserDefineCell
//
//  Created by Sinchon on 2021/04/26.
//

import UIKit

class ViewController: UIViewController {
    
    //출력할 데이터 배열
    var ar:Array<Dictionary<String, String>> = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //데이터 초기화
        ar.append(["name":"Iron man", "skill":"Iron suit", "imageName" :"ironman.jpg"])
        ar.append(["name":"Captain America", "skill":"Shield", "imageName" :"captain.jpg"])
        ar.append(["name":"Thor", "skill":"Thunder", "imageName" :"thor.jpg"])
        ar.append(["name":"Black Panther", "skill":"Technology", "imageName" :"blackpanther.jpg"])
        ar.append(["name":"Spider man", "skill":"Spider web", "imageName" :"spiderman.jpg"])
        ar.append(["name":"Black Widow", "skill":"Fighting skills", "imageName" :"blackwidow.jpg"])
        
        //테이블 뷰의 Delegate와 DataSource 설정
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ViewController : UITableViewDataSource, UITableViewDelegate{
    //섹션의 개수를 설정하는 메소드 - 선택
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //섹션 별 행의 개수를 설정하는 메서드 - 필수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ar.count
    }
    
    //행 별로 셀을 설정하는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //셀의 Identifier
        let cellIdentifier = "MarvelCell"
        //재사용 가능한 셀 찾아오기 - 사용자 정의 셀로 형변환하기
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MarvelCell
        
        
        //셀이 없으면 생성
        /*
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        */
        
        //필요한 데이터 출력
        //행번호에 해당하는 데이터를 찾아오기
        let dic = ar[indexPath.row]
        
        cell?.lblName?.text = dic["name"]
        cell?.lblSkill?.text = dic["skill"]
        cell?.imgView?.image = UIImage(named:dic["imageName"]!)
        
        return cell!
    }
    
    //셀의 높이를 설정하는 메서드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //main.storyboard에서 사이즈 확인하고 숫자 설정하기
        return 130
    }
}

