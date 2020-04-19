import XCPlayground
/**
 [Depth First Search](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Depth-First%20Search)
[Tutoriak](https://www.raywenderlich.com/661-swift-algorithm-club-swift-depth-first-search)
 Depth-first search (DFS) is an algorithm for traversing or searching tree or graph data structures. It starts at a source node and explores as far as possible along each branch before backtracking.

 Depth-first search can be used on both directed and undirected graphs.
 */


//: ![sampleGraph](sampleGraph.png)

// Sample Graph
let adjacencyList = AdjacencyList<String>()

let s = adjacencyList.createVertex(data: "S")
let a = adjacencyList.createVertex(data: "A")
let b = adjacencyList.createVertex(data: "B")
let c = adjacencyList.createVertex(data: "C")
let d = adjacencyList.createVertex(data: "D")
let f = adjacencyList.createVertex(data: "F")
let g = adjacencyList.createVertex(data: "G")
let e = adjacencyList.createVertex(data: "E")

adjacencyList.add(.undirected, from: s, to: a)
adjacencyList.add(.undirected, from: a, to: b)
adjacencyList.add(.undirected, from: a, to: d)
adjacencyList.add(.undirected, from: a, to: c)
adjacencyList.add(.undirected, from: b, to: d)
adjacencyList.add(.undirected, from: d, to: g)
adjacencyList.add(.undirected, from: d, to: f)
adjacencyList.add(.undirected, from: f, to: e)

adjacencyList.description

func depthFirstSearch(from start: Vertex<String>, to end: Vertex<String>, graph: AdjacencyList<String>) -> Stack<Vertex<String>> {
    var visited = Set<Vertex<String>>() // all verticies that have been visited
    var stack = Stack<Vertex<String>>() // store a potential path from start to end vertex

    visited.insert(start)
    stack.push(start)

    outer: while let vertex = stack.peek(), vertex != end {
        guard let neighbors = graph.edges(from: vertex), neighbors.count > 0 else {
            print("backtrack from \(vertex)") // reached a dead end
            stack.pop()
            continue
        }
        for edge in neighbors {
            if !visited.contains(edge.destination) {
                visited.insert(edge.destination)
                stack.push(edge.destination)
                print(stack.description)
                continue outer
            }
        }
        print("backtrack from \(vertex)")
        stack.pop()
    }
    return stack
}

print(depthFirstSearch(from: s, to: e, graph: adjacencyList))


