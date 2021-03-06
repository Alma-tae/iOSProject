//
//  ToDoInputVC.swift
//  CoreDataToDo
//
//  Created by Sinchon on 2021/05/03.
//

import UIKit
import CoreData

class ToDoInputVC: UIViewController {
    //삽입과 수정을 구분하기 위한 프로퍼티
    var mode = "삽입"
    
    //수정을 위해 필요한 데이터
    var object : NSManagedObject!
    
    var t = ""
    var c = ""
    var r = Date()

    @IBOutlet weak var dpRuntime: UIDatePicker!
    @IBOutlet weak var tvContent: UITextView!
    @IBOutlet weak var tfTitle: UITextField!
    
    @IBAction func save(_ sender: Any) {
        //입력한 데이터 가져오기
        let title = tfTitle.text
        let content = tvContent.text
        let runtime = dpRuntime.date
        
        //자신을 출력한 뷰 컨트롤러 찾아오기
        //NavigationController를 이용해서 이동한 경우
        //첫번째 뷰 컨트롤러를 찾아오기
        
       // let navVC = self.presentationController as! UINavigationController
       // let toDoListVC = navVC.topViewController as! ToDoListVC
        
        
        let toDoListVC = navigationController!.viewControllers[0] as! ToDoListVC
        
        //데이터 삽입하는 메서드 호출
        if mode == "삽입"{
            let result = toDoListVC.save(title: title!, content: content!, runtime: runtime)
            if result == true{
                NSLog("데이터 삽입 성공")
            }else{
                NSLog("데이터 삽입 실패")
            }
        }else{
            let result = toDoListVC.edit(object: object, title: title!, content: content!, runtime: runtime)
            if result == true{
                NSLog("데이터 삽입 성공")
            }else{
                NSLog("데이터 삽입 실패")
            }
        }
        //이전 뷰 컨트롤러로 이동
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancel(_ sender: Any) {
        //이전 ViewController로 이동
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = mode
        
        //수정 모드이면 데이터를 출력
        if mode == "수정"{
            self.tfTitle.text = t
            self.tvContent.text = c
            self.dpRuntime.date = r
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
