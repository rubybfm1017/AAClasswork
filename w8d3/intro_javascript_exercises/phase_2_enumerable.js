const NUMS = [1, 2, 3, 4, 5];

Array.prototype.myEach = function (callback) {
    
    for( let i = 0; i < this.length; i++ ) {
        callback(this[i]);
    }
}

// NUMS.myEach((num) => {
//     console.log(`square of ${num} is ${num * num}`);
//   });

Array.prototype.myMap = function (callback) {
    const mapArr = []

    this.myEach(element => mapArr.push(callback(element)));

    return mapArr;
}

// console.log(NUMS.myMap( num => num * num ));

Array.prototype.myReduce = function (callback, acc) {
    let arr = this;

    if (acc === undefined) {
        acc = arr[0];
        arr = arr.slice(1);
    }
    
    arr.myEach(el => acc = callback(acc, el));

    return acc;

}

console.log(NUMS.myReduce( (total, item) => total + item ) ); // 15

console.log(NUMS.myReduce( (total, item) => {
    total + item;
  }, 5)); // 20

  console.log(NUMS.myReduce(function(total, item) {
    total + item;
  }, 5)); // 20