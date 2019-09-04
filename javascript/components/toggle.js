const $toggles = document.querySelectorAll('[data-toggle]');
$toggles.forEach(($btn) => {
    $btn.addEventListener('click', () => {
        const id = $btn.dataset.toggle;
        const $target = document.querySelector(`#${id}`);
        console.log($target);
        if ($target) {
            $target.classList.toggle('-hide');
        }
    });
});
