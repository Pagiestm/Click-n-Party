document.addEventListener('DOMContentLoaded', function () {
    const dropdownButton = document.getElementById('dropdownButton');
    const openImagesModal = document.getElementById('openImagesModal');
    const closeImagesModal = document.getElementById('closeImagesModal');
    const openDescriptionButton = document.getElementById('openDescriptionButton');
    const closeDescriptionModal = document.getElementById('closeDescriptionModal');

    dropdownButton?.addEventListener('click', function () {
        document.getElementById('dropdownMenu').classList.toggle('hidden');
    });

    openImagesModal?.addEventListener('click', function() {
        document.getElementById('imagesModal').classList.remove('hidden');
    });

    closeImagesModal?.addEventListener('click', function () {
        document.getElementById('imagesModal').classList.add('hidden');
    });

    openDescriptionButton?.addEventListener('click', function () {
        document.getElementById('descriptionModal').style.display = "block";
    });

    closeDescriptionModal?.addEventListener('click', function () {
        document.getElementById('descriptionModal').style.display = "none";
    });

    document.addEventListener('click', function (event) {
        if (!dropdownButton.contains(event.target) && !dropdownMenu.contains(event.target)) {
            dropdownMenu.classList.add('hidden');
        }
    });
});