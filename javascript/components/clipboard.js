import copy from 'copy-to-clipboard';

const els = document.querySelectorAll('[data-clipboard]');


els.forEach((el) => {
    const text = el.dataset.clipboard;
    el.addEventListener('click', (e) => {
       copy(text, {
        format: 'text/plain',
       });
    });
});
