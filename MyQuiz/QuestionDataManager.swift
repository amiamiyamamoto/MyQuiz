//
//  QuestionDataManager.swift
//  MyQuiz
//
//  Created by s247 on 2018/01/10.
//  Copyright © 2018年 ami. All rights reserved.
//

import Foundation

//一つの問題に関する情報を格納するデータクラス
class QuestionData {
    //問題文
    var question:String
    
    //選択肢1
    var answer1:String
    //選択肢2
    var answer2:String
    //選択肢3
    var answer3:String
    //選択肢4
    var answer4:String
    
    //正解の番号
    var correctAnswerNumber:Int
    
    //ユーザが選択した番号
    var userChoiceAnswerNo:Int?
    
    //問題の番号
    var questionNo:Int = 0
    
    //クラスが生成されたときの処理
    init(questionSouceDataArray:[String]) {
        question = questionSouceDataArray[0]
        answer1 = questionSouceDataArray[1]
        answer2 = questionSouceDataArray[2]
        answer3 = questionSouceDataArray[3]
        answer4 = questionSouceDataArray[4]
        correctAnswerNumber = Int(questionSouceDataArray[5])!
    }
    
    //ユーザーが選択した答えが正解かどうか判定する
    func isCorrect() -> Bool {
        //答えが一致しているかどうか判定する
        if correctAnswerNumber == userChoiceAnswerNo {
            //正解
            return true
        }
        return false
    }
}

//クイズデータ全般の管理と成績を管理するClass
class QuestionDataManager {
    //シングルトンを作成する
    static let sharedInstance = QuestionDataManager()
    
    //問題を格納するための配列
    var questionDataArray = [QuestionData]()
    
    //現在の問題のindex
    var nowQuestionIndex:Int = 0
    
    //初期化処理
    private init() {
        //シングルトンであることを保証するためにprivateで宣言する
    }
    
    //問題文の読み込み処理
    func loadQuestion() {
        //格納済みの問題があれば削除
        questionDataArray.removeAll()
        
        //現在の問題のインデックスを初期化
        nowQuestionIndex = 0
        
        //csvの場所を指定する
        guard let csvFilePath = Bundle.main.path(forResource: "question", ofType: "csv") else {
            print("csvファイルなし")
            return
        }
        
        //csvファイルの読み込み
        do {
            let csvStringData = try String(contentsOfFile:csvFilePath, encoding: String.Encoding.utf8)
            
            //csvのデータを１行づつ読み込み
            csvStringData.enumerateLines(invoking: { (line, stop) in
                //カンマ区切りで分割
                let questionSourceDataArray = line.components(separatedBy: ",")
                
                //問題データを格納するオブジェクトを作成
                let questionData = QuestionData(questionSouceDataArray: questionSourceDataArray)
                self.questionDataArray.append(questionData)
                
                questionData.questionNo = self.questionDataArray.count
                
            })
        } catch let error{
            print("csvファイル読み込みエラーが発生しました\(error)")
            return
        }
        
        //次の問題を取りだす
        func nextQuestion() -> QuestionData? {
            if nowQuestionIndex < questionDataArray.count {
                let nextQuestion = questionDataArray[nowQuestionIndex]
                nowQuestionIndex += 1
                return nextQuestion
            }
            return nil
        }
        
    }
}


















