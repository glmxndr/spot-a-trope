class TropeTranslation < ActiveRecord::Base

    belongs_to :trope
    belongs_to :language

end
