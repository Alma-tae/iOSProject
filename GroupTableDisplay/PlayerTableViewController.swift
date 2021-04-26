//
//  PlayerTableViewController.swift
//  GroupTableDisplay
//
//  Created by Sinchon on 2021/04/26.
//

import UIKit

class PlayerTableViewController: UITableViewController {
    //기본 데이터를 저장할 프로퍼티 - 문자열 배열
    var data:Array<String> = []
    
    //섹션 별로 분류한 데이터를 저장할 프로퍼티 - 디셔너리 배열
    var sectionData:Array<Dictionary<String, Any>> = []
    
    //분류할 때 사용할 인덱스를 저장할 프로퍼티 - 문자열 배열
    var indexes:Array<String> = []
    
    //문자열을 매개변수로 받아서, 첫번재 글자의 자음을 리턴하는 메서드
    func subtract(data:String) -> String{
        //나 하고 비교
        var result = data.compare("나")
        //나보다 작으면 ㄱ으로 시작하는 글자
        if result == ComparisonResult.orderedAscending{
            return "ㄱ"
        }
        result = data.compare("다")
        if result == ComparisonResult.orderedAscending{
            return "ㄴ"
        }
        result = data.compare("라")
        if result == ComparisonResult.orderedAscending{
            return "ㄷ"
        }
        result = data.compare("마")
        if result == ComparisonResult.orderedAscending{
            return "ㄹ"
        }
        result = data.compare("바")
        if result == ComparisonResult.orderedAscending{
            return "ㅁ"
        }
        result = data.compare("사")
        if result == ComparisonResult.orderedAscending{
            return "ㅂ"
        }
        result = data.compare("아")
        if result == ComparisonResult.orderedAscending{
            return "ㅅ"
        }
        result = data.compare("자")
        if result == ComparisonResult.orderedAscending{
            return "ㅇ"
        }
        result = data.compare("차")
        if result == ComparisonResult.orderedAscending{
            return "ㅈ"
        }
        result = data.compare("카")
        if result == ComparisonResult.orderedAscending{
            return "ㅊ"
        }
        result = data.compare("타")
        if result == ComparisonResult.orderedAscending{
            return "ㅋ"
        }
        result = data.compare("파")
        if result == ComparisonResult.orderedAscending{
            return "ㅌ"
        }
        result = data.compare("하")
        if result == ComparisonResult.orderedAscending{
            return "ㅍ"
        }
            return "ㅎ"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //Sample data - 이렇게 직접 쓰는 경우는 극히 드물다
        data.append("캡틴아메리카")
        data.append("완다")
        data.append("비전")
        data.append("토르")
        data.append("로키")
        data.append("아이언맨")
        data.append("해피")
        data.append("페퍼포츠")
        data.append("헐크")
        data.append("호크아이")
        data.append("워머신")
        data.append("스파이더맨")
        data.append("블랙팬서")
        data.append("블랙위도우")
        data.append("타노스")
        data.append("팔콘")
        data.append("윈터솔저")
        data.append("퀵실버")
        data.append("닥터스트레인지")
        data.append("캡틴마블")
        data.append("엔트맨")
        data.append("와스프")
        data.append("닉퓨리")
        data.append("스타로드")
        data.append("가모라")
        data.append("드랙스")
        data.append("그루트")
        data.append("로켓")
        data.append("네뷸라")
        data.append("마리아힐")
        data.append("샤론카터")
        data.append("페기카터")
        data.append("슈리")
        data.append("오코에")
        data.append("니키아")
        data.append("에인션트원")
        data.append("웡")
        data.append("캡틴아메리카")
        data.append("오딘")
        data.append("헤임달")
        data.append("프리가")
        data.append("발키리")
        data.append("헬라")
        data.append("캡틴아메리카")
        data.append("맨티스")
        
        //인덱스 생성
        indexes.append("ㄱ")
        indexes.append("ㄴ")
        indexes.append("ㄷ")
        indexes.append("ㄹ")
        indexes.append("ㅁ")
        indexes.append("ㅂ")
        indexes.append("ㅅ")
        indexes.append("ㅇ")
        indexes.append("ㅈ")
        indexes.append("ㅊ")
        indexes.append("ㅋ")
        indexes.append("ㅌ")
        indexes.append("ㅍ")
        indexes.append("ㅎ")
        
        //data에 있는 데이터들을 첫 글자의 자음별로 분류해서 sectionData에 대입
        
        //각 자음별로 데이터를 임시로 저장할 2차원 배열을 생성
        //14번을 Array()를 호출해서 배열로 생성
        var temp : [[String]] = Array(repeating: Array(), count: 14)
        
        var i = 0
        while i < indexes.count{
            //ㄱ부터 ㅎ까지 firstName에 순서대로 대입
            let firstName = indexes[i]
            //data 순회
            var j = 0
            while j<data.count{
                //첫글자의 자음을 가져옴
                let str = data[j]
                //첫글자의 자음과 firstName이 같으면
                if firstName == subtract(data: str){
                    temp[i].append(str)
                }
                j = j + 1
            }
            i = i + 1
        }
        
        //분류된 데이터를 내부적으로 정렬
        i = 0
        while i < temp.count{
            if temp[i].count >= 2{
                temp[i].sort()
            }
            
            i = i + 1
        }
        
        //데이터가 존재하는 것만 첫번째 글자와 배열을 딕셔너리로 묶어서 sectionData에 추가
        i = 0
        while i < indexes.count {
            //배열에 데이터가 있는 경우만
            if temp[i].count > 0{
                let dic : Dictionary<String, Any> = ["section_name" : indexes[i],
                                                     "data":temp[i]]
                sectionData.append(dic)
            }
            
            i = i + 1
        }
        
        
    }

    // MARK: - Table view data source

    //섹션의 개수를 설정하는 메서드
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionData.count
    }
    
    //섹션의 헤더를 만들어주는 메서드
    //헤어데 자음을 출력
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //섹션 번호로 디셔너리를 찾아옴
        let dic = sectionData[section]
        //디셔너리에서 section_name의 값을 가져옴
        //Array는 직접 변환이 안 되지만, String은 직접 변환 가능
        let str = (dic["section_name"] as! NSString) as String
        return str
    }

    //섹션 별로 행의 개수를 설정하는 메서드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //섹션 번호에 해당하는 데이터를 찾아옴
        let dic = sectionData[section]
        //배열 데이터를 찾아와서 개수를 리턴합니다.
        let marvels = dic["data"] as! NSArray as Array
        
        return marvels.count
    }

    //셀의 모양을 설정하는 메서드
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")

        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }

        //섹션 번호를 이용해서 Dictionary를 찾고
        let dic = sectionData[indexPath.section]
        //Dictionary에서 배열을 찾고
        let marvels = (dic["data"] as! NSArray) as Array
        //배열에서 행 번호를 가지고 데이터를 찾아옴
        let marvel = marvels[indexPath.row] as! String
        
        //데이터 출력
        cell?.textLabel?.text = marvel
        
        return cell!
    }
    

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
