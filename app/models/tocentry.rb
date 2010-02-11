class Tocentry < ActiveRecord::Base

    belongs_to :opus
    
    has_many :entries
    has_many :flags
    has_many :tropes, :through => :flags

    acts_as_tree


    def preceding
        allsiblings = parent ? parent.children : opus.mainentries
        idx = allsiblings.index self
        return nil if idx == nil or idx == 0
        siblings[idx-1]
    end
    
    def following
        allsiblings = parent ? parent.children : opus.mainentries
        idx = allsiblings.index self
        return nil if idx == nil or idx == allsiblings.size() - 1
        allsiblings[idx+1]
    end
    
    def unbound_tropes
        Trope.all_by_usage.reject {|t| tropes.index t }
    end

end
