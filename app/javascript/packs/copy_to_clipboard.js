document.addEventListener('DOMContentLoaded', function () {

  const mailToCopy = document.getElementById("mailToCopy");

  // var element = document.querySelector('td');
  // console.log(element.closest('div'));

    mailToCopy.addEventListener("click", () => {
      const tempElement = document.createElement("textarea");
      tempElement.value = mailToCopy.innerHTML;
      document.body.appendChild(tempElement);
      tempElement.select();
      document.execCommand("Copy");
      document.body.removeChild(tempElement);
    });

  const passwordToCopy = document.getElementById("passwordToCopy");

    passwordToCopy.addEventListener("click", () => {
      const tempElement = document.createElement("textarea");
      tempElement.value = passwordToCopy.innerHTML;
      document.body.appendChild(tempElement);
      tempElement.select();
      document.execCommand("Copy");
      document.body.removeChild(tempElement);
    });

});