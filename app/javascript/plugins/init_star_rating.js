import "jquery-bar-rating";
import $ from 'jquery';

const initStarRating = () => {
  $('#rating_rating').barrating({
    theme: 'css-stars',
    onSelect: (value, text, event) => {
      const form = $(".review_form"); // We are selecting the form on the page with its class
      console.log(form)
      form.submit(); // We submit the form with javascript

    }
  });
};

export { initStarRating };
