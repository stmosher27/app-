console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  type: 'GET',
  ulr: 'http://api.openweathermap.org/data/2.5/weather' +
  '?q=NY,NY&appid=23b37d22a95121e333891ca965f7fc32',
  success(data) {
    console.log("We have your weather!");
    console.log(data);
  },
  error() {
    console.error("Oh no!");
  }
});

console.log("Second console logs");
// Add another console log here, outside your AJAX request
