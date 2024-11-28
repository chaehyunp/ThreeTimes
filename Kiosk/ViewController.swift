//
//  ViewController.swift
//  Kiosk
//
//  Created by CHYUN on 11/25/24.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - 박진홍 테스트 코드
    
    private let bottomView = BottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCartTableView()
        setupButtons()
    }
    //추후 레이아웃 맞춰야 함.
    private func setupCartTableView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    //임시 추가 삭제 버튼들
    private func setupButtons() {
        let addButton = UIButton(type: .system)
        addButton.setTitle("상품 추가", for: .normal)
        addButton.addTarget(self, action: #selector(addProduct), for: .touchUpInside)
        
        let deleteButton = UIButton(type: .system)
        deleteButton.setTitle("상품 삭제", for: .normal)
        deleteButton.addTarget(self, action: #selector(removeLastProduct), for: .touchUpInside)
        
        let buttonStack = UIStackView(arrangedSubviews: [addButton, deleteButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 20
        buttonStack.alignment = .center
        buttonStack.distribution = .equalSpacing
        
        view.addSubview(buttonStack)
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: 20),
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    //셀 추가 메서드 연결
    @objc private func addProduct() {
        let newProduct = "상품 \(bottomView.cartView.data.count + 1)"//새로운 셀 데이터
        bottomView.cartView.addProduct(newProduct)
        bottomView.updateCartHeight()
    }
    //셀 삭제 메서드 연결
    @objc private func removeLastProduct() {
        guard !bottomView.cartView.data.isEmpty else { return }
        bottomView.cartView.removeProduct(at: bottomView.cartView.data.count - 1)
        bottomView.updateCartHeight()
    }
}

#Preview {
    ViewController()
}
