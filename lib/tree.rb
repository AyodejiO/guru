class Operation
  def initialize(symbol, action)
    @symbol = symbol
    @action = action
  end

  def getSymbol
    @symbol
  end

  def getAction
    @action
  end

  def self.addOperation(a, b)
    a + b
  end

  def self.subtractOperation(a, b)
    a - b
  end

  def self.multiplyOperation(a, b)
    a * b
  end

  def self.divideOperation(a, b)
    if b == 0
      raise "Division by zero error"
    end

    a / b
  end
end

class Node
  def initialize(operation = nil, value, left, right)
    @operation = operation
    @value = value
    @left = left
    @right = right
  end

  def result
    if @operation == nil
      @value
    else
      @operation.getAction.call(@left.result, @right.result)
    end
  end

  def to_s
    if @operation == nil
      @value.to_s
    else
      "(#{@left.to_s} #{@operation.getSymbol} #{@right.to_s})"
    end
  end
end

substraction = Operation.new("-", Operation.public_method(:subtractOperation))
addition = Operation.new("+", Operation.public_method(:addOperation))
multiplication = Operation.new("x", Operation.public_method(:multiplyOperation))
division = Operation.new("÷", Operation.public_method(:divideOperation))

tree = Node.new(
  division,
  nil,
  Node.new(
    addition,
    nil,
    Node.new(nil, 7, nil, nil),
    Node.new(
      multiplication,
      nil,
      Node.new(substraction, nil,
        Node.new(nil, 3, nil, nil),
        Node.new(nil, 2, nil, nil)
      ),
      Node.new(nil, 5, nil, nil)
    )
  ),
  Node.new(nil, 6, nil, nil)
);

def assert_equal(expected, actual)
  if expected != actual
    puts "Expected: #{expected.inspect}, got: #{actual.inspect}"
    exit 1
  end
end

print "Testing tree: #{tree.to_s} \n"
assert_equal "((7 + ((3 - 2) x 5)) ÷ 6)", tree.to_s
assert_equal 2, tree.result