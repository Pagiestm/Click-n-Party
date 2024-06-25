const baseurl = window.location.origin;
const currenturl = window.location.href;

if (baseurl == currenturl) {
    document.addEventListener('DOMContentLoaded', function () {
        let openMapButton = document.getElementById('openMapButton');
        let footer = document.getElementById('footer');
    
        window.addEventListener('scroll', function () {
            console.log(openMapButton)
            let rect = footer.getBoundingClientRect();
            if (rect.top < window.innerHeight) {
                openMapButton.style.transform = 'translate(-50%, 500%)';
            } else {
                openMapButton.style.transform = 'translate(-50%, -50%)';
            }
        });
    });
}