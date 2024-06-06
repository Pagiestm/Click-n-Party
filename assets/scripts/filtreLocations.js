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

        // Remove the 'active' class from all categories
        document.querySelectorAll('.categorie').forEach(function(otherCategorie) {
            otherCategorie.classList.remove('active');
            otherCategorie.querySelector('p').classList.remove('font-bold', 'border-b', 'border-black', 'pb-1');
        });

        // Add the 'active' class to the clicked category
        this.classList.add('active');
        this.querySelector('p').classList.add('font-bold', 'border-b', 'border-black', 'pb-1');
    });
});