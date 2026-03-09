// REVIEW SLIDER — scope to the review section and init only if present
if (document.querySelector('.review .review-slider')) {
  const reviews = new Swiper('.review .review-slider', {
    spaceBetween: 20,
    loop: true,
    grabCursor: true,
    pagination: {
      el: '.review .swiper-pagination', 
      clickable: true,
    },
    autoplay: {
      delay: 7500,
      disableOnInteraction: false,
    },
    breakpoints: {
      0:   { slidesPerView: 1 },
      768: { slidesPerView: 2 }
    }
  });
}
// -------------------- Cookie helpers --------------------
function setCookie(name, value, days, options = {}) {
  const { path = '/', SameSite = 'Lax', secure = (location.protocol === 'https:') } = options;
  const maxAge = days ? `; Max-Age=${days * 24 * 60 * 60}` : '';
  const secureAttr = secure ? '; Secure' : '';
  document.cookie = `${encodeURIComponent(name)}=${encodeURIComponent(value)}${maxAge}; Path=${path}; SameSite=${SameSite}${secureAttr}`;
}

function getCookie(name) {
  const target = encodeURIComponent(name) + '=';
  const found = document.cookie.split(';').map(c => c.trim()).find(c => c.startsWith(target));
  return found ? decodeURIComponent(found.slice(target.length)) : null;
}

function eraseCookie(name, path = '/') {
  document.cookie = `${encodeURIComponent(name)}=; Path=${path}; Max-Age=0`;
}

// Banner show/hide
function showCookieBannerIfNeeded() {
  const banner = document.getElementById('cookie-banner');
  if (banner) {
    banner.classList.add('show'); // সবসময় দেখাও
  }
}


function bindCookieBannerEvents() {
  const banner = document.getElementById('cookie-banner');
  if (!banner) return;

  const acceptBtn = document.getElementById('cookie-accept');
  const declineBtn = document.getElementById('cookie-decline');

  if (acceptBtn) {
    acceptBtn.addEventListener('click', () => {
      // setCookie('cookie_consent', 'accepted', 180);
      banner.classList.remove('show');
    });
  }
  if (declineBtn) {
    declineBtn.addEventListener('click', () => {
      // setCookie('cookie_consent', 'declined', 180);
      banner.classList.remove('show');
    });
  }
}

// Optional API
window.CookieConsent = {
  reset() {
    eraseCookie('cookie_consent');
    const banner = document.getElementById('cookie-banner');
    if (banner) banner.classList.add('show');
  },
  status() {
    return getCookie('cookie_consent');
  }
};
// -------------------- Init after DOM ready --------------------
function initCookieBanner() {
  bindCookieBannerEvents();
  showCookieBannerIfNeeded();
}
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initCookieBanner);
} else {
  initCookieBanner();
}