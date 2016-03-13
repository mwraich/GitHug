class PairProgrammer < ActiveRecord::Base
    has_many :languages, :as => :languageables
    belongs_to :profile
end
