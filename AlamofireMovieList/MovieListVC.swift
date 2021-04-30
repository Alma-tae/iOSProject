//
//  MovieListVC.swift
//  AlamofireMovieList
//
//  Created by Sinchon on 2021/04/30.
//

import UIKit
import Alamofire

class MovieListVC: UITableViewController {
    //현재 출력한 페이지 번호를 저장할 프로퍼티
    var page = 0
    //마지막 셀이 처음 보여진 것인지 여부를 설정하는 프로퍼티
    var flag = false
    
    //파싱한 결과를 저장할 프로퍼티
    var movieList : Array<MovieVO> = []
    
    //데이터를 파싱해서 저장하고, 테이블 뷰를 다시 출력하는 사용자 정의 함수
    func downloadData(){
        page = page + 1
        //다운로드 받을 URL을 생성
        let addr = "http://cyberadam.cafe24.com/movie/list?page=\(page)"
        //위의 URL에 get 방식으로 요청할 객체를 생성
        let request = AF.request(addr, method:.get, encoding: JSONEncoding.default, headers: [:])
        //JSON 결과를 가져와서 사용하기
        request.responseJSON{
            response in
            
            //swift - JSONObject - NSDictionary - [String:Any]
            //JSONArray - NSArray - [Any]
            
            //swift에서는 if의 조건절에서 변수를 생성하면 데이터가 nil이면 false를 리턴하고, nil이 아니면 true를 리턴 = 데이터가 있으면 하겠다
            //이렇게 해야 NullPointerException으로 인한 프로그램 중단을 예방할 수 있음
            //전체 데이터를 디셔너리로 변환
            if let jsonResult = response.value as? [String:Any]{
                //list 키의 데이터를 배열로 변환해서 저장
                let list = jsonResult["list"] as! NSArray
                //배열의 순회
                for index in 0...(list.count-1){
                    //데이터를 하나씩 순서대로 가져옴
                    let item = list[index] as! NSDictionary
                    //데이터를 저장할 객체를 생성
                    var movie = MovieVO()
                    movie.title = item["title"] as? String
                    movie.genre = item["genre"] as? String
                    movie.link = item["link"] as? String
                    movie.thumbnail = item["thumbnail"] as? String
                    //실수로 변환해서 저장
                    movie.rating = (item["rating"] as! NSNumber).doubleValue
                    //thumbnail 값을 이용해서 이미지를 다운로드 받아서 movie.image에 대입
                    let url = URL(string: "http://cyberadam.cafe24.com/movieimage/\(movie.thumbnail!)")
                    let imageData = try! Data(contentsOf: url!)
                    movie.image = UIImage(data: imageData)
                    
                    //배열에 데이터를 저장
                    self.movieList.append(movie)
                }
                //테이블 뷰를 다시 출력
                self.tableView.reloadData()
                self.title = "영화 목록 (\(self.movieList.count))"
                //데이터를 콘솔에 출력
                NSLog("\(self.movieList)")
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "영화 목록 (\(movieList.count))"
        //데이터를 다운로드 받아서 파싱한 후, 테이블 뷰를 다시 출력하는 함수 호출
        downloadData()
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //사용자 정의 셀 객체를 생성
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        //데이터를 찾아오기
        let movie = movieList[indexPath.row]
        
        //데이터 출력
        cell.lblTitle.text = movie.title!
        cell.lblGenre.text = movie.genre!
        cell.lblRating.text = "\(movie.rating!)"
        cell.imgThumbnail.image = movie.image!
        cell.accessoryType = .disclosureIndicator

        return cell
    }
    
    //행의 높이를 설정하는 메서드
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 182
    }
    
    //테이블 뷰에서 스크롤을 하면 호출되는 메서드
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //처음 마지막 셀이 출력되면
        if flag == false && indexPath.row == self.movieList.count - 1{
            flag = true
        }
        //마지막 셀이 처음이 아닌데 출력되면
        else if flag == true && indexPath.row == self.movieList.count - 1{
            downloadData()
        }
    }
    
    //셀을 선택했을 때 호출되는 메서드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //하위 뷰 컨트롤러 생성
        let movieLinkVC = storyboard?.instantiateViewController(identifier: "MovieLinkVC") as! MovieLinkVC
        //행 번호에 해당하는 데이터 찾아오기
        let movie = movieList[indexPath.row]
        //하위 데이터 넘겨주기
        movieLinkVC.link = movie.link
        movieLinkVC.title = movie.title
        //하위 뷰 컨트롤러 출력
        navigationController?.pushViewController(movieLinkVC, animated: true)
    }
}
