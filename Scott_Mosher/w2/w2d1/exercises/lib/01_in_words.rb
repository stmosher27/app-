ONES = {
  0 => "zero",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine"
}

TENS = {
  20 => "twenty",
  30 => "thirty",
  40 => "forty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety"
}

TEENS = {
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen"
}

HUNS = 100
THOUS = 1000
MILS = 1000000
BILS = 1000000000
TRILS = 1000000000000

class Fixnum
    def in_words
        if (self < 10)
            ONES[self]
        elsif (self < 20)
            TEENS[self]
        elsif (self < 100)
            tens = TENS[(self/10)*10]
            if (self%10 != 0)
                ones = ONES[self%10]
                tens + " " + ones
            else
                tens
            end
        else
            if (self < THOUS)
                hundreds(self)
            elsif (self < MILS)
                thousands(self)
            elsif (self < BILS)
                millions(self)
            elsif (self < TRILS)
                billions(self)
            else
                trillions(self)
            end
        end
    end
    
    def hundreds(int)
        hun = (self / HUNS).in_words + " hundred"
        if (self % HUNS != 0)
            hun + " " + (self % HUNS).in_words
        else
            hun
        end
    end
    
    def thousands(int)
        thous = (self / THOUS).in_words + " thousand"
        if (self % THOUS != 0)
            thous + " " + (self % THOUS).in_words
        else
            thous
        end
    end
    
    def millions(int)
        mils = (self / MILS).in_words + " million"
        if (self % MILS != 0)
            mils + " " + (self % MILS).in_words
        else
            mils
        end
    end
    
    def billions(int)
        bils = (self / BILS).in_words + " billion"
        if (self % BILS != 0)
            bils + " " + (self % BILS).in_words
        else
            bils
        end
    end
    
    def trillions(int)
        trils = (self / TRILS).in_words + " trillion"
        if (self % TRILS != 0)
            trils + " " + (self % TRILS).in_words
        else
            trils
        end
    end
end

            
            