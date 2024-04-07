document.addEventListener('DOMContentLoaded', function () {
    let openMapButton = document.getElementById('openMapButton');
    let footer = document.getElementById('footer');

    window.addEventListener('scroll', function () {
        let rect = footer.getBoundingClientRect();
        if (rect.top < window.innerHeight) {
            openMapButton.style.transform = 'translate(-50%, 500%)';
        } else {
            openMapButton.style.transform = 'translate(-50%, -50%)';
        }
    });

});