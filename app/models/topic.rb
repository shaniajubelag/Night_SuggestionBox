class Topic < ApplicationRecord
    # reject USER if length of LETTERS FOR title is short
    validates :title, presence: true,
                        length: { minimum: 5 }
                        # minimum of 5 MEANS 5 or more letters ARE ALLOWED

end
