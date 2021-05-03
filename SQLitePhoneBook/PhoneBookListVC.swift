//
//  PhoneBookListVC.swift
//  SQLitePhoneBook
//
//  Created by Sinchon on 2021/05/03.
//

import UIKit

class PhoneBookListVC: UITableViewController {
    //테이블 뷰에 출력할 데이터 배열
    var phoneBook:[(num:Int, name:String, phone:String, addr:String)]!
    //DAO 객체
    let dao = PhoneBookDAO()
    
    @IBAction func add(_ sender:UIBarButtonItem){
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //전체 데이터 불러오기
        phoneBook = self.dao.find()
        //UI초기화
        
        //네비게이션 바의 중앙에 출력할 타이틀 뷰 생성
        let navTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        navTitle.numberOfLines = 2
        navTitle.textAlignment = .center
        navTitle.font = UIFont.systemFont(ofSize: 14)
        navTitle.text = "연락처\n총 \(self.phoneBook.count) 명"
        self.navigationItem.titleView = navTitle
        
        //네비게이션 바의 왼쪽에 편집 버튼 추가
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        //셀을 스와이프 할 때 편집 모드가 되도록 설정
        self.tableView.allowsSelectionDuringEditing = true
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
