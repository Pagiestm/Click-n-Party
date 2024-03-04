document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.add-to-favorites').forEach(function(heart) {
        heart.addEventListener('click', function(event) {
            event.preventDefault();
            var locationId = this.dataset.locationId;
            var isFavorite = heart.classList.contains('fas');

            var url = isFavorite ? '/remove-from-favorites' : '/add-to-favorites';
            var method = isFavorite ? 'DELETE' : 'POST';

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