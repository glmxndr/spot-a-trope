class Entry < ActiveRecord::Base

    belongs_to :edition
    belongs_to :tocentry

end
