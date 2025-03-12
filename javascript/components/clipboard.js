const els = document.querySelectorAll('[data-clipboard]');

const copyToClipboard = async (text) => {
    try {
        await navigator.clipboard.writeText(text);
        // Optional: Display a success message to the user
        alert('Text copied!');
    } catch (error) {
        console.error("Failed to copy to clipboard:", error);
        // Optional: Display an error message to the user
    }
};

els.forEach((el) => {
    const text = el.dataset.clipboard;
    el.addEventListener('click', (e) => {
       copyToClipboard(text);
    });
});
