// Scroll to section function
function scrollToSection(sectionId) {
  const section = document.getElementById(sectionId);
  if (section) {
    // Get the header height
    const headerHeight = document.querySelector('.header').offsetHeight;
    
    // Get the element's position relative to the viewport
    const elementPosition = section.getBoundingClientRect().top;
    
    // Get the current scroll position
    const offsetPosition = elementPosition + window.pageYOffset - headerHeight;
    
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
                entry.target.classList.remove("show"); // Remove to re-trigger animation
            }
        });
    }, { threshold: 0.2 });

    document.querySelectorAll(".animate-section").forEach(element => {
        observer.observe(element);
    });
});

// Carousel
document.addEventListener("DOMContentLoaded", function () {
  var swiper = new Swiper(".swiper", {
    loop: true,
    centeredSlides: true,
    slidesPerView: 3,
    spaceBetween: 20,
    pagination: {
        el: ".swiper-custom-pagination",
        clickable: true,
    },
    navigation: {
        nextEl: "#nav-right",
        prevEl: "#nav-left"
    },
    breakpoints: {
        300: { slidesPerView: 1 },
        800: { slidesPerView: 1 },
        1000: { slidesPerView: 3 }
    },
    autoplay: {
        delay: 3000,       // Auto-slide every 3 seconds
        disableOnInteraction: false,
    }
})
});