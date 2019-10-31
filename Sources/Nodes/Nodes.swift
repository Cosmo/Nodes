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
}
