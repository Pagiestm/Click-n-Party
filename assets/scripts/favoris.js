document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.add-favoris').forEach(function(heart) {
        heart.addEventListener('click', function(event) {
            event.preventDefault();
            let locationId = this.dataset.locationId;
            let isFavorite = heart.classList.contains('fas');

            let url = isFavorite ? '/remove-favoris' : '/add-favoris';
            let method = isFavorite ? 'DELETE' : 'POST';

            fetch(url, {
                method: method,
                body: JSON.stringify({ locationId: locationId }),
                headers: { 'Content-Type': 'application/json' }
            }).then(function(response) {
                if (response.ok) {
                    heart.classList.toggle('fas');
                    heart.classList.toggle('far');
                } else {
                    console.error('Failed to toggle favorite');
                }
            });
        });
    });
});