return {
    enteredRoom = function(self, room)
        Act.Say(self, "I have arrived!")
    end,
    entityEnteredRoom = function(self, other, room)
        if Util.Chance() < 20 then
            Act.Whisper(self, other, "Hello friend!")
        end
    end
}
