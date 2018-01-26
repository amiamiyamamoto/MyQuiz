//
//  QuestionViewController.swift
//  MyQuiz
//
//  Created by s247 on 2018/01/17.
//  Copyright © 2018年 ami. All rights reserved.
//

import UIKit
import AudioToolbox

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
    
    @IBAction func tapAnsuwer1Button(_ sender: Any) {
        questionData.userChoiceAnswerNo = 1
        goNextQuestionWithAnimation()
    }
    @IBAction func tapAnswer2Button(_ sender: Any) {
        questionData.userChoiceAnswerNo = 2
        goNextQuestionWithAnimation()
    }
    @IBAction func tapAnswer3Button(_ sender: Any) {
        questionData.userChoiceAnswerNo = 3
        goNextQuestionWithAnimation()
    }
    @IBAction func tapAnswer4Button(_ sender: Any) {
        questionData.userChoiceAnswerNo = 4
        goNextQuestionWithAnimation()
    }

    //次の問題にアニメーション付きで進む
    func goNextQuestionWithAnimation() {
        //正解しているか判定
        if questionData.isCorrect() {
            //正解のアニメーションを再生しながら次の問題へ遷移する
            return
        }
        //不正解のアニメーションを再生しながら次の問題へ遷移する

    }
    
    //次の問題に正解のアニメーション付きで遷移する
    func goNextQuestionWithCorrectAnimation() {
        //正解を伝える音を鳴らす
        AudioServicesPlayAlertSound(1025)
        
        //アニメーション
        UIView.animate(withDuration: 2.0, animations: {
            self.correctImageView.alpha = 1.0
        }) { (Bool) in
            //アニメーション完了後に次の問題へ進む
    }
        
    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
