class Opus < ActiveRecord::Base

    has_many :tocentries

    def mainentries
        tocentries.select {|e| e.parent_id == nil }
    end

end
