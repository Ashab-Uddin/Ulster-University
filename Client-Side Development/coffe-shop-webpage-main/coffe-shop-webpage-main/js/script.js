// NAV MENU 
let menu = document.querySelector('#menu-btn');
let navbar = document.querySelector('.navbar');

if (menu && navbar) {
  menu.onclick = () => {
    menu.classList.toggle('fa-times');
    navbar.classList.toggle('active');
  };
  window.onscroll = () => {
    menu.classList.remove('fa-times');
    navbar.classList.remove('active');
  };
}

// IMAGE SWAP (only if those elements exist on this page)
document.querySelectorAll('.image-slider img').forEach(img => {
  img.onclick = () => {
    const main = document.querySelector('.main-home-image');
    if (main) main.src = img.getAttribute('src');
  };
});

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
// booking part

 document.getElementById('bookingForm').addEventListener('submit', function(event) {
  event.preventDefault(); // Prevent page reload

  const form = event.target;
  const formData = new FormData(form);

  const newData = {
    name: formData.get('name'),
    email: formData.get('email'),
    number: formData.get('number'),
    startDate: formData.get('startDate'),
    endDate: formData.get('endDate'),
    message: formData.get('message')
  };

  // Step 1: Retrieve existing data or initialize empty array
  let existingData = JSON.parse(localStorage.getItem('bookingFormData')) || [];

  // Step 2: Append the new data
  existingData.push(newData);

  // Step 3: Save back to localStorage
  localStorage.setItem('bookingFormData', JSON.stringify(existingData));

  // Optional: Confirmation
  console.log('Form data added to localStorage array:', newData);

  // Reset form
  form.reset();
});



