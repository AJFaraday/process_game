class Building

  include CommonComponents::Health
  include CommonComponents::Faction

  IMAGE_DIRECTORY = File.join(File.dirname(__FILE__), "..", 'images', 'buildings')
  
  #TODO everything!

end