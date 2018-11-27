function addPictureLine() {

  const imageFields = document.getElementById("image-fields");
  if (imageFields) {
  const imageField = document.getElementById('image-field');
  const morePicturesButton = document.getElementById('more-pictures-button')
  morePicturesButton.addEventListener('click', (event) => {
    imageFields.innerHTML += imageField.innerHTML;
  });
  }
}

addPictureLine();
