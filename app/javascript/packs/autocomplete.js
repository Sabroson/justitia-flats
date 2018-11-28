const addressInput = document.getElementById('flat_address');
 if (addressInput) {
  const places = require('places.js');
  const placesAutocomplete = places({
    appId: 'plNC0Q4YQAAX',
    apiKey: '25aedb7556dccc096bc177385878fe3f',
    container: addressInput
  });
  placesAutocomplete.on('change', (event) => {
    const coords = event.suggestion.latlng
    setForm(coords)
  });
}
 function setForm(coords) {
  document.getElementById('flat_latitude').value = coords.lat
  document.getElementById('flat_longitude').value = coords.lng
}
