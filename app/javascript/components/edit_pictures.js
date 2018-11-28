const pictureEditContainer = document.getElementById('picture-edit-container');
const deleteButtons = document.querySelectorAll('.delete-picture-btn');

if (pictureEditContainer){
  Array.from(deleteButtons).forEach(button => {
    deleteButtons.addEventListener('click', function(event) {
      location.reload();
      });
  });
}

