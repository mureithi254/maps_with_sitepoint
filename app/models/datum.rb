class Datum < ApplicationRecord
	geocoded_by :address
	after_validation :geocode
	after_save :write_json

	# def write_json
 #      record_json = Datum.all.map{| record | {Datum.name => record.attributes}}.to_json
 #      File.open('public/mapdata.geojson','w') do |f|
 #        f.write record_json
 #      end
	# end

	def write_json
      datas_json = []
      Datum.all.each do |map_data|
        data_json =  {
			  "type": "Feature",
			  "properties": {
			   	  "name": "#{map_data.description}",
			   	  "popupContent": "#{map_data.description} located in #{map_data.address}"
			   },
			  "geometry": {
			    "type": "Point",
			    "coordinates": [map_data.latitude, map_data.longitude]
			  }
			}
			datas_json << data_json
       end

      File.open('public/mapdata.json','w') do |f|
        f.write datas_json.to_s
       end
	end
end
