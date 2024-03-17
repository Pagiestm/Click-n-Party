document.querySelectorAll('.categorie').forEach(function(categorie) {
    categorie.addEventListener('click', function() {
        const categorieId = this.dataset.categorieId;
        document.querySelectorAll('.location').forEach(function(location) {
            if (location.dataset.categorieIds.split(',').includes(categorieId)) {
                location.classList.remove('hidden');
            } else {
                location.classList.add('hidden');
            }
        });
    });
});