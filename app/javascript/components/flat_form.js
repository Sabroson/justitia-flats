function addPictureLine() {
  let counter = 0;
  const imageFields = document.getElementById("image-fields");
  if (imageFields) {
    const morePicturesButton = document.getElementById('more-pictures-button')

    morePicturesButton.addEventListener('click', (event) => {
      const imageField =`
      <div id="image-field">
        <div class="form-group string required flat_pictures_picture">
        <label class="form-control-label string required" for="flat_pictures_picture">Picture
        <abbr title="required">*</abbr>
        </label>
        <input class="form-control string required" type="text" name="flat[pictures][picture]_${counter}" id="flat_pictures_picture_${counter}"></div>
      <div class="form-group hidden flat_pictures_picture_cache">
      <input class="form-control hidden" type="hidden" name="flat[pictures][picture_cache]_${counter}" id="flat_pictures_picture_cache_${counter}"></div>
      </div>`;
      imageFields.innerHTML += imageField;
      counter += 1;
    });
  }
}

addPictureLine();
