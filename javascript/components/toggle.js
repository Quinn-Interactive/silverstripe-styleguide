const $toggles = document.querySelectorAll('[data-sg-toggle]');
$toggles.forEach(($btn) => {
    $btn.addEventListener('click', () => {
        const id = $btn.dataset.sgToggle;
        const $target = document.getElementById(id);
        if ($target) {
            $target.classList.toggle('-hide');
        }
    });
});
