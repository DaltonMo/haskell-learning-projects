import Text.Printf


data Student = Student
  { name    :: String
  , grades  :: [Double]
  }

students :: [Student]
students = 
  [ Student "Alice" [90.0, 85.5, 78.0]
  , Student "Bob"   [88.0, 92.0, 80.5]
  , Student "Dalton" [100.0, 95.0, 98.5]
  ]

sumList :: [Double] -> Double
sumList [] = 0 -- If sumList is empty return 0 // stops recursion
sumList (x:xs) = x + sumList xs -- List is deconstructing from [] -> x (head) and xs (tail, remaining list)

average :: Student -> Double
average student = sumList (grades student) / fromIntegral(length (grades student))

-- Example of using maximumBy and comparing
topStudent :: [Student] -> Student
topStudent = maximumBy (comparing average) 
-- same as // partial function application
-- topStudent students = maximumBy (comparing average) students

main :: IO()
main = do


  printf "Student: %s\nAverage: %.2f\n" (name (students !! 0)) (average (students !! 0))
  printf "Student: %s\nAverage: %.2f\n" (name (students !! 1)) (average (students !! 1))
  printf "Student: %s\nAverage: %.2f\n" (name (students !! 2)) (average (students !! 2))

