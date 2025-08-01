module Main where

-- Includes

-- Data types
data Task = Task 
    { taskDescription   :: String
    , completionStatus  :: Bool
    } deriving (Show, Eq)

type TaskList = [Task]

-- Pure functions
addTask :: String -> TaskList -> TaskList
addTask desc tasks = tasks ++ [Task desc False]

removeTask :: Integer -> TaskList -> TaskList
removeTask i tasks = [task | (idx, task) <- zip [1..] tasks, idx /= i]

displayTasks :: TaskList -> String
displayTasks [] = "No tasks available."
displayTasks tasks = unlines [show idx ++ ". [" ++ status ++ "] " ++ desc
                                | (idx, Task desc done) <- zip [1..] tasks
                                , let status = if done then "X" else " "]

completeTask :: Integer -> TaskList -> TaskList
completeTask i tasks = [ if idx == i then Task desc True else task
                    | (idx, task@(Task desc status)) <- zip[1..] tasks]

-- Main function
main :: IO()
main = do
    let tasks0 = []
    let tasks1 = addTask "Take out trash" tasks0
    let tasks2 = addTask "Clean dishes" tasks1
    let tasks3 = completeTask 1 tasks2
    let tasks4 = removeTask 1 tasks3

    putStrLn "Initial: "
    putStrLn (displayTasks tasks0)

    putStrLn "\nAfter Adding:"
    putStrLn (displayTasks tasks2)

    putStrLn "\nAfter Completing:"
    putStrLn (displayTasks tasks3)

    putStrLn "\nAfter Removing:"
    putStrLn (displayTasks tasks4)
