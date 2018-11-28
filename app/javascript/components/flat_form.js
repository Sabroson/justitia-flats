function addPictureLine() {
  let counter = 0;
  const pictureFields = document.getElementById("secondary-pictures");
  if (pictureFields) {
    const morePicturesButton = document.getElementById('more-pictures-button');
    morePicturesButton.addEventListener('click', (event) => {
      const pictureField =`
      <div id="picture-field">
      <input type="file" name="flat[pictures][picture${counter}]" id="flat_pictures_picture_${counter}">
      <div class="form-group hidden flat_pictures_picture_cache_${counter}"><input class="form-control hidden" type="hidden" name="flat[pictures][picture${counter}_cache]" id="flat_pictures_picture_cache_${counter}"></div>
      </div>`;
      pictureFields.insertAdjacentHTML("beforeend", pictureField);
      counter += 1;
      document.getElementById("supporting-picture-label").style = 'display: true;'
    });
  }
}

addPictureLine();


