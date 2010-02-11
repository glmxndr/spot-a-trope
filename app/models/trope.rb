class Trope < ActiveRecord::Base

    has_many :trope_translations
    has_many :flags
    has_many :tocentries, :through => :flags

    def self.all_by_usage
        return Trope.all.sort! do |a,b| 
            b.count <=> a.count 
        end
    end

    def background_color
        return '#AA'+ (88 - count).to_s + (88 - count).to_s
    end

    def name_with_count
        return name + (count > 0 ? ' ('+count.to_s+')' : '')
    end

    def count
        @count = @count ? @count : flags.count
        @count
    end
end
