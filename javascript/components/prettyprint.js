// cspell:words codeblocks
// System already adds classes to prettify example html code.
// We just need to help with the markdown stuff.
const $codeblocks = document.querySelectorAll('pre code');
$codeblocks.forEach(($block) => {
    $block.classList.add('prettyprint');
});
