const loading = () => {
  window.onload = function() {
    console.log("hey!");
    document.querySelector("#pills-profile-tab").click();
  };
};

export { loading };

