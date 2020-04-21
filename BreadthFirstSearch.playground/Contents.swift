//: Playground - noun: a place where people can play
// [Tutorial](https://www.raywenderlich.com/710-swift-algorithm-club-swift-breadth-first-search)

import UIKit
import XCPlayground

/// A visit is either a source of an Edge
enum Visit<Element: Hashable> {
    case source
    case edge(Edge<Element>)
}

extension Graphable {
    public func breadthFirstSearch(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>]? {
        var queue = Queue<Vertex<Element>>() // list of vertices encountered
        queue.enqueue(source)
        var visits: [Vertex<Element>: Visit<Element>] = [source: .source] // list of vertices encountered so far.

        while let visibleVertex = queue.dequeue() {
            // Handle when destination is reached
            if visibleVertex == destination { // We found the destination - process the route
                var vertex = destination // 1 You created a new variable, to store each vertex which is part of the route.
                var route: [Edge<Element>] = [] // 2 You also created a variable to store your route.

                while let visit = visits[vertex],
                  case .edge(let edge) = visit { // 3 You created a while-loop, which will continue as long as the visits Dictionary has an entry for the vertex, and as long as that entry is an edge. If the entry is a source, then the while-loop will end.

                  route = [edge] + route
                  vertex = edge.source // 4 You added that edge to the start of your route, and set the vertex to that edge’s source. You’re now one step closer to the beginning.

                }
                return route // 5 The while-loop has ended, so your route must now be complete.
            }

            let neighborEdges = edges(from: visibleVertex) ?? []
            for edge in neighborEdges {
                if visits[edge.destination] == nil { // If the Dictionary has no entry for a vertex, then it hasn’t been enqueued yet.
                    queue.enqueue(edge.destination) // add to list of vertices encountered so far.
                    visits[edge.destination] = .edge(edge) // Whenever you enqueue a vertex, you don’t just put the vertex into a set, you record the edge you took to reach it.
                }
            }
        }
        return nil // no possible route found
    }
}

let dungeon = AdjacencyList<String>()

let entranceRoom = dungeon.createVertex(data: "Entrance")
let spiderRoom = dungeon.createVertex(data: "Spider")
let goblinRoom = dungeon.createVertex(data: "Goblin")
let ratRoom = dungeon.createVertex(data: "Rat")
let knightRoom = dungeon.createVertex(data: "Knight")
let batRoom = dungeon.createVertex(data: "Bat")
let orcRoom = dungeon.createVertex(data: "Orc")
let keyRoom = dungeon.createVertex(data: "Key")
let treasureRoom = dungeon.createVertex(data: "Treasure")

dungeon.add(.undirected, from: entranceRoom, to: spiderRoom, weight: 1)
dungeon.add(.undirected, from: entranceRoom, to: ratRoom, weight: 1)
dungeon.add(.undirected, from: entranceRoom, to: batRoom, weight: 1)
dungeon.add(.undirected, from: spiderRoom, to: goblinRoom, weight: 1)
dungeon.add(.undirected, from: spiderRoom, to: orcRoom, weight: 1)
dungeon.add(.undirected, from: ratRoom, to: treasureRoom, weight: 1)
dungeon.add(.undirected, from: ratRoom, to: keyRoom, weight: 1)
dungeon.add(.undirected, from: batRoom, to: knightRoom, weight: 1)

dungeon.description
if let edges = dungeon.breadthFirstSearch(from: entranceRoom, to: treasureRoom) {
  for edge in edges {
    print("\(edge.source) -> \(edge.destination)")
  }
}
