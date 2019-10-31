public class Node<T: Hashable> {
    public var value: T
    public weak var parent: Node?
    public var children = [Node]()
    
    public init(value: T) {
        self.value = value
    }
    
    /// Adds a sub-node.
    public func addChild(node: Node) {
        children.append(node)
        node.parent = self
    }
    
    /// Returns all other nodes with the same parent.
    public var siblings: [Node] {
        return siblingsIncludingSelf.filter { $0 != self }
    }
    
    /// Returns all nodes (including the current node) with the same parent.
    public var siblingsIncludingSelf: [Node] {
        return parent?.children ?? []
    }
    
    /// Returns all parent nodes.
    public var ancestors: [Node] {
        var nodes = [Node]()
        if let parent = parent {
            nodes.append(parent)
            nodes.append(contentsOf: parent.ancestors)
        }
        return nodes
    }
    
    /// Returns all parent nodes, including the current node.
    public var ancestorsIncludingSelf: [Node] {
        return ancestors + [self]
    }
}
