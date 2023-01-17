return {
    enteredRoom = function(self, room)
        print("I ENTER ROOM!")
    end,
    entityEnteredRoom = function(self, other, room)
        print("YOU ENTER ROOM!")
    end
}
