// function sum() {
//     let sum = 0;
//     for (let i = 0; i < arguments.length; i++) {
//         sum += arguments[i];
//     }
//     return sum;
// };

// console.log(sum(1, 2, 3, 4)); //=== 10;
// console.log(sum(1, 2, 3, 4, 5)); // === 15;

function sum(...args) {
    return args.reduce((acc, ele) => acc + ele);
}

// console.log(sum(1, 2, 3, 4)); //=== 10;
// console.log(sum(1, 2, 3, 4, 5)); // === 15;

Function.prototype.curry = function (numArgs) {
    const args = [];
    const ogFunc = this;

    return function _curriedArgs (arg) {
        args.push(arg);
        if(args.length === numArgs){
            return ogFunc(...args);
        } else {
            return _curriedArgs;
        }
    }

}

s = sum.curry(4);

s(1);
s(2);
s(3);
console.log(s(4));

// console.log(sum.curry(1)(2)(3));