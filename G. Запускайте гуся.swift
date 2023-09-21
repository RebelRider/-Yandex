import Foundation

let fileName = "input.txt"
func readNums() {
    guard let line = try? String(contentsOfFile: fileName) else { return }
    let split = line.split(separator: "\n")

    let firstRow = split[0].split(separator: " ")
        let nums = firstRow[0].split(separator: " ")
        guard nums.count != 0, let messagesInChat = Int(firstRow[0]), let maximumGooseMsgsBeforeBan = Int(firstRow[1]) else {return}
    print("messagesInChat \(messagesInChat)")
    print("maximumGooseMsgsBeforeBan \(maximumGooseMsgsBeforeBan)")

    var usersArr = [UserAndHisMsgs]()
    var totalCounterOfBanned = 0
    var tempUserName: String? = ""
    var namesOfBannedUsers = ""

    for userAndMessage in 1 ... messagesInChat*2 {
        let row = line.components(separatedBy: .newlines)[userAndMessage]

        if userAndMessage % 2 == 1 {
            if usersArr.contains(where: {$0.name == row}) {
                //
            } else {
                let tempUser = UserAndHisMsgs(name: row)
                usersArr.append(tempUser)
            }
            tempUserName = row
        } else {
            for (userNo, user) in usersArr.enumerated() {
                if user.name == tempUserName {
                    usersArr[userNo].addMessage(message: row)
                    if row.contains("goose") { usersArr[userNo].addBanCounter() }
                }
            }
        }
    }

    for user in usersArr.sorted(by: {$0.name < $1.name}) {
        if user.banCounter >= maximumGooseMsgsBeforeBan {
            totalCounterOfBanned += 1
            namesOfBannedUsers.append(user.name)
            namesOfBannedUsers.append("\n")
        }
    }
    print(usersArr)
    print("totalCounterOfBanned is \(totalCounterOfBanned)")
    print("\(namesOfBannedUsers)")

    let result = (String(totalCounterOfBanned) + "\n" + namesOfBannedUsers)
    try? result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
}

struct UserAndHisMsgs {
    var name: String
    var messages: [String] = []
    var banCounter = 0

    mutating func addMessage(message:String) {
            self.messages.append(message)
    }

    mutating func addBanCounter() {
        self.banCounter += 1
    }
}

readNums()
