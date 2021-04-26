//
//  EditTableViewController.swift
//  EditTableview
//
//  Created by Sinchon on 2021/04/26.
//

import UIKit

class EditTableViewController: UITableViewController {
    //테이블 뷰에 출력할 문자열 배열
    var skills : Array<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "보유 기술"
        
        skills.append("프로그래밍 언어 - 자바")
        skills.append("데이터베이스 - 오라클")
        skills.append("프레임워크 - 스프링")
        
        //네비게이션 바의 왼쪽에 edit 버튼 추가
        navigationItem.leftBarButtonItem = editButtonItem
    }

    //네비게이션 바의 오른쪽 바 버튼을 눌렀을 때 호출되는 메서드
    @IBAction func addItem(_ sender: Any) {
        //대화상자 생성
        let alert = UIAlertController(title: "보유 기술 등록", message: "보유 기술을 입력하세요", preferredStyle: .alert)
        
        //입력 받을 텍스트 필드 추가
        alert.addTextField(configurationHandler: {(tf)->Void in tf.placeholder = "보유 기술"})
        //버튼 추가
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "추가", style: .default, handler : {(action) -> Void in
            //텍스트 필드에 입력한 텍스트 가져오기
            let skill = alert.textFields?[0].text
            //입력한 내용이 없으면 리턴
            if skill == nil || skill?.trimmingCharacters(in: .whitespaces).count == 0{
                return
            }
            //배열에 데이터를 추가 - 맨 뒤에 추가 : append
            self.skills.insert(skill!, at: 0)
            //테이블 뷰를 다시 출력
            //self.tableView.reloadData()
            
            //첫번째 행에 데이터를 삽입하는 애니메이션 적용
            self.tableView.beginUpdates()
            
            self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .middle)
            
            self.tableView.endUpdates()
        }))

        self.present(alert, animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skills.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")

        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = skills[indexPath.row]

        return cell!
    }
    
    //셀을 선택하고 이동할 때 호출되는 메서드
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //선택한 항목의 데이터 찾아오기
        let movedObject = skills[sourceIndexPath.row]
        //기존의 위치에서 삭제
        skills.remove(at: sourceIndexPath.row)
        //이동할 위치에 추가
        skills.insert(movedObject, at: destinationIndexPath.row)
    }
    
    //테이블 뷰 컨트롤러에서 edit 버튼을 눌렀을 때 호출되는 메소드로 아이콘 모양을 결정하는 메서드
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    //edit 버튼을 눌렀을 때 들여쓰기를 설정하는 메서드
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    //edit 버튼을 눌러서 보여진 아이콘을 누를 때 호출되는 메소드
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //행 번호에 해당하는 데이터를 삭제하고 테이블 뷰를 다시 출력
        self.skills.remove(at: indexPath.row)
        //self.tableView.reloadData()
        
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        self.tableView.endUpdates()
    }
    
}
