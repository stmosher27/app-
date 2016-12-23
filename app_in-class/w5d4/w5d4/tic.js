const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Board {
  constructor() {
    this.grid = [new Array(3), new Array(3), new Array(3)];
  }

  print() {
    let newArr;
    for (let i = 0; i < this.grid.length; i++) {
      let row = [];
      for (let j = 0; j < this.grid[i].length; j++) {
        let el = this.grid[i][j];
        row.push(el ? el : "_");
      }
      console.log(row);
    }
  }

  won() {
    return this.checkRows() || this.checkCols() || this.checkDiags();
  }

  checkRows() {
    for (let row = 0; row < this.grid.length; row++) {
      if (this.checkRow(row)) {
        return true;
      }
    }
    return false;
  }

  checkRow(row) {
    let mark = this.grid[row][0];
    for (let col = 1; col < this.grid.length; col++) {
      if (this.grid[row][col] === undefined || this.grid[row][col] !== mark) {
        return false;
      }
    }
    return true;
  }

  checkCols() {
    for (let col = 0; col < this.grid[0].length; col++) {
      if(this.checkCol(col)) {
        return true;
      }
    }
    return false;
  }

  checkCol(col) {
    let mark = this.grid[0][col];
    for (let row = 1; row < this.grid.length; row++) {
      if (this.grid[row][col] === undefined || this.grid[row][col] !== mark) {
        return false;
      }
    }
    return true;
  }

  checkDiags() {
    let first = (this.grid[0][0] === undefined || this.grid[1][1] === undefined || this.grid[2][2] === undefined);
    if (!first && (this.grid[0][0] === this.grid[1][1] && this.grid[1][1] === this.grid[2][2])) {
      return true;
    }
    let second = (this.grid[0][2] === undefined || this.grid[1][1] === undefined || this.grid[2][0] === undefined);
    if (!second && (this.grid[0][2] === this.grid[1][1] && this.grid[1][1] === this.grid[2][0])) {
      return true;
    }
    return false;
  }

  empty(pos) {
    let row = pos[0];
    let col = pos[1];
    return this.grid[row][col] ? true : false;
  }

  placeMark(pos, mark) {
    let row = pos[0];
    let col = pos[1];
    this.grid[row][col] = mark;
  }
}

class Game {
  constructor(player1, player2) {
    this.player1 = player1;
    this.player2 = player2;
    this.currentMark = 'X';
    this.board = new Board();
    this.currentPlayer = this.player1;
  }

  switchMark() {
    this.currentMark = this.currentMark === 'X' ? 'O' : 'X';
  }

  play(cb) {
    this.board.print();
    this.currentPlayer.prompt((move) => {
      this.board.placeMark(move, this.currentMark);
      this.switchPlayers();
      if (this.board.won()) {
        this.board.print();
        this.switchPlayers();
        reader.close();
        cb(this.currentPlayer.name);
      } else {
        this.play(cb);
      }
    });
  }

  switchPlayers() {
    this.switchMark();
    this.currentPlayer = this.currentPlayer === this.player1 ?
      this.player2 : this.player1;
  }
}

class Player {
  constructor(name) {
    this.name = name;
  }

  prompt(cb) {
    let pos;
    reader.question("Where move?", (answer) => {
      cb(answer.split(",").map(el => parseInt(el)));
    });
    return pos;
  }
}


new Game(new Player('Squirmy'), new Player('Jesse')).play((el) => console.log(`${el} has won!`));
