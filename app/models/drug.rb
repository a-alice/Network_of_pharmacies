class Drug < ActiveRecord::Base
	has_and_belongs_to_many :categories
	has_many :iavails
	has_many :isales

	validates :name, presence: true, uniqueness: {scope: [:maker, :volume]}
	validates :volume, presence: true, numericality: {greater_than: 0}
	validates :maker, presence: true
	validates :dosage, numericality: {greater_than: 0, allow_nil: true}
	validates :recipe, inclusion: {in: [false, true]}

end
