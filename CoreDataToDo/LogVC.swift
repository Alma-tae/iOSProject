//
//  LogVC.swift
//  CoreDataToDo
//
//  Created by Sinchon on 2021/05/04.
//

import UIKit

//데이터의 삽입, 수정, 삭제를 나타내기 위함 enum
//enum은 데이터를 제한하고자 할 때 사용
public enum LogType:Int16{
    case create = 0
    case edlt = 1
    case delete = 2
}

//Int16 클래스에 기능을 추가
//swift나 Kotlin, C#, javascript는 기존 클래스나 객체에 기능 추가 가능 => 별도의 클래스 생성할 필요 없음
extension Int16{
    func toLogType() -> String{
        switch self {
        case 0 : return "생성"
        case 1 : return "수정"
        case 2 : return "삭제"
        default : return ""
        }
    }
}

class LogVC: UITableViewController {
    //상위 뷰 컨트롤러에서 넘겨받을 데이터
    var toDo:ToDoMO!
    
    //테이블 뷰에 출력할 데이터
    lazy var list:[LogMO]! = {
        return self.toDo.logs?.allObjects as! [LogMO]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "LogCell")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "LogCell")
        }

        //행 번호에 해당하는 데이터 찾아오기
        let log = list[indexPath.row]
        
        //출력
        cell?.textLabel?.text = "\(log.regdate!)에 \(log.type.toLogType()) 했습니다."
        
        return cell!
    }
    

    

}
