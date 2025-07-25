import Text.Printf
--import Data.List
--import Data.Ord

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

topStudent :: [Student] -> Student
topStudent [] = error "No students provided"
topStudent (x:xs) = topStudentHelper x xs

topStudentHelper :: Student -> [Student] -> Student
topStudentHelper best [] = best -- if list is empty, best student found
topStudentHelper best (x:xs)
  | average x > average best  = topStudentHelper x xs -- x becomes the new best
  | otherwise                 = topStudentHelper best xs


-- Example of using maximumBy and comparing
--topStudent :: [Student] -> Student
--topStudent = maximumBy (comparing average) 
-- same as // partial function application
-- topStudent students = maximumBy (comparing average) students

main :: IO()
main = do
  let topStud = topStudent students
  printf "The top student of the class is %s with an average of %.2f%%.\n" (name topStud) (average topStud)

