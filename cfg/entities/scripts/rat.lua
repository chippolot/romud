return {
    enteredRoom = function(self, room)
        act.say(self, "I have arrived!")
    end,
    entityEnteredRoom = function(self, other, room)
        if util.chance() < 20 then
            act.whisper(self, other, "Hello friend!")
        end
    end
}
