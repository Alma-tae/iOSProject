//
//  PhoneBookDAO.swift
//  SQLitePhoneBook
//
//  Created by Sinchon on 2021/05/03.
//

import UIKit

class PhoneBookDAO {
    //DTO역할을 수행할 튜플의 이름을 설정
    //정수 1개(번호)와 문자열 3개(이름, 전화번호, 주소)로 구성
    typealias PhoneRecord = (Int, String, String, String)
    
    //SQLite 연결 및 초기화
    //lazy는 지연 생성 - 처음부터 만들지 않고, 처음 사용할 때 생성
    lazy var fmdb : FMDatabase! = {
        //데이터베이스 파일 경로 생성
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0] as String
        let dbPath = docsDir.appending("/phonebook.sqlite")
        
        //파일 관리 객체 생성
        let fileMgr = FileManager.default
        
        //데이터베이스 연결
        let db = FMDatabase(path: dbPath)
        //데이터베이스 리턴
        return db
    }()
    
    //초기화 메서드
    init() {
        self.fmdb.open()
    }
    
    //소멸자 메서드
    deinit {
        self.fmdb.close()
    }
    
    //전체 데이터를 읽어오는 메서드
    func find() -> [PhoneRecord] {
        var phoneList = [PhoneRecord]()
        
        //예외처리를 하기 싫을 때 사용 try!
        //예외처리를 할 때는...
        do {
            //전체 데이터 읽어오는 SQL
            let sql = "select num, name, phone, addr from phonebook order by num asc"
            //SQL 실행
            let rs = try self.fmdb.executeQuery(sql, values: nil)
            //데이터 읽기
            while rs.next(){
                //각 컬럼의 읽기
                let num = rs.int(forColumn: "num")
                let name = rs.string(forColumn: "name")
                let phone = rs.string(forColumn: "phone")
                let addr = rs.string(forColumn: "addr")
                
                //하나의 행 만들기
                let record = (Int(num), name!, phone!, addr!)
                //배열에 추가
                phoneList.append(record)
            }
        } catch let error as NSError{
            NSLog("데이터 전체 읽기 실패:\(error.localizedDescription)")
        }
        return phoneList
    }
    
    //데이터 1개 가져오기 - 기본키를 매개변수로 받아서 DTO를 리턴
    func get(num:Int) -> PhoneRecord?{
        var record:PhoneRecord? = nil
        
        //sql 생성
        let sql = "select num, name, phone, addr from phonebook where num=?"
        
        let rs = self.fmdb.executeQuery(sql, withArgumentsIn:[num])
        //throws가 있으면 예외처리 필
        
        //1개 데이터 읽기
        if rs?.next() == true{
            let num = rs?.int(forColumn: "num")
            let name = rs?.string(forColumn: "name")
            let phone = rs?.string(forColumn: "phone")
            let addr = rs?.string(forColumn: "addr")
            
            record = (Int(num!), name!, phone!, addr!)
        }
        return record
    }
    //데이터 삽입
    func  create(name:String!, phone:String!, addr:String!) -> Bool {
        do{
            let sql = "insert into phonebook(name, phone, addr) values (?,?,?)"
            
            try self.fmdb.executeUpdate(sql, values: [name!, phone!, addr!])
            
            return true
        }catch let error as NSError{
            NSLog("삽입 예외: \(error.localizedDescription)")
            return false
        }
    }
    //데이터 삭제
    func  remove(num:Int) -> Bool {
        do{
            let sql = "delete from phonebook where num = ?"
            
            try self.fmdb.executeUpdate(sql, values: [num])
            
            return true
        }catch let error as NSError{
            NSLog("삽입 예외: \(error.localizedDescription)")
            return false
        }
    }
    
}
