//
//  File.swift
//  
//
//  Created by Devran on 01.11.19.
//

@testable import Nodes

final class SimpleNode: Node {
    typealias Value = String
    var value: Value
    weak var parent: SimpleNode?
    var children: [SimpleNode]
    init(value: Value) {
        self.value = value
        self.children = []
    }
}

extension SimpleNode: Equatable {
    static func == (lhs: SimpleNode, rhs: SimpleNode) -> Bool {
        return lhs.value == rhs.value && lhs.parent == rhs.parent
    }
}

extension SimpleNode: CustomStringConvertible {
    public var description: String {
        return "\(value)"
    }
}
