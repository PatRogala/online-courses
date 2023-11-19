const updateUIWithRating = function(document, rating) {
  document.querySelectorAll("[data-rating-present]").
    forEach((element) => {
      element.classList.add("db")
      element.classList.remove("dn")
    });

  document.querySelectorAll("[data-no-rating-present]").
    forEach((element) => {
      element.classList.add("dn")
    });

  document.querySelectorAll("[data-rating-label]").
    forEach((element) => {
      element.innerHTML = `${rating}`
    });
}

const start = function(window) {
  const document = window.document
  window.addEventListener("turbo:load", () => {
    document.querySelectorAll(
      "button[data-rating]"
    ).forEach((element) =>{
      element.onclick = (event) => {
        const rating = element.innerText
        updateUIWithRating(document, rating)
      }
    });
  });
}

export const WidgetRatings = {
  start: start
}
