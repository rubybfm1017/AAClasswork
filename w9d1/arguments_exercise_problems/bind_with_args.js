

// Function.prototype.myBind = function (ctx) {
    
//     const thisContext = this;
//     let bindTimeArgs = [...arguments].slice(1)

//     return function (){

//         return thisContext.apply(ctx, bindTimeArgs.concat([...arguments]));
//     };

// };

Function.prototype.myBind = function (ctx, ...bindTimeArgs) {
    const thisContext = this

    return function (...callTimeArgs) {

        return thisContext.apply(ctx, bindTimeArgs.concat(callTimeArgs))
    };
}

class Cat {
    constructor(name) {
      this.name = name;
    }
  
    says(sound, person) {
      console.log(`${this.name} says ${sound} to ${person}!`);
      return true;
    }
  }
  
  class Dog {
    constructor(name) {
      this.name = name;
    }
  }
  
  const markov = new Cat("Markov");
  const pavlov = new Dog("Pavlov");
  
  markov.says("meow", "Ned");
//   Markov says meow to Ned!
//   true
  
//   bind time args are "meow" and "Kush", no call time args
  markov.says.myBind(pavlov, "meow", "Kush")();
  // Pavlov says meow to Kush!
  // true
  
  // no bind time args (other than context), call time args are "meow" and "a tree"
  markov.says.myBind(pavlov)("meow", "a tree");
  // Pavlov says meow to a tree!
  // true
  
  // bind time arg is "meow", call time arg is "Markov"
  markov.says.myBind(pavlov, "meow")("Markov");
  // Pavlov says meow to Markov!
  // true
  
  // no bind time args (other than context), call time args are "meow" and "me"
  const notMarkovSays = markov.says.myBind(pavlov);
  notMarkovSays("meow", "me");
  // Pavlov says meow to me!
  // true

// let m = markov.says.bind(pavlov, 'meow', 'Kush');
// let f = markov.says.bind(pavlov);

// f('meow', 'Kush')
// f('hello', 'fabio');
// f();

// m();
// m();
// m();


