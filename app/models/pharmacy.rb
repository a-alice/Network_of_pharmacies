class Pharmacy < ActiveRecord::Base
	has_many :provisors
	has_many :iavails
	has_many :isales

	validates :address, presence: true
	validates :number, presence: true, numericality: {only_integers:true, greater_than: 0}, uniqueness: true
	validates :subway, presence: true
end