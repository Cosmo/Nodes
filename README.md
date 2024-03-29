# Nodes

Nodes is a class protocol for tree data structures.
A `class` which conforms the `Node`-Protocol, will gain useful properties to easily navigate in the tree. 

## Usage

Create a new `class` and conform it to the `Node`-Protocol:

```swift
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

extension SimpleNode: Equatable, CustomStringConvertible {
    static func == (lhs: SimpleNode, rhs: SimpleNode) -> Bool {
        return lhs.value == rhs.value && lhs.parent == rhs.parent
    }

    public var description: String {
        return "\(value)"
    }
}
```

Create a root node:

```swift
let root = SimpleNode(value: "Hand")
```

Add children with `addChild(node: Node)`:

```swift
root.addChild(node: SimpleNode(value: "Thumb"))
root.addChild(node: SimpleNode(value: "Index finger"))
root.addChild(node: SimpleNode(value: "Middle finger"))
root.addChild(node: SimpleNode(value: "Ring finger"))
root.addChild(node: SimpleNode(value: "Little finger"))
```

Print tree to console:

```swift
print(root.lineBasedDescription)
```

Result:

```
Hand
├── Thumb
├── Index finger
├── Middle finger
├── Ring finger
└── Little finger
```

## Features

### Ancestors

```swift
/// Returns all parent nodes.
var ancestors: [Node]
```

```swift
/// Returns all parent nodes, including the current node.
var ancestorsIncludingSelf: [Node]
```

```swift
/// A Boolean value indicating whether the current node is the top node.
var isRoot: Bool
```

```swift
/// Returns the top node.
var root: Node
```

### Descendants

```swift
/// Adds a sub-node.
func addChild(node: Node)
```

```swift
/// Returns the number of children.
var degree: Int
```

```swift
/// Returns all descendants, traversing the entire tree.
var descendants: [Node]
```

### Leaves

```swift
/// A Boolean value indicating whether the node is without children.
var isLeaf: Bool
```

```swift
/// Returns all nodes with no children.
var leaves: [Node]
```

```swift
/// Returns the number of leaves.
var breadth: Int
```

### Branches

```swift
/// A Boolean value indicating whether the node has children.
var isBranch: Bool
```

```swift
/// Returns all nodes with at least one child.
var branches: [Node]
```

### Siblings

```swift
/// Returns all other nodes with the same parent.
var siblings: [Node]
```

```swift
/// Returns all nodes (including the current node) with the same parent.
var siblingsIncludingSelf: [Node]
```

### Position

```swift
/// Returns the distance between a node and the root.
var depth: Int
```

```swift
/// The number of edges between the current node and the root.
var level: Int
```

### Textual representation

```swift
var lineBasedDescription: String
```


## Example

```swift
let root = SimpleNode(value: "Apple")

let desktops = SimpleNode(value: "Desktops")
root.addChild(node: desktops)

let macPro = SimpleNode(value: "Mac Pro")
desktops.addChild(node: macPro)

let macMini = SimpleNode(value: "Mac Mini")
desktops.addChild(node: macMini)

let iMac = SimpleNode(value: "iMac")
desktops.addChild(node: iMac)

let notebooks = SimpleNode(value: "Notebooks")
root.addChild(node: notebooks)

let macBookPro = SimpleNode(value: "MacBook Pro")
notebooks.addChild(node: macBookPro)

let devices = SimpleNode(value: "Devices")
root.addChild(node: devices)

let handhelds = SimpleNode(value: "Handhelds")
devices.addChild(node: handhelds)

let ipod = SimpleNode(value: "iPod")
handhelds.addChild(node: ipod)

let iphone = SimpleNode(value: "iPhone")
handhelds.addChild(node: iphone)

let newton = SimpleNode(value: "Newton")
handhelds.addChild(node: newton)

let setTopBoxes = SimpleNode(value: "Set-top boxes")
devices.addChild(node: setTopBoxes)

let appleTV = SimpleNode(value: "Apple TV")
setTopBoxes.addChild(node: appleTV)


print(root.lineBasedDescription)
```

Output:

```
Apple
├── Desktops
│   ├── Mac Pro
│   ├── Mac Mini
│   └── iMac
├── Notebooks
│   └── MacBook Pro
└── Devices
    ├── Handhelds
    │   ├── iPod
    │   ├── iPhone
    │   └── Newton
    └── Set-top boxes
        └── Apple TV
```


## Other Projects

* [BinaryKit](https://github.com/Cosmo/BinaryKit) — BinaryKit helps you to break down binary data into bits and bytes and easily access specific parts.
* [Clippy](https://github.com/Cosmo/Clippy) — Clippy from Microsoft Office is back and runs on macOS! Written in Swift.
* [GrammaticalNumber](https://github.com/Cosmo/GrammaticalNumber) — Turns singular words to the plural and vice-versa in Swift.
* [HackMan](https://github.com/Cosmo/HackMan) — Stop writing boilerplate code yourself. Let hackman do it for you via the command line.
* [ISO8859](https://github.com/Cosmo/ISO8859) — Convert ISO8859 1-16 Encoded Text to String in Swift. Supports iOS, tvOS, watchOS and macOS.
* [SpriteMap](https://github.com/Cosmo/SpriteMap) — SpriteMap helps you to extract sprites out of a sprite map. Written in Swift.
* [StringCase](https://github.com/Cosmo/StringCase) — Converts String to lowerCamelCase, UpperCamelCase and snake_case. Tested and written in Swift.
* [TinyConsole](https://github.com/Cosmo/TinyConsole) — TinyConsole is a micro-console that can help you log and display information inside an iOS application, where having a connection to a development computer is not possible.

## License

Nodes is released under the [MIT License](http://www.opensource.org/licenses/MIT).
