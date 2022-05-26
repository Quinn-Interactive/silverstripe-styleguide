import delay from 'lodash/delay';

const $nav = document.querySelector('[data-sg-nav]');
const $btn = document.querySelector('[data-sg-nav-btn]');
const $lists = document.querySelectorAll('[data-sg-nav-list]');
const $items = document.querySelectorAll('[data-sg-nav-item]');
const $searchableLists = document.querySelectorAll('[data-sg-nav-searchable] [data-sg-nav-list]');
const $searchableItems = document.querySelectorAll('[data-sg-nav-searchable] [data-sg-nav-item]');

const cqReevaluate = () => {
    // reevaluate cq-prolyfill if we are using it
    // https://github.com/ausi/cq-prolyfill
    if (window.cqApi) {
        delay(() => {
            window.cqApi.reevaluate(false);
        }, 260);
    }
};

// add section classes
$lists.forEach(($list) => {
    const $active = $list.querySelector('[data-sg-nav-item].-active');
    if ($active) {
        $list.classList.add('-section');
    }
});

// add open/close icons
$items.forEach(($item) => {
    const $sublist = $item.querySelector('[data-sg-nav-list]');
    if ($sublist && !$sublist.classList.contains('-section') && !$sublist.classList.contains('-active')) {
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
        cqReevaluate();
    });

    // if we open on a mobile device, start with the nav hidden
    const mobileQuery = window.matchMedia('(max-width: 768px)');
    if (mobileQuery.matches) {
        $nav.classList.add('-hide');
        cqReevaluate();
    }
}

// style search
const $search = document.querySelector('[data-sg-nav-search]');
if ($search) {
    $search.addEventListener('input', () => {
        const val = $search.value.toLowerCase();
        // if the val is empty, return to normal
        if (!val) {
            $searchableLists.forEach(($list) => {
                $list.classList.remove('-searching');
                $list.classList.remove('-found');
            });
            $searchableItems.forEach(($item) => {
                $item.classList.remove('-searching');
                $item.classList.remove('-found');
            });
        } else {
            $searchableItems.forEach(($item) => {
                $item.classList.add('-searching');
                const $link = $item.querySelector(':scope > [data-sg-nav-link]');
                if ($link) {
                    const text = $link.textContent.toLowerCase();
                    if (text.indexOf(val) !== -1) {
                        $item.classList.add('-found');
                    } else {
                        $item.classList.remove('-found');
                    }
                }
            });
            $searchableLists.forEach(($list) => {
                $list.classList.add('-searching');
                if ($list.querySelector('[data-sg-nav-item].-found')) {
                    $list.classList.add('-found');
                    $list.parentNode.classList.add('-found');
                } else {
                    $list.classList.remove('-found');
                    $list.parentNode.classList.remove('-found');
                }
            });
        }
    });
}
