class String
  unless "".respond_to?(:lines)
    require "enumerator"

    def lines
      to_a.enum_for(:each)
    end
  end
end
