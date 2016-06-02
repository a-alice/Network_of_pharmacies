class Provisor < ActiveRecord::Base
	belongs_to :pharmacy
	has_many :isales

	validates :name, presence: true
	validates :surname, presence: true
	validates :birthday, presence: true
	validates :inn, numericality: {only_integer:true, greater_than: 0, allow_nil: true}
	validates :passport, presence: true, numericality: {only_integer:true, greater_than: 0, allow_nil: true}
	validates :pharmacy_id, presence: true
end