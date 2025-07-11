import Text.Printf

inchesToCentimeters :: Double -> Double
inchesToCentimeters x = x * 2.54

centimetersToInches :: Double -> Double
centimetersToInches x = x / 2.54

poundsToKilograms :: Double -> Double
poundsToKilograms x = x * 0.453592

kilogramsToPounds :: Double -> Double
kilogramsToPounds x = x / 0.453592

fahrenheitToCelsius :: Double -> Double
fahrenheitToCelsius x = (x - 32) * 5.0 / 9.0

celsiusToFahrenheit :: Double -> Double
celsiusToFahrenheit x = x * 9.0 / 5.0 + 32

main :: IO()
main = do
  putStrLn "Choose a conversion:"

  putStrLn "=== Distance ==="
  putStrLn "1) Inches to Centimeters"
  putStrLn "2) Centimeters to Inches"

  putStrLn "=== Mass ==="
  putStrLn "3) Pounds to Kilograms"
  putStrLn "4) Kilograms to Pounds"

  putStrLn "=== Temperature ==="
  putStrLn "5) Fahrenheit to Celsius"
  putStrLn "6) Celsius to Fahrenheit"

  choiceInput <- getLine
  let choice = read choiceInput :: Int

  putStrLn "Enter the value to convert:"
  valueInput <- getLine
  let value = read valueInput :: Double

  let result = case choice of
                  1 -> inchesToCentimeters value
                  2 -> centimetersToInches value
                  3 -> poundsToKilograms value
                  4 -> kilogramsToPounds value
                  5 -> fahrenheitToCelsius value
                  6 -> celsiusToFahrenheit value
                  _ -> error "Invalid choice"

  printf "Converted value: %.2f\n" result