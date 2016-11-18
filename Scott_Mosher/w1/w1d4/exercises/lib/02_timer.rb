class Timer
    
    attr_accessor :seconds
    
    def initialize(seconds = 0)
        @seconds = seconds
    end
    
    def hours
        Integer(seconds / 3600)
    end

    def minutes
        Integer((seconds % 3600) / 60)
    end

    def secs
        Integer((seconds % 60))
    end
    
    def time_string
        
        if hours < 10
            hourStr = "0#{hours}"
        else
            hourStr = "#{hours}"
        end
        
        if minutes < 10
            minStr = "0#{minutes}"
        else
            minStr = "#{minutes}"
        end
        
        if secs < 10
            secStr = "0#{secs}"
        else
            secStr = "#{secs}"
        end
        
        "#{hourStr}:#{minStr}:#{secStr}"
    end
end