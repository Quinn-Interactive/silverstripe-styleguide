// https://github.com/que-etc/resize-observer-polyfill
import ResizeObserver from 'resize-observer-polyfill';
import debounce from 'lodash/debounce';

const iframeResizer = ($iframe) => {
    const ref = $iframe.dataset.sgIframe;
    const $widthSpan = document.querySelector(`[data-sg-iframe-width="${ref}"]`);
    const $doc = $iframe.contentDocument
        ? $iframe.contentDocument
        : $iframe.contentWindow.document;
    const height = $doc.body.offsetHeight;
    $iframe.style.height = `${height}px`; // eslint-disable-line no-param-reassign
    if ($widthSpan) {
        $widthSpan.textContent = `${$doc.body.offsetWidth}px wide`;
    }
};

const iframeResizeAll = () => {
    const $iframes = document.querySelectorAll('[data-sg-iframe]');
    $iframes.forEach(($iframe) => {
        iframeResizer($iframe);

        // add a load event just in case
        $iframe.addEventListener('load', () => {
            iframeResizer($iframe);
        });
    });
};

// resize whenever a wrapper changes width
if (ResizeObserver) {
    const $wrappers = document.querySelectorAll('[data-sg-iframe-wrapper]');
    $wrappers.forEach(($wrapper) => {
        const $iframe = $wrapper.querySelector('[data-sg-iframe]');
        const ro = new ResizeObserver(debounce(() => {
            iframeResizer($iframe);
        }, 100));

        ro.observe($wrapper);
    });
}

iframeResizeAll();
