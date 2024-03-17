document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.add-favoris').forEach(function (heart) {
        heart.addEventListener('click', function (event) {
            event.preventDefault();
            let locationId = this.dataset.locationId;
            let isFavorite = heart.getAttribute('fill') === 'green';

            let url = isFavorite ? '/remove-favoris' : '/add-favoris';
            let method = isFavorite ? 'DELETE' : 'POST';

            fetch(url, {
                method: method,
                body: JSON.stringify({ locationId: locationId }),
                headers: { 'Content-Type': 'application/json' }
            }).then(function (response) {
                // Toujours mettre à jour tous les cœurs après la réponse
                document.querySelectorAll('.add-favoris[data-location-id="' + locationId + '"]').forEach(function (updatedHeart) {
                    if (response.ok) {
                        if (isFavorite) {
                            updatedHeart.setAttribute('fill', 'rgba(0, 0, 0, 0.5)');
                            updatedHeart.setAttribute('stroke', 'white');
                        } else {
                            updatedHeart.setAttribute('fill', 'green');
                            updatedHeart.setAttribute('stroke', 'green');
                        }
                    } else if (response.status === 401) {
                        window.location.href = '/login';
                    } else {
                        console.error('Failed to toggle favorite');
                    }
                });
            });
        });
    });
});
