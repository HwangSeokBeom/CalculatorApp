//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Hwangseokbeom on 11/11/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        setupCalculatorUI()
    }
    
    private func configureLabel(){
        view.backgroundColor = .black
        
        label.text = "12345"
        label.backgroundColor = .black
        label.textColor = .white
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 60, weight: .bold)
        
        [label]
            .forEach{ view.addSubview($0) }
        
        label.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
    }
    
// 1. 메인 세로 스택뷰 설정 함수
    private func setupCalculatorUI() {
        let mainStackView = createMainStackView()
        view.addSubview(mainStackView)
        setupMainStackViewConstraints(mainStackView)
        
        let buttonTitles = [
            ["7", "8", "9", "÷"],
            ["4", "5", "6", "×"],
            ["1", "2", "3", "−"],
            ["0", ".", "=", "+"]
        ]
        
        addButtonRows(to: mainStackView, with: buttonTitles)
    }
    
    // 2. 메인 세로 스택뷰 생성 함수
    private func createMainStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .black
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }
    
    // 3. 메인 스택뷰 제약 설정 함수
    private func setupMainStackViewConstraints(_ stackView: UIStackView) {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }
    
    // 4. 버튼 행들을 메인 스택뷰에 추가하는 함수
    private func addButtonRows(to mainStackView: UIStackView, with buttonTitles: [[String]]) {
        for row in buttonTitles {
            let rowStackView = createRowStackView()
            addButtons(to: rowStackView, with: row)
            mainStackView.addArrangedSubview(rowStackView)
        }
    }
    
    // 5. 각 버튼 행 스택뷰 생성 함수
    private func createRowStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }
    
    // 6. 버튼 생성 및 행 스택뷰에 추가하는 함수
    private func addButtons(to rowStackView: UIStackView, with titles: [String]) {
        for title in titles {
            let button = createButton(with: title)
            rowStackView.addArrangedSubview(button)
        }
    }
    
    // 7. 버튼 생성 함수
    private func createButton(with title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        return button
    }

}
