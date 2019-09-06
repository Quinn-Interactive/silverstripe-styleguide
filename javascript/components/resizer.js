import interact from 'interactjs';
// https://interactjs.io
// https://github.com/taye/interact.js

interact('[data-sg-resizable]').resizable({
    edges: {
        right: true,
    },
    modifiers: [
        // keep the edges inside the parent
        interact.modifiers.restrictEdges({
            outer: 'parent',
            endOnly: true,
        }),

        // minimum size
        interact.modifiers.restrictSize({
            min: {
                width: 100,
                height: 50,
            },
        }),
    ],

    inertia: true,
}).on('resizemove', (event) => {
    const { width } = event.rect;
    const parentWidth = event.currentTarget.parentNode.offsetWidth;
    const percent = (width / parentWidth) * 100;
    Object.assign(event.target.style, {
        width: `${percent}%`,
    });
});
