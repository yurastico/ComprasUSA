//
//  Decimal+currency.swift
//  ComprasUSA
//
//  Created by Yuri Cunha on 26/01/24.
//

import Foundation
extension Decimal {
    var currencyUSD: String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.currencyCode = "USD"
        formatter.numberStyle = .currency
        return formatter.string(from: self as NSNumber) ?? "$"
    }
    
    var currencyBRL: String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.currencyCode = "BRL"
        formatter.numberStyle = .currency
        return formatter.string(from: self as NSNumber) ?? "R$"
    }
}
