class Physician < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :patients, through: :appointments


def name_title
    "#{self.name}, #{self.title}"
end

end