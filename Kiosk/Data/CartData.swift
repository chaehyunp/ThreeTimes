//
//  CartData.swift
//  Kiosk
//
//  Created by 박진홍 on 11/28/24.
//
/*
 장바구니 데이터를 위한 클래스
 외부에서 필요한 작업 -> '+', '-', 'x', 'get 수량, 가격'
 */
final class CartData {
    var quantity: Int = 1
    var price: Int = 0
    var product: Product
    
    init(product: Product) {
        self.product = product
        self.price = Int(product.price) ?? 999
    }
//    
//    //총 수량을 재계산 하는 메서드_bom
//    private func updateQuantity() {
//        totalQuantity = productsInCart.values.reduce(0, +)
//    }
//    //총 가격 재계산 메서드_bom
//    private func updatPrice() {
//        totalPrice = 0
//        for product in productsInCart.keys {
//            if let price = Int(product.price.filter({ $0.isNumber})) {//숫자만 필터링
//                totalPrice += price
//            }
//        }
//    }
}
