document.addEventListener('DOMContentLoaded', function () {

  // Add click event listener for clicking the text
  var styleSheetWrapperEl = document.getElementById('login-page');
  styleSheetWrapperEl.addEventListener('click', function (e) {
    if (e.target.className !== 'textToCopy') return;

    var element = e.target;
    flashElement(element);
    copyText(element);
  });

    function copyText(element) {
      var textToCopy = element.innerText;
      var tempElement = document.createElement("textarea");
      tempElement.value = textToCopy;
      document.body.appendChild(tempElement);
      tempElement.select();
      document.execCommand("Copy");
      document.body.removeChild(tempElement);
    }

    function flashElement(element) {
      element.classList.add("flash");
      document.addEventListener("transitionend", function() {
        setTimeout(function() {
          element.classList.remove("flash");
        }, 1000);
      });
    }

});