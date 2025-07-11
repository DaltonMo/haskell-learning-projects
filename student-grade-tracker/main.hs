data Student = Student
  { name    :: String
  , grades  :: [Double]
  }

sumList :: [Double] -> Double
sumList [] = 0 -- If sumList is empty return 0 // stops recursion
sumList (x:xs) = x + sumList xs -- List is deconstructing from [] -> x (head) and xs (tail, remaining list)

averageList :: Double -> Int -> Double
averageList x y = x / fromIntegral y


main :: IO()
main = do
  let student1 = Student "Dalton" [95.0, 88.5, 92.3]
  
  let sumOfGrades = sumList (grades student1)
  let averageOfGrades = averageList sumOfGrades (length (grades student1))

  print (name student1)
  print sumOfGrades
  print averageOfGrades

