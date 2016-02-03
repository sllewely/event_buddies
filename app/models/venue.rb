class Venue < ActiveRecord::Base

  PERMISSIONS = { 1 => peon, 2=> king, 3=> :disciple}


  def self.is_a_peon?
    permission == 2
  end


end
