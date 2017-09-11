class Ballad < ApplicationRecord
	belongs_to :cadet, optional: true
	belongs_to :candidate, optional: true
end
