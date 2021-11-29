import $ from 'jquery';

const postSubmit = () => {
  const element = document.querySelector('#post_comment');
  element.addEventListener('keyup', function(event){
    if (event.key == "Enter") {
      event.preventDefault();
      console.log(event)
      $("#new_post").submit();
    }
  })
};



export { postSubmit };
