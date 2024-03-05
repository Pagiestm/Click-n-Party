document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.add-favoris').forEach(function(heart) {
        heart.addEventListener('click', function(event) {
            event.preventDefault();
            let locationId = this.dataset.locationId;
            // Vérifie si l'élément a la classe 'fas', ce qui signifie qu'il est déjà favori
            let isFavorite = heart.classList.contains('fas');

            // vérification de l'URL et la méthode en fonction de si l'élément est déjà favori ou non
            let url = isFavorite ? '/remove-favoris' : '/add-favoris';
            let method = isFavorite ? 'DELETE' : 'POST';

            // Effectuez une requête fetch à l'URL avec la méthode et l'ID de l'emplacement
            fetch(url, {
                method: method,
                body: JSON.stringify({ locationId: locationId }),
                headers: { 'Content-Type': 'application/json' }
            }).then(function(response) {
                // Si la réponse est OK, basculez la classe de l'élément pour indiquer si c'est un favori ou non
                if (response.ok) {
                    heart.classList.toggle('fas');
                    heart.classList.toggle('far');
                }
                else if (response.status === 401) {
                    window.location.href = '/login';
                } 
                else {
                    console.error('Failed to toggle favorite');
                }
            });
        });
    });
});