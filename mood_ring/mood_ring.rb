#!/usr/bin/env ruby
#
# Copying the mood_ring class I created in python for practice

class Ring
  @@default_mood_arr = ["stressed", "nervous", "unsettled", "active", "relaxed",
                        "lovable", "romantic", "happy", "tired", "calm"]

  def initialize(mood_list = @@default_mood_arr)
      puts mood_list
  end

end


mood_ring = Ring.new
