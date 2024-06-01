document.querySelectorAll('.categorie').forEach(function(categorie) {
    categorie.addEventListener('click', function() {
        const categorieId = this.dataset.categorieId;
        let hasVisibleLocation = false;
        document.querySelectorAll('.location').forEach(function(location) {
            if (location.dataset.categorieIds.split(',').includes(categorieId)) {
                location.classList.remove('hidden');
                hasVisibleLocation = true;
            } else {
                location.classList.add('hidden');
            }
        });

        const messageElement = document.getElementById('noLocationsMessage');
        if (!hasVisibleLocation) {
            if (messageElement) {
                messageElement.classList.remove('hidden');
            }
        } else {
            if (messageElement) {
                messageElement.classList.add('hidden');
            }
        }
    });
});