//
//  QuestionViewController.swift
//  MyQuiz
//
//  Created by s247 on 2018/01/17.
//  Copyright © 2018年 ami. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var questionNoLabel: UILabel!//問題番号ラベル
    @IBOutlet weak var questionTextView: UITextView!//問題文テキストビュー
    
    //解答の選択肢のボタン4つ
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    //◯☓の画像
    @IBOutlet weak var correctImageView: UIImageView!
    @IBOutlet weak var incorrectImageView: UIImageView!
    
    //初期データ設定処理　前データで設定済みのQuestionDataから値を取りだす
    var questionData: QuestionData!
    override func viewDidLoad() {
        super.viewDidLoad()
        questionNoLabel.text = "Q\(questionData.questionNo)"
        questionTextView.text = questionData.question
        answer1Button.setTitle(questionData.answer1, for: UIControlState.normal)
        answer2Button.setTitle(questionData.answer2, for: UIControlState.normal)
        answer3Button.setTitle(questionData.answer3, for: UIControlState.normal)
        answer4Button.setTitle(questionData.answer4, for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
