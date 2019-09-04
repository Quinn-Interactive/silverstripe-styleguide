const $nav = document.querySelector('[data-nav]');
const $btn = document.querySelector('[data-nav-btn]');

if ($btn && $nav) {
    // add event listener to the btn
    $btn.addEventListener('click', () => {
        $nav.classList.toggle('-hide');
    });

    // if we open on a mobile device, start with the nav hidden
    const mobileQuery = window.matchMedia('(max-width: 768px)');
    if (mobileQuery.matches) {
        $nav.classList.add('-hide');
    }
}
