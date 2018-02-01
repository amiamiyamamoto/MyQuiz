//
//  ResultViewController.swift
//  MyQuiz
//
//  Created by s247 on 2018/01/29.
//  Copyright © 2018年 ami. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var correctPercentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        //問題数を取得する
        let questionCount = QuestionDataManager.sharedInstance.questionDataArray.count
        
        //正解数を取得する
        var correctCount:Int = 0
        
        //正解数を計算する
        for QuestionData in QuestionDataManager.sharedInstance.questionDataArray {
            if QuestionData.isCorrect() {
                correctCount += 1
            }
        }
        //正解率を計算する
        let correctPercent:Float = (Float(correctCount) / Float(questionCount)) * 100
        correctPercentLabel.text = String(format:"%.lf", correctPercent) + "%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
