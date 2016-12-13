module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable

  end

  # def receive_toy(name)
  #   pet = Class.find_by(self.name)
  #   if pet
  #     self.toys << receive_toy
  #   else
  #     Class.create_by()
  #   end
  # end
end
