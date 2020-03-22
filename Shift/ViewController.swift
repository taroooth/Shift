//
//  ViewController.swift
//  Shift
//
//  Created by 岡田龍太朗 on 2020/03/10.
//  Copyright © 2020 岡田龍太朗. All rights reserved.
//

import UIKit
import SpreadsheetView

class ViewController: UIViewController, SpreadsheetViewDataSource {

    @IBOutlet weak var spreadsheetView: SpreadsheetView!
    let days = ["月曜", "火曜", "水曜", "木曜", "金曜", "土曜", "日曜"]
    let times = ["6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "1", "2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spreadsheetView.dataSource = self
        
        spreadsheetView.register(HeaderCell.self, forCellWithReuseIdentifier: String(describing: HeaderCell.self))
        spreadsheetView.register(TextCell.self, forCellWithReuseIdentifier: String(describing: TextCell.self))
        spreadsheetView.register(TaskCell.self, forCellWithReuseIdentifier: String(describing: TaskCell.self))
        spreadsheetView.register(ChartBarCell.self, forCellWithReuseIdentifier: String(describing: ChartBarCell.self))
    }
    
    //横の数
    func numberOfColumns(in spreadsheetView: SpreadsheetView) -> Int {
        28
    }
    
    //縦の数
    func numberOfRows(in spreadsheetView: SpreadsheetView) -> Int {
        29
    }
    
    //Cellの横幅
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, widthForColumn column: Int) -> CGFloat {
      return 40
    }

    //Cellの縦幅
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, heightForRow row: Int) -> CGFloat {
      return 20
    }

    //左4行は固定
    func frozenColumns(in spreadsheetView: SpreadsheetView) -> Int {
        return 4
    }
    
    //上1行は固定
    func frozenRows(in spreadsheetView: SpreadsheetView) -> Int {
        return 1
    }
    
    //Cellを結合
    func mergedCells(in spreadsheetView: SpreadsheetView) -> [CellRange] {
        return [CellRange(from: (row: 0, column: 0), to: (row: 0, column: 3)),/* 月週*/
                CellRange(from: (row: 1, column: 0), to: (row: 4, column: 0)),/* 月曜*/
                CellRange(from: (row: 5, column: 0), to: (row: 8, column: 0)),/* 火週*/
                CellRange(from: (row: 9, column: 0), to: (row: 12, column: 0)),/* 水週*/
                CellRange(from: (row: 13, column: 0), to: (row: 16, column: 0)),/* 木週*/
                CellRange(from: (row: 17, column: 0), to: (row: 20, column: 0)),/* 金週*/
                CellRange(from: (row: 21, column: 0), to: (row: 24, column: 0)),/* 土週*/
                CellRange(from: (row: 25, column: 0), to: (row: 28, column: 0)),/* 日週*/
            
                CellRange(from: (row: 1, column: 1), to: (row: 4, column: 3)),
                CellRange(from: (row: 5, column: 1), to: (row: 8, column: 3)),
                CellRange(from: (row: 9, column: 1), to: (row: 12, column: 3)),
                CellRange(from: (row: 13, column: 1), to: (row: 16, column: 3)),
                CellRange(from: (row: 17, column: 1), to: (row: 20, column: 3)),
                CellRange(from: (row: 21, column: 1), to: (row: 24, column: 3)),
                CellRange(from: (row: 25, column: 1), to: (row: 28, column: 3))
        
        ]
    }
    
    func spreadsheetView(_ spreadsheetView: SpreadsheetView, cellForItemAt indexPath: IndexPath) -> Cell? {
    switch (indexPath.row, indexPath.column) {
    case (0, 0):
        let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: HeaderCell.self), for: indexPath) as! HeaderCell
        cell.label.text = "月　週"
        cell.gridlines.left = .default
        cell.gridlines.right = .none
        return cell
        
    case (1...28, 0):
        let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: TaskCell.self), for: indexPath) as! TaskCell
        cell.label.text = days[(indexPath.row) / 4]
        cell.gridlines.left = .default
        cell.gridlines.right = .default
        return cell
    
    case (0, 4...30):
        let cell = spreadsheetView.dequeueReusableCell(withReuseIdentifier: String(describing: HeaderCell.self), for: indexPath) as! HeaderCell
        cell.label.text = times[(indexPath.column) - 4]
        cell.gridlines.left = .default
        cell.gridlines.right = .default
        return cell
        
    default: return nil
        }
    }
    


}

