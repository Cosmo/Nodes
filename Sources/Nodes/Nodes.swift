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
    
    /// Returns all parent nodes.
    public var ancestors: [Node] {
        var nodes = [Node]()
        if let parent = parent {
            nodes.append(parent)
            nodes.append(contentsOf: parent.ancestors)
        }
        return nodes
    }
}
