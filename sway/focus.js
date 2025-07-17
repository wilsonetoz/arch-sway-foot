#! /bin/env node

process.stdin.once('data', (data) => {
  const tree = JSON.parse(data.toString())
  const nodes = getNodes(tree.nodes[1])
  const focusedNodeIndex = nodes.findIndex(i => i.focused)
  
  process.stdout.write(nodes[getNewIndex(focusedNodeIndex, nodes.length)].id.toString())
})

// Increment or decrement depending on the provided command
function getNewIndex(i, d) {
  if (process.argv.includes('next')) {
    return (i + 1 + d) % d
  } else if (process.argv.includes('prev')) {
    return (i - 1 + d) % d
  } 
  return i
}

// Returns container nodes 
function getNodes(tree) {
  if (tree.nodes && tree.nodes.length > 0) {
    const result = []

    for ( const node of tree.nodes ) {
      result.push(getNodes(node))
    }

    return result.flat().filter(i => i)
  }

  if (tree.type == 'con') {
    return tree
  }

  return null
}
