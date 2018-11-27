function addPictureLine() {
  let counter = 0;
  const imageFields = document.getElementById("image-fields");
  if (imageFields) {
    const morePicturesButton = document.getElementById('more-pictures-button')

    morePicturesButton.addEventListener('click', (event) => {
      const imageField =`
      <div id="image-field">
      <input type="file" name="flat[pictures][picture${counter}]" id="flat_pictures_picture_${counter}">
      <div class="form-group hidden flat_pictures_picture_cache_${counter}"><input class="form-control hidden" type="hidden" name="flat[pictures][picture${counter}_cache]" id="flat_pictures_picture_cache_${counter}"></div>
      </div>`;
      imageFields.innerHTML += imageField;
      counter += 1;
    });
  }
}

addPictureLine();


