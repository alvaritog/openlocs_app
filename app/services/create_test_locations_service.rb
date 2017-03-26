class CreateTestLocationsService
  def call
    locations_seeding_data_uri = 'http://datos.gijon.es/doc/turismo/comercios.json';
    locations_seeding_data = JSON.parse open(locations_seeding_data_uri).read    
    
    #TODO: Build simplified locations data file, with only data needed by this app, and avoid retrieving it from internet
    # locations_seeding_data_filename = File.join(Rails.root,"db","comercios.json")
    # locations_seeding_data = JSON.parse File.read(locations_seeding_data_filename)
    
    locations_data = locations_seeding_data['directorios']['directorio'].collect  do |item| 
      coords = item['localizacion']['content'].nil? ? [nil,nil] : item['localizacion']['content'].split.collect(&:to_f)
      {address: item['direccion'].first, lat: coords.first, lon: coords.last}
    end
    locations = locations_data.collect{|l| Location.find_or_create_by! l}
  end
end
