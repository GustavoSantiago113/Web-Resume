// Scroll to section function
function scrollToSection(sectionId) {
  const section = document.getElementById(sectionId);
  if (section) {
    // Get the header height
    const headerHeight = document.querySelector('.header').offsetHeight;
    
    // Get the element's position relative to the viewport
    const elementPosition = section.getBoundingClientRect().top;
    
    const sectionMarginTop = parseFloat(getComputedStyle(section).marginTop);
    
    // Get the current scroll position
    const offsetPosition = elementPosition + window.pageYOffset - headerHeight - sectionMarginTop;
    
    // Scroll to the adjusted position
    window.scrollTo({
      top: offsetPosition,
      behavior: 'smooth'
    });
  }
}

// Observer for animations when scrolling
document.addEventListener("DOMContentLoaded", function () {
    const observer = new IntersectionObserver(entries => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add("show");
            } else {
                entry.target.classList.remove("show");
            }
        });
    }, { threshold: 0.1 });

    document.querySelectorAll(".animate-section").forEach(element => {
        observer.observe(element);
    });
});

// Carousel
document.addEventListener("DOMContentLoaded", function () {
  var swiper = new Swiper(".mySwiper", {
    effect: "coverflow",
    grabCursor: true,
    centeredSlides: true,
    loop: true,
    slidesPerView: "auto",
    coverflowEffect: {
      rotate: 0,
      stretch: 0,
      depth: 150,
      modifier: 2.5,
      slideShadows: true,
    },
    autoplay:{
      delay:3000,
      disableOnInteraction:false,
    }
  
  });
});