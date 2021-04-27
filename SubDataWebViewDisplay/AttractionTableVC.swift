//
//  AttractionTableVC.swift
//  SubDataWebViewDisplay
//
//  Created by Sinchon on 2021/04/27.
//

import UIKit

class AttractionTableVC: UITableViewController {
    //테이블 뷰에 출력할 배열 생성
    var attractionData : Array<Dictionary<String, String>> = []
    
    //RefreshControl이 보여지면 호출되는 메서드
    @objc func handleRefresh(_ refreshControl:UIRefreshControl){
        //데이터 추가 - 맨 앞에 추가(insert)
        let str1 = "빨간_머리_앤"
        let str2 = "길버트_블라이스"
        
        let dic1 = ["name":"앤 셜리", "image":"anne.jpg", "url":"https://ko.wikipedia.org/wiki/\(str1.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)"]
        let dic2 = ["name":"길버트", "image":"gilbert.jpg", "url":"https://ko.wikipedia.org/wiki/\(str2.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)"]
        
        attractionData.insert(dic1, at: 0)
        attractionData.insert(dic2, at: 0)
        
        //RefreshControl 제거
        refreshControl.endRefreshing()
        
        //애니메이션과 함께 데이터를 재출력(데이터를 가져온 만큼 반복문 돌려야 함)
        tableView.beginUpdates()
        
        tableView.insertRows(at: [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0)], with: .top)
        
        tableView.endUpdates()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str3 = "해리_포터"
        let str4 = "론_위즐리"
        let str5 = "헤르미온느_그레인저"
        
        
        let dic3 = ["name":"해리포터", "image":"harryporter.jpg", "url":"https://ko.wikipedia.org/wiki/\(str3.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)"]
        let dic4 = ["name":"론 위즐리", "image":"ron.jpg", "url":"https://ko.wikipedia.org/wiki/\(str4.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)"]
        let dic5 = ["name":"헤르미온느", "image":"hermione.jpg", "url":"https://ko.wikipedia.org/wiki/\(str5.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)"]
        
        attractionData.append(dic3)
        attractionData.append(dic4)
        attractionData.append(dic5)
        
        self.title = "내 유년시절의 주인공들"
        
        //RefreshControl을 생성해서 부착
        self.refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)
        if #available(iOS 10.0, *){
            tableView.refreshControl = refreshControl
        }else{
            tableView.addSubview(refreshControl!)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attractionData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //사용자 정의 셀을 생성
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttractionTableCell") as! AttractionTableCell
        //행번호에 해당하는 데이터 찾아오기
        let dic = attractionData[indexPath.row]
        //레이블에 name 출력
        cell.attractionLabel.text = dic["name"]
        cell.attractionImage.image = UIImage(named: dic["image"]!)

        return cell
    }
  
    //셀의 높이를 설정하는 메서드
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 183
    }
    
    //셀을 선택했을 때 호출되는 메서드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //선택한 행 번호에 해당하는 데이터 가져오기
        let dic = attractionData[indexPath.row]
        //url 키의 값 가져오기
        let url = dic["url"]
        
        //출력할 하위 뷰 컨트롤러 객체 생성
        let detailVC = storyboard?.instantiateViewController(identifier: "AttractionDetailVC")  as! AttractionDetailVC
        //데이터 전달
        detailVC.webAddress = url
        
        //네비게이션 컨트롤러를 이용해서 하위 뷰 컨트롤러 출력하기
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

    //마지막에서 스크롤 했는지 여부를 저장할 프로퍼티
    var flag = false
    
    //셀들이 보여질 때 호출되는 메서드
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if flag == false && indexPath.row == attractionData.count - 1 {
            flag = true
        }else if(flag == true && indexPath.row == attractionData.count - 1){
            
            //데이터 추가 - 맨 뒤에 추가
            let str1 = "빨간_머리_앤"
            let str2 = "길버트_블라이스"
            
            let dic1 = ["name":"앤 셜리", "image":"anne.jpg", "url":"https://ko.wikipedia.org/wiki/\(str1.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)"]
            let dic2 = ["name":"길버트", "image":"gilbert.jpg", "url":"https://ko.wikipedia.org/wiki/\(str2.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)"]
            
            attractionData.append(dic1)
            attractionData.append(dic2)
            
            tableView.reloadData()
        }
        
    }
    
}
