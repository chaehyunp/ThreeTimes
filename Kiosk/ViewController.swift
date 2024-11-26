//
//  ViewController.swift
//  Kiosk
//
//  Created by CHYUN on 11/25/24.
//

import UIKit

class ViewController: UIViewController {
    private let cartTableView = CartTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCartTableView()
        setupButtons()
    }
    
    private func setupCartTableView() {
        view.addSubview(cartTableView)
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cartTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cartTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cartTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cartTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
    }
    
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
            buttonStack.topAnchor.constraint(equalTo: cartTableView.bottomAnchor, constant: 20),
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func addProduct() {
        let newProduct = "상품 \(cartTableView.data.count + 1)"
        cartTableView.addProduct(newProduct)
    }
    
    @objc private func removeLastProduct() {
        guard !cartTableView.data.isEmpty else { return }
        cartTableView.removeProduct(at: cartTableView.data.count - 1)
    }
}

#Preview {
    ViewController()
}
