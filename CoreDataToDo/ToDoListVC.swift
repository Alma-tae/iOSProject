//
//  ToDoListVC.swift
//  CoreDataToDo
//
//  Created by Sinchon on 2021/05/03.
//

import UIKit
import CoreData

class ToDoListVC: UITableViewController {
    //데이터 저장을 위한 메서드
    func save(title:String, content:String, runtime:Date) -> Bool{
        //코어 데이터 사용을 위한 저장소를 가져오기
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //데이터를 삽입
        let object = NSEntityDescription.insertNewObject(forEntityName: "ToDo", into: context)
        object.setValue(title, forKey: "title")
        object.setValue(content, forKey: "content")
        object.setValue(runtime, forKey: "runtime")
        
        do{
            //데이터 삽입
            try context.save()
            self.list.append(object)
            self.list = self.fetch()
            return true
        }catch{
            context.rollback()
            return false
        }
    }
    
    //전체 데이터를 읽어오는 메서드
    func fetch() -> [NSManagedObject]{
        //코어 데이터 사용을 위한 저장소를 가져오기
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //요청 객체 생성
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ToDo")
        //데이터 가져오기
        let result = try! context.fetch(fetchRequest)
        
        return result
    }
    
    //읽어온 데이터를 저장할 배열
    lazy var list : [NSManagedObject] = {
        return self.fetch()
    }()

    @IBAction func add(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ToDoCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        
        //데이터 찾아오기
        let record = list[indexPath.row]
        let title = record.value(forKey: "title") as? String
        let content = record.value(forKey: "content") as? String
        
        //출력하기
        cell?.textLabel?.text = title
        cell?.detailTextLabel?.text = content

        return cell!
    }
    
}
