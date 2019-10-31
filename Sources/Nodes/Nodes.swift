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
    
    /// A Boolean value indicating whether the node is without children.
    public var isLeaf: Bool {
        return children.isEmpty
    }
    
    /// Returns all nodes with no children.
    public var leaves: [Node] {
        return children.filter { $0.isLeaf }
    }
    
    /// Returns the number of leaves.
    public var breadth: Int {
        return leaves.count
    }
    
    /// A Boolean value indicating whether the node has children.
    public var isBranch: Bool {
        return !children.isEmpty
    }
    
    /// Returns all nodes with at least one child.
    public var branches: [Node] {
        return children.filter { $0.isBranch }
    }
    
    /// Returns the distance between a node and the root.
    public var depth: Int {
        return ancestors.count
    }
    
    /// The number of edges between the current node and the root.
    public var level: Int {
        return depth + 1
    }
    
    /// A Boolean value indicating whether the current node is the top node.
    public var isRoot: Bool {
        return parent == nil
    }
    
    /// Returns the top node.
    public var root: Node {
        guard let rootNode = ancestorsIncludingSelf.first else {
            fatalError("Root element not found.")
        }
        return rootNode
    }
    
    /// Returns the number of children.
    public var degree: Int {
        return children.count
    }
    
    /// Returns all children, moving down from the current node to all leaves.
    public var descendants: [Node] {
        var nodes = [Node]()
        if isBranch {
            nodes.append(contentsOf: children)
            for child in children {
                nodes.append(contentsOf: child.descendants)
            }
        }
        return nodes
    }
    
    /// Returns a line based tree representation starting with the current node.
    var lineBasedDescription: String {
        return buildLines()
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        return "\(value)"
    }
}

extension Node: Equatable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value && lhs.parent == rhs.parent
    }
}

extension Node {
    private typealias PrefixStrings = (prefix: String, childrenPrefix: String)
    private var linePrefixes: PrefixStrings { return ("├── ", "│   ") }
    private var lastLinePrefixes: PrefixStrings { return ("└── ", "    ") }
    
    private func buildLines(_ previousPrefixes: PrefixStrings = ("", "")) -> String {
        return children.reduce("\(previousPrefixes.prefix)\(value)\n") {
            let currentPrefixStrings = children.last == $1 ? lastLinePrefixes : linePrefixes
            let prefixes = (previousPrefixes.childrenPrefix + currentPrefixStrings.prefix,
                            previousPrefixes.childrenPrefix + currentPrefixStrings.childrenPrefix)
            return $0 + $1.buildLines(prefixes)
        }
    }
}
