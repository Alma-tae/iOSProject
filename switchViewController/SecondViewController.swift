//
//  SecondViewController.swift
//  switchViewController
//
//  Created by Sinchon on 2021/04/23.
//

import UIKit

class SecondViewController: UIViewController {
    //메인화면에서 전달
    var subData:String! = nil
    

    @IBAction func moveMain(_ sender: Any) {
        //자신을 출력할 뷰 컨트롤러로 돌아가기
        
        //자신을 출력한 뷰 컨트롤러 찾아오기
        let viewController = presentingViewController as! ViewController
        viewController.mainData = "Welcome!"
        viewController.dismiss(animated: true)
    }
    @IBOutlet weak var lblSecond: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if subData != nil {
            lblSecond.text = subData
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
