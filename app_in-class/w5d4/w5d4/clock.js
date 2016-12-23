class Clock {
  constructor() {
    let date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();

    this.printTime();

    global.setInterval(() => this._tick(), 1000);
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.

    let hourStr = this.hours < 10 ? "0" + this.hours : this.hours;
    let minsStr = this.minutes < 10 ? "0" + this.minutes : this.minutes;
    let secsStr = this.seconds < 10 ? "0" + this.seconds : this.seconds;

    console.log(`${hourStr}:${minsStr}:${secsStr}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.seconds++;
    if (this.seconds > 59) {
      this.seconds = 0;
      this.minutes++;
      if (this.minutes > 59) {
        this.minutes = 0;
        this.hours++;
      }
    }
    this.printTime();
  }
}

const clock = new Clock();
