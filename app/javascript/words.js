document.addEventListener('DOMContentLoaded', function() {
  const contentPosts = document.querySelectorAll('.content_post');

  contentPosts.forEach(function(post) {
    const koreanElement = post.querySelector('.korean-word');
    const japaneseElement = post.querySelector('.japanese-word');

    post.addEventListener('mouseover', function() {
      koreanElement.style.display = 'none';
      japaneseElement.style.display = 'block';
    });

    post.addEventListener('mouseout', function() {
      koreanElement.style.display = 'block';
      japaneseElement.style.display = 'none';
    });
  });
});