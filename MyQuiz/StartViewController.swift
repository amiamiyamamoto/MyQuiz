//
//  StartViewController.swift
//  MyQuiz
//
//  Created by s247 on 2018/01/16.
//  Copyright © 2018年 ami. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //次の画面に遷移する前に呼び出される準備処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //問題文の読み込み
        QuestionDataManager.sharedInstance.loadQuestion()
    }
}
