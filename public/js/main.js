//Copy button
const selection = window.getSelection(),
  range = document.createRange(),
  url = document.getElementById('urlContainer');

// Assign click event to the button with ID 'copyButton'
document.addEventListener('DOMContentLoaded', () => {
  const copyButton = document.getElementById('copy-btn');

  if (copyButton) {
    copyButton.addEventListener('click', () => {

      range.selectNodeContents(url);
      selection.removeAllRanges();
      selection.addRange(range);

      const successful = document.execCommand('copy');

      if (successful) {
        alert('¡URL copiada!');
      }
    });
  }
});

//scrollable tabs
const tabsBox = document.querySelector(".tabs-box"),
  arrowIcons = document.querySelectorAll(".icon i");

let isDragging = false;
let debounceTimer;


/**
 * Handles the visibility of arrow icons based on the scroll value.
 * @param {number} scrollVal - The current scroll value of tabsBox.
 */
const handleIcons = (scrollVal) => {
  let maxScrollableWidth = tabsBox.scrollWidth - tabsBox.clientWidth;

  arrowIcons[0].parentElement.style.display = scrollVal <= 0 ? "none" : "flex";
  arrowIcons[1].parentElement.style.display = maxScrollableWidth - scrollVal <= 1 ? "none" : "flex";
}

/**
 * Event listener for arrow icons to handle scrolling.
 */
arrowIcons.forEach((icon) => {
  icon.addEventListener("click", () => {
    // if clicked icon is left, reduce 350 from tabsBox scrollLeft else add
    let scrollWidth = tabsBox.scrollLeft += icon.id === "left" ? -340 : 340;
    handleIcons(scrollWidth);
  });
});