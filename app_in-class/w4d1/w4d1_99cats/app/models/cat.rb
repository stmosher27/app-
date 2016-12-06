class Cat < ActiveRecord::Base
   validates :name, :sex, :birth_date, :presence => true
   validates :color, inclusion: { in: %w(red blue black white)}
   validates :sex, inclusion: { :in => ['M', 'F']}

   def age
     @age = Date.today.year - birth_date.year
     @age -= 1 if Date.today < birth_date + @age.years
   end


end
