import Foundation
import GameplayKit

func secretNumber() -> Int {
  return GKRandomSource.sharedRandom().nextIntWithUpperBound(100) + 1;
}

func getUserInput() -> String {
  let data = NSFileHandle.fileHandleWithStandardInput().availableData
  
  guard let string = String(data: data, encoding: NSUTF8StringEncoding) else {
    print("Could not get string from data.")
    return ""
  }
  
  let characterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
  return string.stringByTrimmingCharactersInSet(characterSet)
}

func getUserInputInt() -> Int {
  guard let intValue = Int(getUserInput()) else {
    return -1
  }
  return intValue
}

func startGame() {
  let maximumTries: Int = 10
  var currentTries: Int = 0
  
  let correctNumber: Int = secretNumber()
  var guessedNumber: Int = -1
  
  print("Guess The Number! You have \(maximumTries) tries.")
  while correctNumber != guessedNumber {
    if currentTries == maximumTries {
      print("Sorry, you ran out of attempts!")
      print("Correct answer was \(correctNumber)")
      break
    }

    print("Enter your guess:")
    let guess = getUserInputInt()
    guard guess != -1 else {
      continue
    }
    guessedNumber = guess
    
    currentTries += 1
    
    if guessedNumber < correctNumber {
      print("Too Low!")
    }
    else if guessedNumber > correctNumber {
      print("Too High!")
    }
    else {
      print("Correct!")
      print("Number of tries: \(currentTries)")
    }
  }
  
  print("Thanks for playing!")
}

startGame()