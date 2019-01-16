const changeNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-wagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-wagon-green');
      } else {
        navbar.classList.remove('navbar-wagon-green');
      }
    });
  }
};

export {
  changeNavbarOnScroll
};