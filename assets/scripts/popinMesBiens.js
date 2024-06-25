var deleteButtons = document.querySelectorAll('.delete-button');
deleteButtons.forEach(function (button) {
    button.addEventListener('click', function (e) {
        e.preventDefault();

        // Ajoute la classe 'active' au bouton 'Supprimer' cliqué
        button.classList.add('active');

        document.getElementById('delete-confirm-popin').classList.remove('hidden');
    });
});

document.getElementById('delete-confirm-yes')?.addEventListener('click', function () {
    var deleteButton = document.querySelector('.delete-button.active');
    if (deleteButton) {
        var deleteFormId = deleteButton.dataset.deleteForm;
        var deleteForm = document.getElementById(deleteFormId);
        if (deleteForm) {
            deleteForm.submit();
        }
    }
});

document.getElementById('delete-confirm-no')?.addEventListener('click', function () {
    document.getElementById('delete-confirm-popin').classList.add('hidden');
    var deleteButton = document.querySelector('.delete-button.active');
    if (deleteButton) {
        deleteButton.classList.remove('active');
    }
});