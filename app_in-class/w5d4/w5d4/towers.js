const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor() {
    this.towers = [[3,2,1],[],[]];
  }

  run(cb) {

    this.promptMove( (startTowerIdx, endTowerIdx) => {
      if (this.isValidMove(startTowerIdx, endTowerIdx)) {
        this.move(startTowerIdx, endTowerIdx);
        if (!this.isWon())
          this.run(cb);
        else {
          reader.close();
          cb();
        }
      } else {
        console.log("Invalid move! Try again.");
        this.run(cb);
      }
    });
  }

  promptMove(cb) {
    this.print();
    reader.question("What tower move from?", (answer1) => {
      reader.question("What tower move to?", (answer2) => {
        cb(parseInt(answer1), parseInt(answer2));
      });
    });
  }

  move(startTowerIdx, endTowerIdx) {
    let disc = this.towers[startTowerIdx].pop();
    this.towers[endTowerIdx].push(disc);
  }

  isWon() {
    return (this.towers[1].length === 3 || this.towers[2].length === 3);
  }

  isValidMove(startTowerIdx, endTowerIdx) {
    if ((startTowerIdx < 0 || startTowerIdx >= this.towers.length) ||
      (endTowerIdx < 0 || endTowerIdx >= this.towers.length)) {
        return false;
    }
    let startTower = this.towers[startTowerIdx];
    let endTower = this.towers[endTowerIdx];
    if (startTower.length === 0) {
      return false;
    }
    if (endTower.length === 0) {
      return true;
    }
    return startTower[startTower.length - 1] < endTower[endTower.length - 1];
  }

  print() {
    console.log(JSON.stringify(this.towers));
    // console.log(`Tower 1: ${this.towers[0]}`);
    // console.log(`Tower 2: ${this.towers[1]}`);
    // console.log(`Tower 3: ${this.towers[2]}`);
  }
}

new Game().run(() => console.log('You win!'));
