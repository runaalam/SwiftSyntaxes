import Foundation

// MARK: - Array Initialization

// Empty array of integers
var emptyArray: [Int] = []

// Alternatively
var anotherEmptyArray = [Int]()

// Built-in initializer
let repeatingArray = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]

// Multi-dimensional
let rows = 3, columns = 4
var matrix = Array(repeating: Array(repeating: 0, count: columns), count: rows)
print(matrix)

// MARK: - Array Traversing

print("================= Array Traversing =================")

let nums = [1, 2, 3, 4, 5, 6]

// Example 1: The Classic For-Each
for num in nums {
    print(num)
}

// Iterate over a 2D array using for loop.
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

for row in matrix {
    for col in row {
        print(col, terminator: " ")
    }
    print() // To move to the next line after each row
}
// Output:
//  1 2 3
//  4 5 6
//  7 8 9

// Example: Skipping the first element
for num in nums[1...] {
    // Process elements starting from the second one
    print("After skipping 1st element: \(num)")
}

// Example: Processing only the first half of the array
for num in nums[..<(nums.count/2)] {
    // Process elements in the first half
    print("1st half elements: \(num)")
}

// Example 2: Traditional Loop with Indices
for i in 0..<nums.count {
    print(nums[i])
}

// Iterate over a 2D array using Indices.
for i in 0..<matrix.count {
    for j in 0..<matrix[i].count {
        print("Element at (\(i), \(j)) is \(matrix[i][j])")
    }
}

// Example 3: Loop with Enumerated
for (index, num) in nums.enumerated() {
    print("Index: \(index), Value: \(num)")
}

// Iterate over a 2D array using enumerated().
for (i, row) in matrix.enumerated() {
    for (j, element) in row.enumerated() {
        print("Element at (\(i), \(j)) is \(element)")
    }
}

// Using While Loop
var i = 0
while i < nums.count {
    print(nums[i])
    i += 1
}

//Using Stride
var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
for i in stride(from: 1, to: numbers.count, by: 2) {
    print(i)
}

// MARK: - ArrayManipulation(Appending and Inserting Elements)

print("================= Array Append and Insert =================")

var array = [1, 2, 3]

// Append an element to the end of the array
array.append(4) // [1, 2, 3, 4]

// Insert an element at a specific index
array.insert(0, at: 0) // [0, 1, 2, 3, 4]


// MARK: - ArrayManipulation(Removing Array Elements)

print("================= Removing Array Elements =================")

array = [0, 1, 2, 3, 4]
// Remove first element
let firstNumber = array.removeFirst()
print(firstNumber) // Output: 0
print(array) // Output: [1, 2, 3, 4]

// Remove multiple elements from the start
array.removeFirst(2)
print(array) // Output: [3, 4]

array = [1, 2, 3, 4, 5]
// Remove last element
let lastNumber = array.removeLast()
print(lastNumber) // Output: 5
print(array) // Output: [1, 2, 3, 4]

// Remove multiple elements from the end
array.removeLast(2)
print(array) // Output: [1, 2]

// Safe Removal with popLast()
array = [1, 2, 3, 4, 5]
if let lastNumber = array.popLast() {
    print("Removed \(lastNumber)!") // Output: Removed 5!
} else {
    print("Array is empty")
}

// Removing All
array = [1, 2, 3, 4, 5]
array.removeAll()
print(array) // Output: []
print(array.isEmpty) // Output: true

// Remove at a Specific Index
var fruits = ["Apple", "Banana", "Cherry", "Date"]
let removedFruit = fruits.remove(at: 1)
print("Removed fruit: \(removedFruit)") // Output: Removed fruit: Banana
print("Updated array: \(fruits)") // Output: Updated array: ["Apple", "Cherry", "Date"]

// Remove within a Range
array = [1, 2, 3, 4, 5]

// remove elements from index 1 to 3
array.removeSubrange(1...3)
print(array) // Output: [1, 5]

// MARK: - ArrayManipulation(Array Slicing)

print("================= Array Slicing =================")

// Basic Slicing
let array2 = [0, 1, 2, 3, 4, 5, 6]

// Slicing array 1 to 3 index
let subArray = array2[1...3]
print(subArray) // [1, 2, 3]

// Using prefix
let firstThree = array2.prefix(3)
print(firstThree) // [0, 1, 2]

// Specific up to an index
let upToFourth = array2.prefix(upTo: 4)
print(upToFourth) // [0, 1, 2, 3]

// Using Suffix
let lastThree = array2.suffix(3)
print(lastThree) // [4, 5, 6]

//specify a starting index
let from2nd = array2.suffix(from: 2)
print(from2nd) // [2, 3, 4, 5, 6]

// Combining Prefix and Suffix
let middleThree = array2.prefix(5).suffix(3)
print("Array: \(array2), middle: \(middleThree)")
// Output: Array [0, 1, 2, 3, 4, 5, 6], middle: [2, 3, 4]

let middle = array2[2...4]
print("Middle: \(middle)") // Output: Middle: [2, 3, 4]

let exceptLastTwo = array2[..<(array2.count - 2)]
print("Except last 2: \(exceptLastTwo)") // Output: Except last 2: [0, 1, 2, 3, 4]

let fromSecondOn = array2[1...]
print("From Second On: \(fromSecondOn)") //Output: From Second On: [1, 2, 3, 4, 5, 6]

// MARK: - Searching Arrays

print("================= Searching Arrays =================")

//Example 1: contains(_:)
let findNums = [1, 2, 3, 4, 5]
let containsThree = findNums.contains(3)
print(containsThree) // Output: true

// Example 2: contains(where:)
let hasEvenNumber = findNums.contains { $0 % 2 == 0 }
print("Contains an even number: \(hasEvenNumber)")
// Output: Contains an even number: true

// Example 3: firstIndex(of:)
if let indexOfFirstEven = findNums.firstIndex(where: { $0 % 2 == 0 }) {
    print("First even number is at index: \(indexOfFirstEven)")
} else {
    print("No even numbers found")
}
// Output: First even number is at index: 1

// Example 4: firstIndex(of:)
let cars = ["Honda", "Toyota", "Mazda", "Kia", "Tesla"]

if let indexOfMazda = cars.firstIndex(of: "Mazda") {
    print("First Mazda is at index: \(indexOfMazda)")
} else {
    print("Mazda not found")
}
// Output: First Mazda is at index: 2

// Example 5: lastIndex(of:)
if let lastIndexOfMazda = cars.lastIndex(of: "Mazda") {
    print("Last Mazda is at index: \(lastIndexOfMazda)")
} else {
    print("Mazda not found")
}
// Output: Last Mazda is at index: 2

// MARK: - Useful Built-in Methods

print("================= Useful Built-in Methods =================")

// Reverse an Array
numbers = [1, 2, 3, 4, 5]
let reversedNumbers = numbers.reversed()
print(Array(reversedNumbers)) // Output: [5, 4, 3, 2, 1]

// Maximum Value
numbers = [1, 2, 3, 4, 5]
if let maxNumber = numbers.max() {
    print("Max number: \(maxNumber)") // Output: Max number: 5
}

// Minimum Value
if let minNumber = numbers.min() {
    print("Min number: \(minNumber)") // Output: Min number: 1
}

// Swap Array Element
numbers = [10, 20, 30, 40, 50]

// Swap the elements at index 1 and index 3
numbers.swapAt(1, 3)
print(numbers) // Output: [10, 40, 30, 20, 50]


// MARK: - Higher-Order Functions

print("================= Higher-Order Functions =================")

// Sorting
var unsortedArray = [6, 3, 5, 1, 2, 4]

// In-place sorting
unsortedArray.sort()
print(unsortedArray) // Output: [1, 2, 3, 4, 5, 6]

// Returns a new sorted array
let sortedArray = unsortedArray.sorted()
print(sortedArray) // Output: [1, 2, 3, 4, 5, 6]

// Sort in descending order
unsortedArray.sort(by: >)
print(unsortedArray) // Output: [6, 5, 4, 3, 2, 1]

// Another way to sort in descending order
unsortedArray.sort { $0 > $1 }
print(unsortedArray)

// Mapping
array = [1, 2, 3, 4]
// Double each element in the array
let doubled = array.map { $0 * 2 }
print(doubled) // [2, 4, 6, 8]

//FlatMap
let arrays = [[1, 3, 5], [], [2, 4, 6], [7, 8], []]
// Flatten the nested arrays into a single collection, then sort the elements
let mergedAndSorted = arrays.flatMap { $0 }.sorted()
print(mergedAndSorted) // Output: [1, 2, 3, 4, 5, 6, 7, 8]

// Filtering
array = [1, 2, 3, 4, 5, 6]
// Filters the array to include only even numbers
let evens = array.filter { $0 % 2 == 0 }
print(evens) // [2, 4, 6]


// Reducing
let randomArray = [1, 2, 3, 4, 5]

// Summing an Array of Numbers
let sum = randomArray.reduce(0, +)
print(sum) // Output: 15

// Product of Array Elements
let product = randomArray.reduce(1, *)
print(product)// Output: 120

//Concatenating Strings
let stringsArray = ["Let's", "learn", "the", "Swift"]
let concatenated = stringsArray.reduce("", +)
print(concatenated) // Output: "Let's learn the Swift"

// Cumulative Sums
let cumulativeSums = randomArray.reduce(into: [Int]()) { result, number in
    result.append((result.last ?? 0) + number)
}
print(cumulativeSums)  // Output: [1, 3, 6, 10, 15]
