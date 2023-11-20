# Function to download data from Berlins FIS Broker (via WFS)

# NOTE: The typname is the layer-name. 

# Here an example:
# URL: https://fbinter.stadt-berlin.de/fb/wfs/data/senstadt/sach_denkmal?REQUEST=GetCapabilities&SERVICE=wfs
# 
# The typname is 'sach_denkmal'
# 
# It takes some time and the CRS has to be added manually afterwards (should fix this in update)

get_fisbroker <- function(url, typename = ''){
  link <- httr::parse_url(url)
  typename
  link$query <- list(service = "wfs", version = "2.0.0",
                     request = "GetFeature", typenames = typename)
  request <- httr::build_url(link)
  result <- sf::st_read(request)
  return(result)
}


