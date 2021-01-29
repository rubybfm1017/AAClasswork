Function.prototype.curry = function (numArgs) {
    const args = [];
    const ogFunc = this;

    return function _curriedArgs (arg) {
        args.push(arg);
        if(args.length === numArgs){
            return ogFunc.apply(this, args);
        } else {
            return _curriedArgs;
        }
    }

}

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