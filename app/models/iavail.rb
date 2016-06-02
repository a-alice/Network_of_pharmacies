class Iavail < ActiveRecord::Base
	belongs_to :drug
	belongs_to :pharmacy

	validates :drug_id, presence: true
	validates :pharmacy_id, presence: true
	validates :quantity, presence: true, numericality: {only_integers:true, greater_than: 0}
end