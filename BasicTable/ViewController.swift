//
//  ViewController.swift
//  BasicTable
//
//  Created by Sinchon on 2021/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //테이블 뷰에 출력할 문자열 배열
    //var europeCountries = [String]()
    
    //테이블 뷰에 출력할 이미지 이름 배열
    //var citiesImage = [String]()
    
    //테이블 뷰에 출력할 데이터를 소유한 배열
    var europe = [Dictionary<String, Any>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        //문자열 배열에 데이터 추가
        europeCountries.append("France")
        europeCountries.append("The UK")
        europeCountries.append("Holland")
        europeCountries.append("Portugal")
        europeCountries.append("Italy")
        europeCountries.append("Spain")
        europeCountries.append("Swiss")
        europeCountries.append("Germany")
        europeCountries.append("Greece")
        
        //이미지 파일 이름을 저장
        citiesImage.append("france.jpg")
        citiesImage.append("theuk.jpg")
        citiesImage.append("holland.jpg")
        citiesImage.append("portugal.jpg")
        citiesImage.append("italy.jpg")
        citiesImage.append("spain.jpg")
        citiesImage.append("swiss.jpg")
        citiesImage.append("germany.jpg")
        citiesImage.append("greece.jpg")
        */
        
        let dict1 = ["name":"France", "imageTitle":"france.jpg", "who":"Nono"]
        let dict2 = ["name":"The UK", "imageTitle":"theuk.jpg", "who":"Alxendar"]
        let dict3 = ["name":"Holland", "imageTitle":"holland.jpg", "who":"Manav"]
        let dict4 = ["name":"Portugal", "imageTitle":"portugal.jpg", "who":"Catarina"]
        let dict5 = ["name":"Italy", "imageTitle":"italy.jpg", "who":"Sicily"]
        let dict6 = ["name":"Spain", "imageTitle":"spain.jpg", "who":"Loli"]
        let dict7 = ["name":"Swiss", "imageTitle":"swiss.jpg", "who":"Lucy"]
        let dict8 = ["name":"Germany", "imageTitle":"germany.jpg", "who":"Tim"]
        let dict9 = ["name":"Greece", "imageTitle":"greece.jpg", "who":"Or"]
        
        
        europe.append(dict1)
        europe.append(dict2)
        europe.append(dict3)
        europe.append(dict4)
        europe.append(dict5)
        europe.append(dict6)
        europe.append(dict7)
        europe.append(dict8)
        europe.append(dict9)
        
        //테이블 뷰 사용을 위한 delegate와 dataSource 속성 설정
        tableView.delegate = self
        tableView.dataSource = self
        
        //타이틀을 설정
        self.title = "Europe Countries"
    }
}

//테이블 뷰 관련 메서드
extension ViewController : UITableViewDataSource, UITableViewDelegate{
    
    //행의 개수를 설정하는 메서드 - 필수
    //section이 섹션(그룹)번호
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return europeCountries.count
        return europe.count
    }
    
    //셀의 모양을 설정하는 메서드 - 필수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //셀의 identifier로 사용할 문자열
        let cellIdentifier = "Cell"
        
        //재사용 가능한 셀이 있으면 찾아오기
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        //재사용 가능한 셀이 없으면 생성
        //default는 accery 출력 못 함
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        
        //행 번호에 해당하는 데이터를 찾아옴
        let dict = europe[indexPath.row]
        
        //셀의 세부 속성 설정
        //문자열 배열의 데이터를 레이블에 출력
        //indexPath가 셀의 위치
        //indexPath.section은 그룹 번호
        //indexPath.row는 행 번호
        //cell?.textLabel?.text = europeCountries[indexPath.row]
        cell?.textLabel?.text = dict["name"] as? String
        
        //이미지 출력 - 파일이 있을 때
        //cell?.imageView?.image = UIImage(named: citiesImage[indexPath.row % citiesImage.count])
        cell?.imageView?.image = UIImage(named: dict["imageTitle"] as! String)
        
        //보조 텍스트 출력
        /*
        if indexPath.row < 3 {
            cell?.detailTextLabel?.text = "West"
        }else{
            cell?.detailTextLabel?.text = "Middle"
        }
        */
        cell?.detailTextLabel?.text = dict["who"] as? String
        
        //액세서리 출력
        cell?.accessoryType = .disclosureIndicator
        
        if indexPath.row % 2 == 0{
            cell?.backgroundColor = UIColor.systemYellow
        }else{
            cell?.backgroundColor = UIColor.purple
        }
        
        return cell!
    }
    //행의 높이를 설정하는 메서드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    //행의 들여쓰기를 설정하는 메서드
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        if indexPath.row % 2 == 0{
            return 2
        }else{
            return 1
        }
    }
    //셀을 선택했을 때 호출되는 메서드
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        /*
        let alert = UIAlertController(title: "Where do you wanna go?", message: europeCountries[indexPath.row], preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yeah!", style: .default))
        present(alert, animated: true)
        */
        
        let alert = UIAlertController(title: "Where do you wanna go?", message: europe[indexPath.row]["name"] as? String, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yeah!", style: .default))
        present(alert, animated: true)
        
        }
}
