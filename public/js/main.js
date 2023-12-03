const tabsBox = document.querySelector(".tabs-box"),
    arrowIcons = document.querySelectorAll(".icon i");

let isDragging = false;

/**
 * Handles the visibility of arrow icons based on the scroll value.
 * @param {number} scrollVal - The current scroll value of tabsBox.
 */
const handleIcons = (scrollVal) => {
  let maxScrollableWidth = tabsBox.scrollWidth - tabsBox.clientWidth;
  arrowIcons[0].parentElement.style.display = scrollVal <= 0 ? "none" : "flex";
  arrowIcons[1].parentElement.style.display =
    maxScrollableWidth - scrollVal <= 1 ? "none" : "flex";
};

/**
 * Event listener for arrow icons to handle scrolling.
 */
arrowIcons.forEach((icon) => {
  icon.addEventListener("click", () => {
    let scrollWidth = (tabsBox.scrollLeft += icon.id === "left" ? -340 : 340);
    handleIcons(scrollWidth);
  });
});

/**
 * Handles dragging behavior when the mouse is moved.
 * @param {MouseEvent} e - The mouse event.
 */
const dragging = (e) => {
  if (!isDragging) return;

  tabsBox.classList.add("dragging");
  tabsBox.scrollLeft -= e.movementX;
  handleIcons(tabsBox.scrollLeft);
};

/**
 * Stops the dragging behavior when the mouse is released.
 */
const dragStop = () => {
  isDragging = false;
  tabsBox.classList.remove("dragging");
};

// Event listeners for dragging behavior
tabsBox.addEventListener("mousedown", () => (isDragging = true));
tabsBox.addEventListener("mousemove", dragging);
document.addEventListener("mouseup", dragStop);