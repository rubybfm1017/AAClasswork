Array.prototype.uniq = function() {
  let newArray = [];

  for (let i = 0; i < this.length; i++) {
    if (!newArray.includes(this[i])) {
      newArray.push(this[i]);
    }
  }

  return newArray;
}


Array.prototype.twoSum = function() {
  let newArray = []

  for (let i = 0; i < this.length; i++) {
    for (let j = (i+1); j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        newArray.push([i, j]);
      }
    }  
  }

  return newArray;
} 

Array.prototype.transpose = function() {
  let transposedArray = [];
    for(let i = 0; i < this[0].length; i++){
        transposedArray.push([]);
    }

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[i].length; j++) {
      transposedArray[j][i] = this[i][j];
    }
  }


  return transposedArray;
}

// for (let i = 0; i < this[0].length; i++) {
//   for (let j = i; j < this.length; j++) {
//     transposedArray[j].push(this[j][i]);
//   }
// }
// console.log([[1,2,3], ["a","b","c"]].transpose())

// [[1, "a", 4],
// [2, "b", 5],
// [3, "c", 6]]



// console.log([1,2,2,3,3,3].uniq())