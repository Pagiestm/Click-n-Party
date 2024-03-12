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