# Nodes

Nodes provides a generic tree data structure with support of multiple children. Written in Swift.

## Usage

Create a new `Node` with `init(value: T)` :

```swift
let root = Node(value: "Hand")
```

Add children with `addChild(node: Node)`:

```swift
root.addChild(node: Node(value: "Thumb"))
root.addChild(node: Node(value: "Index finger"))
root.addChild(node: Node(value: "Middle finger"))
root.addChild(node: Node(value: "Ring finger"))
root.addChild(node: Node(value: "Little finger"))
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
let root = Node(value: "Apple")

let desktops = Node(value: "Desktops")
root.addChild(node: desktops)

let macPro = Node(value: "Mac Pro")
desktops.addChild(node: macPro)

let macMini = Node(value: "Mac Mini")
desktops.addChild(node: macMini)

let iMac = Node(value: "iMac")
desktops.addChild(node: iMac)

let notebooks = Node(value: "Notebooks")
root.addChild(node: notebooks)

let macBookPro = Node(value: "MacBook Pro")
notebooks.addChild(node: macBookPro)

let devices = Node(value: "Devices")
root.addChild(node: devices)

let handhelds = Node(value: "Handhelds")
devices.addChild(node: handhelds)

let ipod = Node(value: "iPod")
handhelds.addChild(node: ipod)

let iphone = Node(value: "iPhone")
handhelds.addChild(node: iphone)

let newton = Node(value: "Newton")
handhelds.addChild(node: newton)

let setTopBoxes = Node(value: "Set-top boxes")
devices.addChild(node: setTopBoxes)

let appleTV = Node(value: "Apple TV")
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
