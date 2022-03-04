// 読み込み順のため先にDOMContentLoadedにする
document.addEventListener('DOMContentLoaded', function () {

    // functionで使うために変数に
    const primaryNav = document.querySelector(".primary-navigation");
    const navToggle = document.querySelector(".mobile-nav-toggle");

    // 小さい画面の時にNavBarを開くためのfunction
    navToggle.addEventListener("click", () => {
      const visibility = primaryNav.getAttribute('data-visible');

      if (visibility === "false") {
        primaryNav.setAttribute('data-visible', true);
        navToggle.setAttribute('aria-expanded', true);
      } else if (visibility === "true") {
        primaryNav.setAttribute('data-visible', false);
        navToggle.setAttribute('aria-expanded', false);
      }
    });
});