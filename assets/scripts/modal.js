document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('dropdownButton').addEventListener('click', function () {
        document.getElementById('dropdownMenu').classList.toggle('hidden');
    });

    document.addEventListener('click', function (event) {
        if (!dropdownButton.contains(event.target) && !dropdownMenu.contains(event.target)) {
            dropdownMenu.classList.add('hidden');
        }
    });

    document.getElementById('openImagesModal').addEventListener('click', function() {
        document.getElementById('imagesModal').classList.remove('hidden');
    });

    document.getElementById('closeImagesModal').addEventListener('click', function () {
        document.getElementById('imagesModal').classList.add('hidden');
    });

    document.getElementById('openDescriptionButton').addEventListener('click', function () {
        document.getElementById('descriptionModal').style.display = "block";
    });

    document.getElementById('closeDescriptionModal').addEventListener('click', function () {
        document.getElementById('descriptionModal').style.display = "none";
    });
});