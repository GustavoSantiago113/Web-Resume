// Scroll to section function
function scrollToSection(sectionId) {
  const section = document.getElementById(sectionId);
  if (section) {
    // scroll-margin-top in the CSS keeps the section clear of the sticky header
    section.scrollIntoView({ behavior: 'smooth', block: 'start' });
    history.replaceState(null, '', '#' + sectionId);
  }
}

document.addEventListener("DOMContentLoaded", function () {

    // Nav links and the scroll cue scroll smoothly instead of jumping
    document.querySelectorAll("[data-target]").forEach(link => {
        link.addEventListener("click", event => {
            event.preventDefault();
            scrollToSection(link.dataset.target);
        });
    });

    document.querySelector(".header-brand").addEventListener("click", event => {
        event.preventDefault();
        window.scrollTo({ top: 0, behavior: 'smooth' });
        history.replaceState(null, '', location.pathname);
    });

    // Observer for animations when scrolling (each section fades in once)
    const observer = new IntersectionObserver((entries, obs) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add("show");
                obs.unobserve(entry.target);
            }
        });
    }, { threshold: 0.1 });

    document.querySelectorAll(".animate-section").forEach(element => {
        observer.observe(element);
    });

    // Highlight the nav link of the section currently on screen
    const navLinks = document.querySelectorAll(".header-button");
    const spy = new IntersectionObserver(entries => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                navLinks.forEach(link => {
                    const active = link.dataset.target === entry.target.id;
                    link.classList.toggle("active", active);
                    if (active) {
                        link.setAttribute("aria-current", "true");
                        // On phones the nav scrolls sideways; keep the active link in view
                        const nav = link.parentElement;
                        nav.scrollTo({ left: link.offsetLeft - 16, behavior: 'smooth' });
                    } else {
                        link.removeAttribute("aria-current");
                    }
                });
            }
        });
    }, { rootMargin: "-45% 0px -50% 0px" });

    document.querySelectorAll(".page-section").forEach(section => spy.observe(section));

    // Project category filters
    const chips = document.querySelectorAll(".filter-chip");
    const groups = document.querySelectorAll(".project-group");
    chips.forEach(chip => {
        chip.addEventListener("click", () => {
            const filter = chip.dataset.filter;
            chips.forEach(c => {
                c.classList.toggle("active", c === chip);
                c.setAttribute("aria-pressed", c === chip ? "true" : "false");
            });
            groups.forEach(group => {
                const visible = filter === "all" || group.dataset.category === filter;
                group.hidden = !visible;
                if (visible) group.classList.add("show");
            });
        });
    });

    // Back to top button
    const backToTop = document.querySelector(".back-to-top");
    const toggleBackToTop = () => {
        backToTop.classList.toggle("visible", window.scrollY > window.innerHeight * 0.8);
    };
    window.addEventListener("scroll", toggleBackToTop, { passive: true });
    toggleBackToTop();
    backToTop.addEventListener("click", () => {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
});
