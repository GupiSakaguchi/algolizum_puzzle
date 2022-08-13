# 深さ優先探索
#
def dfs
  start = 0
  treasure = 8

  tree = data
  searched = Array.new(tree.length, false)

  searched[start] = true
  stack = tree[start]
  step = 0

  while stack.length > 0
    step += 1
    puts <<~"EOS"
         --------------------
         #{step}
         探索候補 -> #{stack}
    EOS

    node = stack.pop
    searched[node] = true
    msg = "tree[#{node}] を探索 -> "

    if node == treasure
      puts msg << "お宝発見！"
      return
    else
      puts msg << "お宝はありませんでした"
    end

    puts "探索済みリスト -> #{searched}"

    next_nodes = tree[node].select { |node| not searched[node] }
    puts "追加候補 -> #{next_nodes}"
    next_nodes.each { |node| stack.push(node) }
  end
end

def data
  [
    [1],
    [0, 2, 4],
    [1, 3],
    [2],
    [1, 6],
    [6, 8],
    [4, 5, 7],
    [6, 9],
    [5],
    [7]
  ]
end
