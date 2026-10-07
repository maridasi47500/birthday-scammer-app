import locationtagger

# initializing sample text
sample_text = "India has very rich and vivid culture widely\
        spread from Kerala to Nagaland to Haryana to Maharashtra. " \
       "Mumbai being financial capital can be said better\
       than some western cities such as " \
       " Lahore, Canberra etc. Pakistan and Nepal share its borders"

# extracting entities.
place_entity = locationtagger.find_locations(text = sample_text)

# getting all country regions
print("The countries regions in text : ")
print(place_entity.country_regions)

# getting all country cities
print("The countries cities in text : ")
print(place_entity.country_cities)

# getting all other countries
print("All other countries in text : ")
print(place_entity.other_countries)

# getting all region cities
print("The region cities in text : ")
print(place_entity.region_cities)

# getting all other regions
print("All other regions in text : ")
print(place_entity.other_regions)

# getting all other entities
print("All other entities in text : ")
print(place_entity.other)

