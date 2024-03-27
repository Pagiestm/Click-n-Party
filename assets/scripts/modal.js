document.addEventListener('DOMContentLoaded', function() {
    let modal = document.getElementById('myModal');
    let openModalButton = document.getElementById('openModal');

    openModalButton.addEventListener('click', function(event) {
        event.preventDefault();
        modal.classList.remove('hidden');
    });

    document.addEventListener('click', function(event) {
        if (event.target != modal && event.target != openModalButton && !modal.contains(event.target)) {
            modal.classList.add('hidden');
        }
    });
});

document.getElementById('openImagesModal').addEventListener('click', function() {
    document.getElementById('imagesModal').classList.remove('hidden');
});
  
document.getElementById('closeImagesModal').addEventListener('click', function() {
    document.getElementById('imagesModal').classList.add('hidden');
});

document.getElementById('openDescriptionButton').addEventListener('click', function() {
    document.getElementById('descriptionModal').style.display = "block";
});

document.getElementById('closeDescriptionModal').addEventListener('click', function() {
    document.getElementById('descriptionModal').style.display = "none";
});