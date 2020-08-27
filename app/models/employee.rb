class Employee < ApplicationRecord
    has_one :address
    has_many :customers, dependent: :destroy
    validates :empname, presence: true
    validates :empid, presence: true
end
