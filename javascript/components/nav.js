const $nav = document.querySelector('[data-nav]');
const $btn = document.querySelector('[data-nav-btn]');
const $lists = document.querySelectorAll('[data-nav-list]');
const $items = document.querySelectorAll('[data-nav-item]');

// add section classes
$lists.forEach(($list) => {
    const $active = $list.querySelector('[data-nav-item].-active');
    if ($active) {
        $list.classList.add('-section');
    }
});

// add open/close icons
$items.forEach(($item) => {
    const $sublist = $item.querySelector('[data-nav-list]');
    if ($sublist && !$sublist.classList.contains('-section')) {
        const $button = document.createElement('button');
        $button.classList.add('sg-nav__toggle');
        $button.textContent = 'show';
        $button.addEventListener('click', () => {
            $sublist.classList.toggle('-open');
            $button.classList.toggle('-open');
            $button.textContent = $sublist.classList.contains('-open') ? 'hide' : 'show';
        });
        $item.prepend($button);
    }
});


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
