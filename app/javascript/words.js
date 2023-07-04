document.addEventListener('DOMContentLoaded', function() {
  const koreanElements = document.querySelectorAll('.content_post .korean-word');
  const japaneseElements = document.querySelectorAll('.content_post .japanese-word');

  koreanElements.forEach(function(element, index) {
    element.addEventListener('click', function() {
      if (japaneseElements[index].style.display === 'none') {
        japaneseElements[index].style.display = 'block';
        element.style.display = 'none';
      } else {
        japaneseElements[index].style.display = 'none';
        element.style.display = 'block';
      }
    });
  });
});
