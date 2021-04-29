//
//  ViewController.swift
//  AlamofireTest
//
//  Created by Sinchon on 2021/04/29.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        // 문자열 다운로드
        let request = AF.request("https://httpbin.org/get", method: .get, parameters:nil)
        request.response{
            response in
            let msg = String(data: response.data!, encoding: .utf8)
            NSLog(msg!)
        }
 */
        //문자열 다운로드
        /*
        let request = AF.request("https://www.daum.net", method: .get, parameters: nil)
        request.responseString(completionHandler:{response -> Void in NSLog(response.value!)
        })
 */
        //이미지 다운로드
        /*
        //http로 시작하는 경우에는 info.plist 열어서 작업해줘야 함
        let request = AF.request("https://i.pinimg.com/originals/df/b2/a3/dfb2a309cecf33f748962466a495d24f.jpg", method: .get, parameters: nil)
        request.response{
            response in
            //다운로드 받은 데이터를 가지고 UIImage 객체 생성
            let image = UIImage(data: response.data!)
            //이미지 객체를 가지고 이미지 뷰를 생성해서 현재 뷰에 배치
            let imageView = UIImageView(image: image)
            self.view.addSubview(imageView)
        }
 */
        //다운로드 받을 URL 생성
        /*
        let addr = "https://dapi.kakao.com/v3/search/book?target=title&query="
        let query = "자바".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let url = "\(addr)\(query!)"
        
        //헤더를 추가한 요청 객체 만들기
        let request = AF.request(url, method: .get, encoding: JSONEncoding.default, headers: ["Authorization" :
        "KakaoAK 77c06a72664c652861c4d9b0bb62a1da"])
        
        //json 요청
        request.responseJSON{
            response in
            print(response.value!)
            
            //다운로드 받은 데이터를 디셔너리로 변환
            if let result = response.value as? [String : Any]{
                let documents = result["documents"] as! NSArray
                for index in 0...(documents.count - 1){
                    //데이터를 하나 가져오기
                    let item = documents[index] as! NSDictionary
                    
                    //title과 price 값을 가져와서 출력
                    var title = item["title"]!
                    var price = item["price"]!
                    
                    NSLog("\(title):\(price)")
                }
            
            }
        }
 */
        /*
        //업로드할 데이터 생성
        let image = UIImage(named: "dessert.jpg")
        //png 파일이면 let imageData = imafe?pngData()
        let imageData = image?.jpegData(compressionQuality: 0.5)
        
        AF.upload(multipartFormData:{multipartFormData in multipartFormData.append(Data("태희".utf8), withName:"itemname")
            multipartFormData.append(Data("15000".utf8), withName:"price")
            multipartFormData.append(Data("빙수의 계절".utf8), withName:"description")
            multipartFormData.append(Data("2021-04-29".utf8), withName:"updatedate")
            multipartFormData.append(imageData!, withName: "pictureurl", fileName: "dessert.jpg", mimeType: "image/jpg")
        }, to:"http://cyberadam.cafe24.com/item/insert").responseJSON{
            response in
            if let jsonResult = response.value as? [String:Any]{
                let result = jsonResult["result"] as! Int
                NSLog("결과:\(result)")
            }
        }
        */
        //파라미터 만들기
        let parameters = ["itemid":"18"]
        let request = AF.request("http://cyberadam.cafe24.com/item/delete", method: .post, parameters: parameters, encoder:URLEncodedFormParameterEncoder.default)
        request.responseJSON{
            response in
            if let jsonResult = response.value as? [String:Any]{
                let result = jsonResult["result"] as! Int
                let alert = UIAlertController(title: "삭제 여부", message: "\(result)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                self.present(alert, animated: true)
            }
        }
        
    }

}


