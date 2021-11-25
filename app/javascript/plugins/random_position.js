function get_random(list) {
  return list[Math.floor((Math.random() * list.length))];
}



const randomPosition = () => {
  const image1 = document.getElementById('first')
  image1.style.left = `${get_random([0, 5, 10])}rem`;
  image1.style.top = `${get_random([0, 5])}rem`;
  image1.addEventListener('mouseover' , () => {
    image1.style.zIndex = '5'
  });

  image1.addEventListener('mouseout', () => {
    image1.style.zIndex = '1'
  });

  const image2 = document.getElementById('second')
  image2.style.left = `${get_random([25,30,35])}rem`;
  image2.style.top = `${get_random([12,16])}rem`;

  image2.addEventListener('mouseover', () => {
    image2.style.zIndex = '5'
  });

  image2.addEventListener('mouseout', () => {
    image2.style.zIndex = '2'
  });

  const image3 = document.getElementById('third')
  image3.style.left = `${ get_random([0, 5, 15, 10]) } rem`;
  image3.style.top = `${get_random([ 15, 10])}rem`;

  image3.addEventListener('mouseover', () => {
    image3.style.zIndex = '4'
  });

  image3.addEventListener('mouseout', () => {
    image3.style.zIndex = '3'
  });

  const image4 = document.getElementById('fourth')
  image4.style.left = `${get_random([30,35,40])}rem`;
  image4.style.top = `${get_random([5, 10])}rem`;

  image4.addEventListener('click', () => {
    image4.style.zIndex = '5'
  });

  image4.addEventListener('mouseout', () => {
    image4.style.zIndex = '4'
  });


};

export {randomPosition} ;
